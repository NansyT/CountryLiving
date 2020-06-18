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

namespace LandLyst
{
    /// <summary>
    /// Interaction logic for VærelsesInfo.xaml
    /// </summary>
    public partial class VærelsesInfo : Page
    {
        Decimal roomid;
        Decimal pricetotal;
        public VærelsesInfo(DateTime? startDato, DateTime? slutDato, Decimal roomId, Decimal priceTotal)
        {
            InitializeComponent();
            datoStart.Text = startDato.ToString();
            datoSlut.Text = slutDato.ToString();
            totalPris.Text = priceTotal.ToString();
            pricetotal = priceTotal;
            roomid = roomId;
            //Tjek om man kan booke værelset ved hjælp af booking table roomid og datoer
        }
        // NEED TO FIGURE THIS SHIT OUT!
        private void Bookroombtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Booking(datoStart.SelectedDate, datoSlut.SelectedDate, roomid, pricetotal));
        }
    }
}
