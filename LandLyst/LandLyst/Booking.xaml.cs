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
using CountryLiving;

namespace LandLyst
{
    /// <summary>
    /// Interaction logic for Booking.xaml
    /// </summary>
    public partial class Booking : Page
    {
        ReservationManager manager = new ReservationManager();
        public Booking(DateTime? startDato, DateTime? slutDato, Decimal roomid, Decimal priceTotal)
        {
            InitializeComponent();
            datoStart.Text = startDato.ToString();
            datoSlut.Text = slutDato.ToString();
            totalPris.Text = priceTotal.ToString();
        }

        //Booker værelse
        private void BookVær_Click(object sender, RoutedEventArgs e)
        {
            NavigationService ns = NavigationService.GetNavigationService(this);
            MessageBox.Show("Du har booket et værelse");
            ns.Navigate(new Reservationer());

            manager.CreateReservationSQL();
        }
    }
}
