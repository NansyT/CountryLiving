   M S B A M L   `   `   `  ����C  ?LandLyst, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:LandLystLandLyst  5          LandLyst.Booking   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      (localclr-namespace:LandLyst     5        N� Title$  Booking��5	      .��5
      ]� .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ roominfo��5         CanUserReorderColumns .     AutoGenerateColumns .     
IsReadOnly .    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Rum id��6@   -   5        room_id��1  +System.Windows.Controls.DataGridBoundColumn   Binding 5   %   �� *roomid+6P     5      $ Tillægsydelser��6D   -   5        service�� 5   %   �� *
servicestr+6\     5      $ Pris pr. nat��6C   -   5        	pricedayC�� 5   %   �� *	pricepday+6Y     5      $ Antal nætter��6E   -   5        tnights�� 5   %   �� *totalnights+6[     5      $ 
Total pris��6D   -   5        tpriceC�� 5   %   �� *
totalprice+6X   5      �� 5   
   $��Right=�6   $��Right=�61    �� Orientation$ Vertical=�6I   $��0,0,25,0q�6`   .+�5      �� $��70��6   �� 5      -   5        	 ��Name$
	 navn��5      $
��Navn��6$   $��16(�60   $��0,0,0,5q�6>   6O   �� 5      -   5        $	 email��5      $��Email��6%   $��16(�62   $��0,0,0,5q�6@   6Q   �� 5      -	   5        $	 telefon��5      
 �� 	MaxLength$
 8��6M   $��Telefon nr.��6[   $��16(�6n   $��0,0,0,5q�6|   6�   �� 5      -
   5        $
	 addr��5      $��Addresse��6$   $��16(�64   $��0,0,0,5q�6B   6S   �� 5      $ 
Horizontal=�6   .+�5      �� -   5        $	 by��5      $��By��6&   $	��100��60   $��16(�6<   $��0,0,5,0q�6J   6[   �� 5      -   5        $	 postnr��5      $
 4��6P   $��Post nr.��6^   $	��100��6n   $��16(�6z   6�   5      �� 5      $ 
Horizontal=�6   .+�5       �� -   5        $	 	datoStart��5    ,    �� 
IsReadOnly . $	��100��6?   $��16(�6K   $��0,5,5,0q�6Y   �� 5!      -   5        $	 datoSlut��5!   ,    . $	��100��6>   $��16(�6J   $��0,5,0,0q�6X   5"      �� 5#      -   5        $	 	totalPris��5#   (    . $��20(�6;   $��Center=�6I   $��0,50,0,0q�6f   $��Center=�6x   �� 5$      -   5         ��Name$ bookVær��5$      $��Book Værelse��6&   $��30��6=   $��5q�6I   $��Center=�6U   6r   5%      5&      5'      