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
using CountryLiving;
using Npgsql;

namespace LandLyst
{
    /// <summary>
    /// Interaction logic for Reservationer.xaml
    /// </summary>
    public partial class Reservationer : Page
    {
        ReservationManager manager = new ReservationManager();
        public Reservationer()
        {
            InitializeComponent();

            reservationer.ItemsSource = null;
            //henter data fra database og putter den ind i datagrid
            ICollectionView data = CollectionViewSource.GetDefaultView(MainWindow.cnn.SeeAllReservations().ExecuteReader());
            data.Refresh();
            reservationer.ItemsSource = data;
        }
        //Mangler at implementeres i biblioteket
        private void Sletbtn_Click(object sender, RoutedEventArgs e)
        {
            //manager.DeleteReservation();
        }
    }
}
