   M S B A M L   `   `   `  ���� D  @Voltmeter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Voltmeter	Voltmeter      Voltmeter.Voltmeter_Home   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     )localclr-namespace:Voltmeter       N� Title$  	Voltmeter��.��� $��10,10,10,10q�.+��� -    ��Name$ Meter1_Value��$
��Left=�$��70��$��
10,110,0,0q� �� TextWrapping$
 Wrap=�$��--,---��$	��Top=�$	��220��$��48(� �� MaxLines$ 1�� �� TextAlignment$ Center=��� -   $ Meter2_Value��$
��Left=�$��70��$��
10,250,0,0q�$
 Wrap=�$��--,---��$	��Top=�$	��220��$��48(�$ 1��$ Center=��� -    ��Name$ Meter1_Label��$��Kanal 1��$
��Left=�$��	10,80,0,0q�$	��Top=�
������� J� RenderTransformOrigin$ 5.625,0.977&��� -   $ Meter2_Label��$��Kanal 2��$
��Left=�$��
10,220,0,0q�$	��Top=�
��������� -   $ Meter1_Unit��$
��Volt��$
��Left=�$��235,107,0,0q�$	��Top=�
�������$��48(��� -   $ Meter2_Unit��$
��Volt��$
��Left=�$��235,247,0,0q�$	��Top=�
�������$��48(��� -   $ 	StatusBar��$��Status:��$
��Left=�$��
10,512,0,0q�$	��Top=�
���   �$ 5.625,0.977&�$	��560��$��28�����	#FF777777�� -    ��Name$ 
ExitButton��$
��Exit��$
��Left=�$��470,440,0,0q�$	��Top=�$	��100��$��50��$��Segoe UI Semibold)�$��24(����	#FF919090 �� 	ClickMode$ Press=��� -	   	 ��Name$	 IOerrors��$
��Left=�$��530,518,0,0q�$
��Wrap=�$	��---��$	��Top=����	#FFB0B0B0$��16��$��30��
 �� TextAlignment$
 Center=��� -
   $	 frameErrors��$
��Left=�$��444,518,0,0q�$
��Wrap=�$	��---��$	��Top=����	#FFB0B0B0$��16��$��30��$
 Center=��� -   $ Header��$��PC Voltmeter��$
��Left=�$	��Top=�
�������$��24(����	#FF353535$��2q����	#FF898989$	��160��$��45��$��
210,10,0,0q��� -   $ IOerrors_Label��$��
IO Errors:��$
��Left=�$��478,515,0,0q�$	��Top=�
���   �$ 5.625,0.977&�$��10(��� -   $ frameErrors_Label��$��Frame Errors:��$
��Left=�$��376,515,0,0q�$	��Top=�
���   �$ 5.625,0.977&�$��10(��� -   $ StartButton��$��Start��$
��Left=�$��
10,440,0,0q�$	��Top=�$	��100��$��50��$��Segoe UI Semibold)�$��24(����	#FF919090$ Press=��� -   $ 
StopButton��$
��Stop��$
��Left=�$��130,440,0,0q�$	��Top=�$	��100��$��50��$��Segoe UI Semibold)�$��24(����	#FF919090$ Press=��� -   $ ConfigButton��$��Config��$
��Left=�$��350,440,0,0q�$	��Top=�$	��100��$��50��$��Segoe UI Semibold)�$��24(����	#FF919090$ Press=��� -   $	 
SerialPort��$
��Left=�$��
60,518,0,0q�$
��Wrap=�$��-----��$	��Top=�$��16��$��45��$
 Center=�$��Segoe UI Semibold)����	#FFB0B0B0�� -   $	 BaudRate��$
��Left=�$��110,518,0,0q�$
��Wrap=�$��
----- kbps��$	��Top=�$��16��$��80��$
 Center=�$��Segoe UI Semibold)����	#FFB0B0B0�� -   $	 Status��$
��Left=�$��196,518,0,0q�$
��Wrap=�$��-----��$	��Top=�$��16��$��80��$
 Center=�$��Segoe UI Semibold)����	#FFB0B0B0