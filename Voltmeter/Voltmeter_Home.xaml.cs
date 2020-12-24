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

namespace Voltmeter
{
    /// <summary>
    /// Interaction logic for Voltmeter_Home.xaml
    /// </summary>
    public partial class Voltmeter_Home : Page
    {
        private static System.Timers.Timer aTimer;
        private static SolidColorBrush greenBrush = new SolidColorBrush(Color.FromRgb(145, 195, 153));
        private static SolidColorBrush mediumGrayBrush = new SolidColorBrush(Color.FromRgb(119, 119, 119));
        private static SolidColorBrush redBrush = new SolidColorBrush(Color.FromRgb(200, 115, 115));

        public Voltmeter_Home()
        {
            InitializeComponent();
            SerialPort.Text = ConfigFile.configPortName;
            BaudRate.Text = ConfigFile.configBaudRate.ToString() + " kbps";
        }

// masurement loop
            
        private void RefreshMeter(Object source, ElapsedEventArgs e) 
        { 
            int[] vOut = SerialPortCommunication.ReadSerial();
            Dispatcher.BeginInvoke(new Action(() => Meter1_Value.Text = (vOut[0] / 1000f).ToString("F3")));
            Dispatcher.BeginInvoke(new Action(() => Meter2_Value.Text = (vOut[1] / 1000f).ToString("F3")));
            Dispatcher.BeginInvoke(new Action(() => IOerrors.Text = vOut[2].ToString()));
            Dispatcher.BeginInvoke(new Action(() => frameErrors.Text = vOut[3].ToString()));
        }

// Buttons

        private void OnClickExitButton(object sender, RoutedEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

        private void OnClickStartButton(object sender, RoutedEventArgs e)
        {
            if (SerialPortCommunication.OpenSerial())
            {
                StatusBar.Background = greenBrush;
                aTimer = new System.Timers.Timer(500);
                aTimer.Elapsed += RefreshMeter;
                aTimer.AutoReset = true;
                aTimer.Enabled = true;
            }
            else
            {
                StatusBar.Background = redBrush;
            }
        }

        private void OnClickStopButton(object sender, RoutedEventArgs e)
        {
            StatusBar.Background = mediumGrayBrush;
            aTimer.Stop();
            aTimer.Dispose();
            Meter1_Value.Text = "--,---";
            Meter2_Value.Text = "--,---";
            IOerrors.Text = "0";
            frameErrors.Text = "0";
        }

        private void OnClickConfigButton(object sender, RoutedEventArgs e)
        {
            Configuration configurationPage = new Configuration();
            this.NavigationService.Navigate(configurationPage);
        }


    }
}
