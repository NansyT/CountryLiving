using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
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

namespace LandLyst
{
    /// <summary>
    /// Interaction logic for VærelsesInfo.xaml
    /// </summary>
    public partial class VærelsesInfo : Page
    {
        int roomid;
        DateTime datoStart;
        DateTime datoSlut;
        Decimal totalPrice;
        public VærelsesInfo(DateTime startDato, DateTime slutDato, int roomId, Decimal priceTotal)
        {
            InitializeComponent();
            roomid = roomId;
            datoStart = startDato;
            datoSlut = slutDato;
            totalPrice = priceTotal;
            roominfo.ItemsSource = null;
            //henter data fra database og putter den ind i datagrid
            ICollectionView data = CollectionViewSource.GetDefaultView(MainWindow.cnn.GetRoom(roomId.ToString()).ExecuteReader());
            data.Refresh();
            roominfo.ItemsSource = data;

            
        }
        //Går til booking side og sender informationer med
        private void Bookroombtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Booking(datoStart, datoSlut, roomid, totalPrice));
        }
    }
}
