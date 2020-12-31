using System;
using System.IO.Ports;
using System.Threading;

namespace Voltmeter
{
    public class SerialPortCommunication
    {
        static SerialPort _serialPort;

        private static int IOerrors = 0;
        private static int frameErrors = 0;

// --------------- open and close serial port

        public static bool OpenSerial()
        {
            SerialPort serialPort = new SerialPort();
            _serialPort = serialPort;
            _serialPort.PortName = ConfigFile.configPortName;
            _serialPort.BaudRate = ConfigFile.configBaudRate;
            _serialPort.Parity = Parity.None;
            _serialPort.StopBits = StopBits.One;
            _serialPort.DataBits = 8;
            _serialPort.Handshake = Handshake.None;

            _serialPort.ReadTimeout = 1000;

            try
            {
                _serialPort.Open();
            }
            catch
            {
                // handle ERROR
                return false;

            }
            
            IOerrors = 0;
            frameErrors = 0;
            
            return true;
        }
        public static void CloseSerial()
        {
            _serialPort.Close();
        }


 // --------------- read from serial port

        public static int[] ReadSerial()
        {
            int[] vOut = new int[] {0, 0, 0, IOerrors, frameErrors };  // status (0=dataReady; 1=noData; 100=timeoutError, 101=IOerror, 102=frameError), meter1, meter2, IOerrors, frameErrors

            byte[] rxBuffer = new byte[12];
            int frameSize = 12; //expected RX frame size
            int bufferSize = 0;
            int timeout = 100; // x 10ms, should be >= the TX frame interval from ESP

            while (timeout > 0 && bufferSize < frameSize) // wait for full frame (or more bytes)
            {
                bufferSize = _serialPort.BytesToRead;
                Thread.Sleep(10);
                timeout--;
            }

            if (bufferSize >= frameSize)  // received a full frame
            {
                //Console.Write("bufferSize=" + bufferSize.ToString() + " - frameSize=" + frameSize.ToString() + " -- ");
                for (int i = 0; i < bufferSize; i++) // read full frame into buffer
                {
                    try
                    {
                        rxBuffer[i] = (byte)_serialPort.ReadByte();
                        //Console.Write(rxBuffer[i] + ", ");
                    }
                    catch (System.IO.IOException)  // handle IO errors and return zero
                    {
                        _serialPort.DiscardInBuffer();
                        vOut[0] = 101;
                        IOerrors++;
                        vOut[3] = IOerrors;
                        return vOut;
                    }
                    catch (System.TimeoutException)  // handle timeout like IO errors
                    {
                        _serialPort.DiscardInBuffer();
                        vOut[0] = 101;
                        IOerrors++;
                        vOut[3] = IOerrors;
                        return vOut;
                    }
                }
                //Console.WriteLine(" ");
            }
            else if (bufferSize > 0) // received frame fragments
            {
                _serialPort.DiscardInBuffer();
                vOut[0] = 102;
                frameErrors++;
                vOut[4] = frameErrors;
                return vOut;
            }
            else // received no frame 
            {
                _serialPort.DiscardInBuffer();
                vOut[0] = 100;
                return vOut;
            }

            if (rxBuffer[0] == 1 && rxBuffer[1] == 174)  // check first two byte for 0x01 and 0xAE to identify frame order
            {

                vOut[0] = 0;
                vOut[1] = (rxBuffer[2] + (rxBuffer[3] * 256));
                vOut[2] = (rxBuffer[4] + (rxBuffer[5] * 256));
            }
            else // use last cached values is frame is invalid
            {
                vOut[0] = 102;
                frameErrors++;
                vOut[4] = frameErrors;
            }

            return vOut;
        }
    }
}
