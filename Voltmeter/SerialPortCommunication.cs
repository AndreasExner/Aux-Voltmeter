using System;
using System.IO.Ports;
using System.Threading;

namespace Voltmeter
{
    public class SerialPortCommunication
    {
        static SerialPort _serialPort;

        private static int[] vOutCache = new int[] {0, 0};
        private static int IOerrors = 0;
        private static int frameErrors = 0;


// --------------- open and close serial port

        public static bool OpenSerial()
        {
            _serialPort = new SerialPort();
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
            return true;
        }
        public static void CloseSerial()
        {
            _serialPort.Close();
        }


 // --------------- read from serial port

        public static int[] ReadSerial()
        {
            int[] vOut = new int[] {0, 0, 0, 0};

            byte[] rxBuffer = new byte[8];
            int frameSize = 8;
            int bufferSize = 0;
            int timeout = 10;

            while (bufferSize < 8)
            {
                bufferSize = _serialPort.BytesToRead;
                Thread.Sleep(100);
                timeout--;
                if (timeout <= 0) { break; }
            }

            for (int i = 0; i < frameSize; i++)
            {
                try
                {
                    rxBuffer[i] = (byte)_serialPort.ReadByte();
                }
                catch (System.IO.IOException)  // handle IO errors
                {
                    _serialPort.DiscardInBuffer();
                    vOut[0] = vOutCache[0];
                    vOut[1] = vOutCache[1];
                    IOerrors++;
                    vOut[2] = IOerrors;
                    vOut[3] = frameErrors;
                    return vOut;
                }
                catch (System.TimeoutException)  // handle timeout
                {
                    _serialPort.DiscardInBuffer();
                    vOut[0] = 0;
                    vOut[1] = 0;
                    vOut[2] = IOerrors;
                    vOut[3] = frameErrors;
                    return vOut;
                }
            }

            _serialPort.DiscardInBuffer(); // flush buffer after every successfull frame

            if (rxBuffer[0] == 1 && rxBuffer[1] == 174)  // check first two byte for 0x01 and 0xAE
            {
                vOut[0] = (rxBuffer[2] + (rxBuffer[3] * 256));
                vOut[1] = (rxBuffer[4] + (rxBuffer[5] * 256));
                vOutCache[0] = vOut[0];
                vOutCache[1] = vOut[1];
                vOut[3] = frameErrors;
                vOut[2] = IOerrors;
            }
            else // use last cached values is frame is invalid
            {
                vOut[0] = vOutCache[0];
                vOut[1] = vOutCache[1];
                frameErrors++;
                vOut[2] = IOerrors;
                vOut[3] = frameErrors;
            }

            return vOut;

        }
    }
}
