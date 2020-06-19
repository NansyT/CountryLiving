using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        int roomId;
        public Booking(DateTime startDato, DateTime slutDato, int roomid, Decimal priceTotal)
        {
            InitializeComponent();
            datoStart.Text = startDato.ToString();
            datoSlut.Text = slutDato.ToString();
            totalPris.Text = priceTotal.ToString();
            roomId = roomid;
            roominfo.ItemsSource = null;
            ICollectionView data = CollectionViewSource.GetDefaultView(MainWindow.cnn.Roominformation(roomId, startDato, slutDato).ExecuteReader());
            data.Refresh();
            roominfo.ItemsSource = data;
        }

        //Booker værelse
        private void BookVær_Click(object sender, RoutedEventArgs e)
        {
            if (datoStart.Text != null && datoSlut.Text != null && navn.Text != "Navn" && email.Text != "Email" && telefon.Text != "Telefon nr." && postnr.Text != "Post nr." && addr.Text != "Adresse")
            {
                NavigationService ns = NavigationService.GetNavigationService(this);
                MessageBox.Show("Du har booket et værelse");
                ns.Navigate(new Reservationer());

                manager.CreateReservation(DateTime.Parse(datoStart.Text), DateTime.Parse(datoSlut.Text), roomId, new Customer(email.Text, navn.Text, addr.Text, int.Parse(postnr.Text), int.Parse(telefon.Text)));
            }
            else
            {
                MessageBox.Show("Udfyld alle felterne");
            }
        }
    }
}
