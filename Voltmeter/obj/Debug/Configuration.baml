   M S B A M L   `   `   `  ����D  @Voltmeter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Voltmeter	Voltmeter  5          Voltmeter.Configuration   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      )localclr-namespace:Voltmeter     5        N� Title$  Configuration��5
      .��5      � $��10,10,10,10q�6   .+�5   
   �� -   5         ��Name$ Header��5      $��Configuration��6    $
��Left=�68   $	��Top=�6S   
�������$��24(�6~   ���	#FF353535$��2q�6�   ���	#FF898989$	��160��6�   $��45��6�   $��
210,10,0,0q�6�   �� 5   
   -   5         ��Name$ CloseButton��5      $��Close��6&   $
��Left=�66   $��670,440,0,0q�6Q   $	��Top=�6f   $	��100��6~   $��50��6�   $��Segoe UI Semibold)�6�   $��24(�6�   ���	#FF919090 �� 	ClickMode$ Press=�6�   �� 5   
   -   5        $ 
SaveButton��5      $
��Save��6%   $
��Left=�64   $��
10,440,0,0q�6O   $	��Top=�6c   $	��100��6{   $��50��6�   $��Segoe UI Semibold)�6�   $��24(�6�   ���	#FF919090$ Press=�6�   �� 5   
   -   5        $ SerialPortLabel��5      $��Serial Port:��6)   $
��Left=�6@   $��	40,74,0,0q�6[   $	��Top=�6n   
������� J� RenderTransformOrigin$ 5.625,0.977&�6�   �� 5   
   -   5         ��Name$ SerialPortStack��5      $
��Left=�6.   $	��175��6I   $��
40,100,0,0q�6V   $	��Top=�6j   $	��110��6�   
�������.+�5      	� -   5         	�Name$ RBserialPortCOM1��5      $
��COM1��64   $��3,3,0,0q�6C    	� 	GroupName$ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -   5        $ RBserialPortCOM2��5      $
��COM2��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -   5        $ RBserialPortCOM3��5      $
��COM3��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -	   5        $ RBserialPortCOM4��5      $
��COM4��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -
   5        $ RBserialPortCOM5��5      $
��COM5��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -   5        $ RBserialPortCOM6��5      $
��COM6��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -   5        $ RBserialPortCOM7��5      $
��COM7��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -   5        $ RBserialPortCOM8��5      $
��COM8��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5      -   5        $ RBserialPortCOM9��5      $
��COM9��64   $��3,3,0,0q�6C   $ GroupSerialPort��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   5      �� 5   
   -   5        $ 	StatusBar��5      $��Config:��6#   $
��Left=�65   $��
10,512,0,0q�6P   $	��Top=�6d   
���   �$ 5.625,0.977&�6�   $	��760��6�   $��28��6�   ���	#FF7777776�   �� 5   
   -   5         ��Name$ 
SerialPort��5      $
��Left=�6(   $��
60,518,0,0q�6C   $
��Wrap=�6W   $��-----��6k   $	��Top=�6x   $��16��6�   $��45��6�   	 �� TextAlignment$	 Center=�6�   $��Segoe UI Semibold)�6�   ���	#FFB0B0B06�   �� 5   
   -   5        $ BaudRate��5      $
��Left=�6&   $��110,518,0,0q�6A   $
��Wrap=�6V   $��
----- kbps��6j   $	��Top=�6|   $��16��6�   $��80��6�   $	 Center=�6�   $��Segoe UI Semibold)�6�   ���	#FFB0B0B06�   �� 5   
   -   5        $ BaudRateLabely��5      $��
Baud Rate:��6(   $
��Left=�6=   $��
199,74,0,0q�6X   $	��Top=�6l   
�������$ 5.625,0.977&�6�   �� 5    
   -   5        $ BaudRateStack��5       $
��Left=�6,   $	��175��6G   $��200,100,0,0q�6T   $	��Top=�6i   $	��110��6�   
�������.+�5!      	� -   5        $ RBbaudRate9600��5!      $
��9600��62   $��3,3,0,0q�6A   $ GroupBaudRate��6R   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5"      -   5        $ RBbaudRate19200��5"      $��19200��63   $��3,3,0,0q�6C   $ GroupBaudRate��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5#      -   5        $ RBbaudRate38400��5#      $��38400��63   $��3,3,0,0q�6C   $ GroupBaudRate��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5$      -   5        $ RBbaudRate57600��5$      $��57600��63   $��3,3,0,0q�6C   $ GroupBaudRate��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5%      -   5        $ RBbaudRate74880��5%      $��74880��63   $��3,3,0,0q�6C   $ GroupBaudRate��6T   $ Release=�6�   $��Segoe UI Semibold)�6�   	� 5&      -   5        $ RBbaudRate115200��5&      $��115200��64   $��3,3,0,0q�6E   $ GroupBaudRate��6V   $ Release=�6�   $��Segoe UI Semibold)�6�   5'      �� 5(   
   -   5        $ 	SaveLabel��5(      $��(to config file)��6#   $
��Left=�6>   $��
23,485,0,0q�6Y   $	��Top=�6m   ���	#FFCBCBCB$ 5.625,0.977&�6�   $��10(�6�   ��6�   Z� �� 5)   
   -   5        
 ��Name$
 TBtraceFilePath��5)      $
��Left=�6+   $��
40,320,0,0q�6F    �� TextWrapping$
 Wrap=�6Z   $	��---��6n   $	��Top=�6y   $	��400��6�   $��16(�6�   �� 5*   
   -   5        $ TraceFilePathLabel��5*      $��Must to end with " \"��6,   $
��Left=�6V   $��
40,343,0,0q�6q   $	��Top=�6�   ���	#FFCBCBCB$ 5.625,0.977&�6�   $��10(�6�   ��6�   Z� �� 5+   
   -   5        $ OkButton��5+      $��Ok��6#   $
��Left=�60   $��451,320,0,0q�6K   $	��Top=�6`   $��40��6x   $��23��6�   $��Segoe UI Semibold)�6�   ���	#FF919090$ Press=�6�   �� 5,   
   -   5        $ TraceFilePath��5,      $
��Left=�6+   $��195,518,0,0q�6F   $
��Wrap=�6[   $��-----------��6o   $	��Top=�6�   $��16��6�   $	��500��6�   $
	 Left=�6�   $��Segoe UI Semibold)�6�   ���	#FFB0B0B06�   5-      5.      