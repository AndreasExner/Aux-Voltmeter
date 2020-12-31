using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Timers;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Threading;

namespace Voltmeter
{


    public partial class Voltmeter_Home : Page
    {
        private static readonly SolidColorBrush greenBrush = new SolidColorBrush(Color.FromRgb(145, 195, 153));
        private static readonly SolidColorBrush mediumGrayBrush = new SolidColorBrush(Color.FromRgb(119, 119, 119));
        private static readonly SolidColorBrush blackBrush = new SolidColorBrush(Color.FromRgb(0, 0, 0));
        private static readonly SolidColorBrush redBrush = new SolidColorBrush(Color.FromRgb(200, 115, 115));

        public Voltmeter_Home()
        {
            InitializeComponent();
            SerialPort.Text = ConfigFile.configPortName;
            BaudRate.Text = ConfigFile.configBaudRate.ToString() + " kbps";
        }

        // --------------- Refresh the voltmeter page

        public void RefreshMeter(int[] vOut)
        {
            string status = "n/a";

            switch (vOut[0])
            {
                case 0:
                    status = "dataReady"; break;
                case 1:
                    status = "noData"; break;
                case 100:
                    status = "timeout"; break;
                case 101:
                    status = "IOerror"; break;
                case 102:
                    status = "frameError"; break;
            }

            Dispatcher.BeginInvoke(new Action(() => Status.Text = status));
            Dispatcher.BeginInvoke(new Action(() => IOerrors.Text = vOut[3].ToString()));
            Dispatcher.BeginInvoke(new Action(() => frameErrors.Text = vOut[4].ToString()));

            if (vOut[0] == 0)
            {
                Dispatcher.BeginInvoke(new Action(() => Meter1_Value.Text = (vOut[1] / 1000f).ToString("F3")));
                Dispatcher.BeginInvoke(new Action(() => Meter2_Value.Text = (vOut[2] / 1000f).ToString("F3")));
                Dispatcher.BeginInvoke(new Action(() => Meter3_Value.Text = (vOut[3] / 1000f).ToString("F3")));
                Dispatcher.BeginInvoke(new Action(() => Meter4_Value.Text = (vOut[4] / 1000f).ToString("F3")));
            }
            else if (vOut[0] == 100)
            {
                Dispatcher.BeginInvoke(new Action(() => StatusBar.Background = redBrush));
                return;
            }

        }

        // --------------- Buttons

        private void OnClickExitButton(object sender, RoutedEventArgs e)
        {
            if (tMeasure == null)
            {
                System.Windows.Application.Current.Shutdown();
            }
            else
            {
                if (!tMeasure.IsAlive)
                {
                    System.Windows.Application.Current.Shutdown();
                }
            }
        }

        public void OnClickStartButton(object sender, RoutedEventArgs e)
        {
            if (tMeasure == null)
            {
                if (SerialPortCommunication.OpenSerial())
                {
                    StatusBar.Background = greenBrush;
                    StartButton.Foreground = mediumGrayBrush;
                    ConfigButton.Foreground = mediumGrayBrush;
                    ExitButton.Foreground = mediumGrayBrush;
                    tMeasure = StartMeasureLoop();
                }
                else
                {
                    StatusBar.Background = redBrush;
                }
            }
            else
            {
                if (!tMeasure.IsAlive)
                { 
                    if (SerialPortCommunication.OpenSerial())
                    {
                        StatusBar.Background = greenBrush;
                        StartButton.Foreground = mediumGrayBrush;
                        ConfigButton.Foreground = mediumGrayBrush;
                        ExitButton.Foreground = mediumGrayBrush;
                        tMeasure = StartMeasureLoop();
                    }
                    else
                    {
                        StatusBar.Background = redBrush;
                    }
                }
            }
        }

        private void OnClickStopButton(object sender, RoutedEventArgs e)
        {
            if (tMeasure != null)
            {
                if (tMeasure.IsAlive)
                {
                    tMeasure.Abort();
                    tMeasure.Join();
                    SerialPortCommunication.CloseSerial();
                }
            }
            StatusBar.Background = mediumGrayBrush;
            StartButton.Foreground = blackBrush;
            ConfigButton.Foreground = blackBrush;
            ExitButton.Foreground = blackBrush;
            Meter1_Value.Text = "--,---";
            Meter2_Value.Text = "--,---";
            Meter3_Value.Text = "--,---";
            Meter4_Value.Text = "--,---";
            IOerrors.Text = "0";
            frameErrors.Text = "0";
        }

        private void OnClickConfigButton(object sender, RoutedEventArgs e)
        {
            if (tMeasure == null)
            {
                Configuration configurationPage = new Configuration();
                this.NavigationService.Navigate(configurationPage);
            }
            else
            { 
                if (!tMeasure.IsAlive)
                {
                    Configuration configurationPage = new Configuration();
                    this.NavigationService.Navigate(configurationPage);
                }
            }
        }

        // --------------- Thread Control

        private Thread tMeasure;

        public Thread StartMeasureLoop()
        {
            MeasureLoopThreadWithState tws = new MeasureLoopThreadWithState(new MeasureCallback(ResultCallback));
            Thread tMeasure = new Thread(new ThreadStart(tws.MeasureLoopThread));
            tMeasure.Start();
            return tMeasure;
        }

        public void ResultCallback(int[] serialOut)
        {
            RefreshMeter(serialOut);
        }
    }

    public delegate void MeasureCallback(int[] serialOutCallback);
    public class MeasureLoopThreadWithState
    {
        private MeasureCallback callback;

        public MeasureLoopThreadWithState(MeasureCallback callbackDelegate)
        {
            callback = callbackDelegate;
        }

        public void MeasureLoopThread()
        {
            int[] serialOut = new int[] { 0, 0, 0, 0, 0 };

            while (serialOut[0] != 100)
            {
                serialOut = SerialPortCommunication.ReadSerial();
                callback(serialOut);
            }
        }
    }
}
