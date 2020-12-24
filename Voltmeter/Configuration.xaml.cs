using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    /// Interaction logic for Page1.xaml
    /// </summary>
    public partial class Configuration : Page
    {
        public Configuration()
        {
            InitializeComponent();
            SerialPort.Text = ConfigFile.configPortName;
            BaudRate.Text = ConfigFile.configBaudRate.ToString() + " kbps";
            LoadConfiguration();
        }

        private void LoadConfiguration()
        {
            TBtraceFilePath.Text = ConfigFile.configTraceFilePath;
            TraceFilePath.Text = ConfigFile.configTraceFilePath;

            switch (ConfigFile.configPortName)
            {
                case "COM1":
                    RBserialPortCOM1.IsChecked = true;    
                    break;
                case "COM2":
                    RBserialPortCOM2.IsChecked = true;
                    break;
                case "COM3":
                    RBserialPortCOM3.IsChecked = true;
                    break;
                case "COM4":
                    RBserialPortCOM4.IsChecked = true;
                    break;
                case "COM5":
                    RBserialPortCOM5.IsChecked = true;
                    break;
                case "COM6":
                    RBserialPortCOM6.IsChecked = true;
                    break;
                case "COM7":
                    RBserialPortCOM7.IsChecked = true;
                    break;
                case "COM8":
                    RBserialPortCOM8.IsChecked = true;
                    break;
                case "COM9":
                    RBserialPortCOM9.IsChecked = true;
                    break;
            }

            switch (ConfigFile.configBaudRate)
            {
                case 9600:
                    RBbaudRate9600.IsChecked = true;
                    break;
                case 19200:
                    RBbaudRate19200.IsChecked = true;
                    break;
                case 38400:
                    RBbaudRate38400.IsChecked = true;
                    break;
                case 57600:
                    RBbaudRate57600.IsChecked = true;
                    break;
                case 74880:
                    RBbaudRate74880.IsChecked = true;
                    break;
                case 115200:
                    RBbaudRate115200.IsChecked = true;
                    break;
            }
        }


        private void OnClickCloseButton(object sender, RoutedEventArgs e)
        {
            Voltmeter_Home homepage = new Voltmeter_Home();
            this.NavigationService.Navigate(homepage);
        }

        private void OnClickSaveButton(object sender, RoutedEventArgs e)
        {
        }

        private void OnClickOkButton(object sender, RoutedEventArgs e)
        {
            ConfigFile.configTraceFilePath = TBtraceFilePath.Text;
            TraceFilePath.Text = ConfigFile.configTraceFilePath;
        }

        private void OnReleaseSerialPortRadioButton(object sender, RoutedEventArgs e)
        {
            int index = sender.ToString().IndexOf("COM");
            string tempPortName = sender.ToString().Substring(index, 4);
            ConfigFile.configPortName = tempPortName;
            SerialPort.Text = ConfigFile.configPortName;
        }
        private void OnReleaseBaudRateRadioButton(object sender, RoutedEventArgs e)
        {

            int index = sender.ToString().IndexOf("Content:");
            string tempBaudRate = sender.ToString().Substring(index + 8, 5).Trim();

            ConfigFile.configBaudRate = int.Parse(tempBaudRate);
            BaudRate.Text = ConfigFile.configBaudRate.ToString() + " kbps";

            Console.WriteLine("###################");
            Console.WriteLine(tempBaudRate);
        }
    }
}


