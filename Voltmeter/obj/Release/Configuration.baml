   M S B A M L   `   `   `  ���� D  @Voltmeter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Voltmeter	Voltmeter      Voltmeter.Configuration   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     )localclr-namespace:Voltmeter       N� Title$  Configuration��.��� $��10,10,10,10q�.+��� -    ��Name$ Header��$��Configuration��$
��Left=�$	��Top=�
�������$��24(����	#FF353535$��2q����	#FF898989$	��160��$��45��$��
210,10,0,0q��� -    ��Name$ CloseButton��$��Close��$
��Left=�$��470,440,0,0q�$	��Top=�$	��100��$��50��$��Segoe UI Semibold)�$��24(����	#FF919090 �� 	ClickMode$ Press=��� -   $ 
SaveButton��$
��Save��$
��Left=�$��
10,440,0,0q�$	��Top=�$	��100��$��50��$��Segoe UI Semibold)�$��24(����	#FF919090$ Press=��� -   $ SerialPortLabel��$��Serial Port:��$
��Left=�$��	40,74,0,0q�$	��Top=�
������� J� RenderTransformOrigin$ 5.625,0.977&��� -    ��Name$ SerialPortStack��$
��Left=�$	��175��$��
40,100,0,0q�$	��Top=�$	��110��
�������.+�	� -    	�Name$ RBserialPortCOM1��$
��COM1��$��3,3,0,0q� 	� 	GroupName$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -   $ RBserialPortCOM2��$
��COM2��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -   $ RBserialPortCOM3��$
��COM3��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -	   $ RBserialPortCOM4��$
��COM4��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -
   $ RBserialPortCOM5��$
��COM5��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -   $ RBserialPortCOM6��$
��COM6��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -   $ RBserialPortCOM7��$
��COM7��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -   $ RBserialPortCOM8��$
��COM8��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)�	� -   $ RBserialPortCOM9��$
��COM9��$��3,3,0,0q�$ GroupSerialPort��$ Release=�$��Segoe UI Semibold)��� -   $ 	StatusBar��$��Config:��$
��Left=�$��
10,512,0,0q�$	��Top=�
���   �$ 5.625,0.977&�$	��560��$��28�����	#FF777777�� -    ��Name$ 
SerialPort��$
��Left=�$��
60,518,0,0q�$
��Wrap=�$��-----��$	��Top=�$��16��$��45��	 �� TextAlignment$	 Center=�$��Segoe UI Semibold)����	#FFB0B0B0�� -   $ BaudRate��$
��Left=�$��110,518,0,0q�$
��Wrap=�$��
----- kbps��$	��Top=�$��16��$��80��$	 Center=�$��Segoe UI Semibold)����	#FFB0B0B0�� -   $ BaudRateLabely��$��
Baud Rate:��$
��Left=�$��
199,74,0,0q�$	��Top=�
�������$ 5.625,0.977&��� -   $ BaudRateStack��$
��Left=�$	��175��$��200,100,0,0q�$	��Top=�$	��110��
�������.+�	� -   $ RBbaudRate9600��$
��9600��$��3,3,0,0q�$ GroupBaudRate��$ Release=�$��Segoe UI Semibold)�	� -   $ RBbaudRate19200��$��19200��$��3,3,0,0q�$ GroupBaudRate��$ Release=�$��Segoe UI Semibold)�	� -   $ RBbaudRate38400��$��38400��$��3,3,0,0q�$ GroupBaudRate��$ Release=�$��Segoe UI Semibold)�	� -   $ RBbaudRate57600��$��57600��$��3,3,0,0q�$ GroupBaudRate��$ Release=�$��Segoe UI Semibold)�	� -   $ RBbaudRate74880��$��74880��$��3,3,0,0q�$ GroupBaudRate��$ Release=�$��Segoe UI Semibold)�	� -   $ RBbaudRate115200��$��115200��$��3,3,0,0q�$ GroupBaudRate��$ Release=�$��Segoe UI Semibold)��� -   $ 	SaveLabel��$��(to config file)��$
��Left=�$��
23,485,0,0q�$	��Top=����	#FFCBCBCB$ 5.625,0.977&�$��10(���Z� �� -   
 ��Name$
 TBtraceFilePath��$
��Left=�$��
40,320,0,0q� �� TextWrapping$
 Wrap=�$	��---��$	��Top=�$	��400��$��16(��� -   $ TraceFilePathLabel��$��Must to end with " \"��$
��Left=�$��
40,343,0,0q�$	��Top=����	#FFCBCBCB$ 5.625,0.977&�$��10(���Z� �� -   $ OkButton��$��Ok��$
��Left=�$��451,320,0,0q�$	��Top=�$��40��$��23��$��Segoe UI Semibold)����	#FF919090$ Press=��� -   $ TraceFilePath��$
��Left=�$��195,518,0,0q�$
��Wrap=�$��-----------��$	��Top=�$��16��$	��300��$
	 Left=�$��Segoe UI Semibold)����	#FFB0B0B0