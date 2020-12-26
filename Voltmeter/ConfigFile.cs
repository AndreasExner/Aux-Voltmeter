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
        private static readonly string configFilePath = Environment.GetEnvironmentVariable("APPDATA") + @"\Voltmeter";
        public static string configTraceFilePath = "n/a";
        public static string configPortName = "n/a";
        public static int configBaudRate = 0;

        public static bool GetConfig()
        {
            if (!File.Exists(configFilePath + @"\" + configFileName))
            {
                if(!CreateConfig())
                {
                    return false;
                }
            }
            else
            {
                if(!ReadConfig())
                {
                    return false;
                }
            }

            return true;
        }

        private static bool ReadConfig()
        {
            XmlDocument xmlDoc = new XmlDocument();

            try 
            {
                xmlDoc.Load(configFilePath + @"\" + configFileName); 
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

        public static bool SaveConfig()
        {
            XmlDocument xmlDoc = new XmlDocument();

            if (!File.Exists(configFilePath + @"\" + configFileName))
            {
                // ERROR
                return false;
            }

            try
            {
                xmlDoc.Load(configFilePath + @"\" + configFileName);
            }
            catch
            {
                // ERROR
                return false;
            }

            //XmlNamespaceManager nsmgr = new XmlNamespaceManager(xmlDoc.NameTable);

            XmlNode rootNode = xmlDoc.DocumentElement;
            XmlNode serial = rootNode.SelectSingleNode("serial");
            XmlNode traceFile = rootNode.SelectSingleNode("traceFile");
            XmlNode nodePortName = serial.SelectSingleNode("portName");
            XmlNode nodeBaudRate = serial.SelectSingleNode("baudRate");
            XmlNode nodeTraceFile = traceFile.SelectSingleNode("traceFilePath");

            nodePortName.InnerText = configPortName;
            nodeBaudRate.InnerText = configBaudRate.ToString();
            nodeTraceFile.InnerText = configTraceFilePath;

            xmlDoc.Save(configFilePath + @"\" + configFileName);

            return true;
        }

        private static bool CreateConfig()
        {
            if(!Directory.Exists(configFilePath))
            {
                try
                {
                    Directory.CreateDirectory(configFilePath);
                }
                catch
                {
                    // ERROR
                    return false;
                }
            }
            
            XmlDocument xmlDoc = new XmlDocument();
            
            XmlNode rootNode = xmlDoc.CreateElement("voltmeter");
            xmlDoc.AppendChild(rootNode);

            XmlNode serialNode = xmlDoc.CreateElement("serial");
            rootNode.AppendChild(serialNode);

            XmlElement portName = xmlDoc.CreateElement("portName");
            portName.InnerText = "COM1";
            serialNode.AppendChild(portName);

            XmlElement baudRate = xmlDoc.CreateElement("baudRate");
            baudRate.InnerText = "9600";
            serialNode.AppendChild(baudRate);

            XmlNode traceFile = xmlDoc.CreateElement("traceFile");
            rootNode.AppendChild(traceFile);

            XmlElement traceFilePath = xmlDoc.CreateElement("traceFilePath");
            traceFilePath.InnerText = @"D:\";
            traceFile.AppendChild(traceFilePath);

            try
            {
                xmlDoc.Save(configFilePath + @"\" + configFileName);
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
