   M S B A M L   `   `   `  ����D  @Voltmeter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Voltmeter	Voltmeter  5          Voltmeter.Voltmeter_Home   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      )localclr-namespace:Voltmeter     5        N� Title$  	Voltmeter��5	      .��5      � $��10,10,10,10q�6   .+�5   
   �� -   5         ��Name$ Meter1_Value��5      $
��Left=�6(   $��70��6C   $��
10,110,0,0q�6O    �� TextWrapping$
 Wrap=�6c   $��--,---��6w   $	��Top=�6�   $	��220��6�   $��48(�6�    �� MaxLines$ 1��6�    �� TextAlignment$ Center=�6�   �� 5   
   -   5        $ Meter2_Value��5      $
��Left=�6(   $��70��6C   $��
10,250,0,0q�6O   $
 Wrap=�6c   $��--,---��6w   $	��Top=�6�   $	��220��6�   $��48(�6�   $ 1��6�   $ Center=�6�   �� 5   
   -   5         ��Name$ Meter1_Label��5      $��Kanal A��6&   $
��Left=�68   $��	10,80,0,0q�6S   $	��Top=�6f   
������� J� RenderTransformOrigin$ 5.625,0.977&�6�   �� 5   
   -   5        $ Meter2_Label��5      $��Kanal B��6&   $
��Left=�68   $��
10,220,0,0q�6S   $	��Top=�6g   
�������6   �� 5   
   -   5        $ Meter1_Unit��5      $
��Volt��6%   $
��Left=�64   $��235,107,0,0q�6O   $	��Top=�6d   
�������$��48(�6�   �� 5   
   -   5        $ Meter2_Unit��5      $
��Volt��6%   $
��Left=�64   $��235,247,0,0q�6O   $	��Top=�6d   
�������$��48(�6�   �� 5   
   -   5        $ 	StatusBar��5      $��Status:��6#   $
��Left=�65   $��
10,512,0,0q�6P   $	��Top=�6d   
���   �$ 5.625,0.977&�6�   $	��760��6�   $��28��6�   ���	#FF7777776�   �� 5   
   -   5         ��Name$ 
ExitButton��5      $
��Exit��6%   $
��Left=�64   $��670,440,0,0q�6O   $	��Top=�6d   $	��100��6|   $��50��6�   $��Segoe UI Semibold)�6�   $��24(�6�   ���	#FF919090 �� 	ClickMode$ Press=�6�   �� 5   
   -	   5        	 ��Name$	 IOerrors��5      $
��Left=�6&   $��732,518,0,0q�6A   $
��Wrap=�6V   $	��---��6j   $	��Top=�6u   ���	#FFB0B0B0$��16��6�   $��30��6�   
 �� TextAlignment$
 Center=�6�   �� 5   
   -
   5        $	 frameErrors��5      $
��Left=�6)   $��646,518,0,0q�6D   $
��Wrap=�6Y   $	��---��6m   $	��Top=�6x   ���	#FFB0B0B0$��16��6�   $��30��6�   $
 Center=�6�   �� 5   
   -   5        $ Header��5      $��PC Voltmeter��6    $
��Left=�67   $	��Top=�6R   
�������$��24(�6}   ���	#FF353535$��2q�6�   ���	#FF898989$	��160��6�   $��45��6�   $��
210,10,0,0q�6�   �� 5   
   -   5        $ IOerrors_Label��5      $��
IO Errors:��6(   $
��Left=�6=   $��680,515,0,0q�6X   $	��Top=�6m   
���   �$ 5.625,0.977&�6�   $��10(�6�   �� 5   
   -   5        $ frameErrors_Label��5      $��Frame Errors:��6+   $
��Left=�6C   $��578,515,0,0q�6^   $	��Top=�6s   
���   �$ 5.625,0.977&�6�   $��10(�6�   �� 5   
   -   5        $ StartButton��5      $��Start��6&   $
��Left=�66   $��
10,440,0,0q�6Q   $	��Top=�6e   $	��100��6}   $��50��6�   $��Segoe UI Semibold)�6�   $��24(�6�   ���	#FF919090$ Press=�6�   �� 5   
   -   5        $ 
StopButton��5      $
��Stop��6%   $
��Left=�64   $��130,440,0,0q�6O   $	��Top=�6d   $	��100��6|   $��50��6�   $��Segoe UI Semibold)�6�   $��24(�6�   ���	#FF919090$ Press=�6�   �� 5   
   -   5        $ ConfigButton��5      $��Config��6'   $
��Left=�68   $��550,440,0,0q�6S   $	��Top=�6h   $	��100��6�   $��50��6�   $��Segoe UI Semibold)�6�   $��24(�6�   ���	#FF919090$ Press=�6�   $ 	0.602,0.5&�6
  �� 5   
   -   5        $	 
SerialPort��5      $
��Left=�6(   $��
60,518,0,0q�6C   $
��Wrap=�6W   $��-----��6k   $	��Top=�6x   $��16��6�   $��45��6�   $
 Center=�6�   $��Segoe UI Semibold)�6�   ���	#FFB0B0B06�   �� 5   
   -   5        $	 BaudRate��5      $
��Left=�6&   $��110,518,0,0q�6A   $
��Wrap=�6V   $��
----- kbps��6j   $	��Top=�6|   $��16��6�   $��80��6�   $
 Center=�6�   $��Segoe UI Semibold)�6�   ���	#FFB0B0B06�   �� 5   
   -   5        $	 Status��5      $
��Left=�6$   $��196,518,0,0q�6?   $
��Wrap=�6T   $��-----��6h   $	��Top=�6u   $��16��6�   $��80��6�   $
 Center=�6�   $��Segoe UI Semibold)�6�   ���	#FFB0B0B06�   �� 5    
   -   5        $ Meter3_Value��5       $
��Left=�6(   $��70��6C   $��444,110,0,0q�6O   $
 Wrap=�6d   $��--,---��6x   $	��Top=�6�   $	��220��6�   $��48(�6�   $ 1��6�   $ Center=�6�   �� 5!   
   -   5        $ Meter3_Label��5!      $��Kanal C��6&   $
��Left=�68   $��
444,80,0,0q�6S   $	��Top=�6g   
�������$ 5.625,0.977&�6�   �� 5"   
   -   5        $ Meter3_Unit��5"      $
��Volt��6%   $
��Left=�64   $��669,107,0,0q�6O   $	��Top=�6d   
�������$��48(�6�   �� 5#   
   -   5        $ Meter4_Value��5#      $
��Left=�6(   $��70��6C   $��444,250,0,0q�6O   $
 Wrap=�6d   $��--,---��6x   $	��Top=�6�   $	��220��6�   $��48(�6�   $ 1��6�   $ Center=�6�   �� 5$   
   -   5        $ Meter4_Label��5$      $��Kanal D��6&   $
��Left=�68   $��444,220,0,0q�6S   $	��Top=�6h   
�������$ 5.625,0.977&�6�   �� 5%   
   -   5        $ Meter4_Unit��5%      $
��Volt��6%   $
��Left=�64   $��669,247,0,0q�6O   $	��Top=�6d   
�������$��48(�6�   5&      5'      