using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace Voltmeter
{
    class ConfigFile
    {
        private static readonly string configFileName = @"voltmeter.xml";
        public static string configTraceFilePath = "n/a";
        public static string configPortName = "n/a";
        public static int configBaudRate = 0;


        public static bool GetConfig()
        {
            if (!File.Exists(configFileName))
            {
                CreateConfig();
            }
            else
            {
                ReadConfig();
            }

            return true;
        }

        private static bool ReadConfig()
        {
            XmlDocument xmlDoc = new XmlDocument();

            try 
            {
                xmlDoc.Load(configFileName); 
            }
            catch
            {
                // ERROR
                return false;
            }

            XmlNodeList portName = xmlDoc.GetElementsByTagName("portName");
            XmlNodeList baudRate = xmlDoc.GetElementsByTagName("baudRate");
            XmlNodeList traceFile = xmlDoc.GetElementsByTagName("traceFile");

            if (portName.Count < 1 || baudRate.Count < 1 || traceFile.Count < 1)
            {
                // ERROR
                return false;
            }
            else
            {
                configPortName = portName[0].InnerText;
                configTraceFilePath = traceFile[0].InnerText;
                configBaudRate = int.Parse(baudRate[0].InnerText);
            }

            return true;
        }

        private static bool CreateConfig()
        {
            XmlDocument xmlDoc = new XmlDocument();
            
            XmlNode rootNode = xmlDoc.CreateElement("voltmeter");
            xmlDoc.AppendChild(rootNode);

            XmlNode serialNode = xmlDoc.CreateElement("serial");
            rootNode.AppendChild(serialNode);

            XmlElement portName = xmlDoc.CreateElement("portName");
            portName.InnerText = "COM8";
            serialNode.AppendChild(portName);

            XmlElement baudRate = xmlDoc.CreateElement("baudRate");
            baudRate.InnerText = "57600";
            serialNode.AppendChild(baudRate);

            XmlNode traceFile = xmlDoc.CreateElement("traceFile");
            rootNode.AppendChild(traceFile);

            XmlElement traceFilePath = xmlDoc.CreateElement("traceFilePath");
            traceFilePath.InnerText = @"D:\";
            traceFile.AppendChild(traceFilePath);

            try
            {
                xmlDoc.Save(configFileName);
            }
            catch
            {
                // ERROR
                return false;
            }

            return true;
        }

    }
}
