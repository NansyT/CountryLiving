using System;
using System.Collections;
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

namespace LandLyst
{
    /// <summary>
    /// Interaction logic for VælgVærelse.xaml
    /// </summary>
    public partial class VælgVærelse : Page
    {
        
        List<string> items;
        int roomid;
        Decimal pricetotal;

        public VælgVærelse()
        {
            InitializeComponent();

            startDato.DisplayDateStart = DateTime.Today;
            slutDato.DisplayDateStart = DateTime.Today.AddDays(1);
            
        }
        //Åbner og lukker filter
        private void Filterbtn_Click(object sender, RoutedEventArgs e)
        {
            if (!popup.IsOpen)
            {
                popup.IsOpen = true;
            }
            else
            {
                popup.IsOpen = false;
            }
        }
        //Søger efter værelse efter søgekriterierne og lukker filter hvis den ikke er
        private void Searchbtn_Click(object sender, RoutedEventArgs e)
        {
            if (startDato.SelectedDate < slutDato.SelectedDate)
            {
                if (popup.IsOpen)
                {
                    popup.IsOpen = false;
                }
                
                CheckFilter();
                searchedRooms.ItemsSource = null;
                ICollectionView data = CollectionViewSource.GetDefaultView(MainWindow.cnn.SelectAvailableRooms(startDato.ToString(), slutDato.ToString(), items[0], items[1], items[2], items[3], items[4], items[5], items[6]).ExecuteReader());
                data.Refresh();
                searchedRooms.ItemsSource = data;
            }
            else
            {
                MessageBox.Show("Vælg datoer, start dato skal være før slut dato");
            }
        }
        //Checker filter igennen for at se hvilke tillægsydelser er valgt og tilføjer dem til items
        private void CheckFilter()
        {
            items = new List<string>();
            foreach (CheckBox checkBox in additions.Children)
            {
                if (checkBox.IsChecked == true)
                {
                    items.Add(checkBox.Content.ToString());
                }
                else
                {
                    items.Add("");
                }
            }
        }
        //Går til booking siden og sender nødvendig info med
        private void Bookbtn_Click(object sender, RoutedEventArgs e)
        {
            GetInfoFromCells(e);
            NavigationService ns = NavigationService.GetNavigationService(this);
            ns.Navigate(new Booking(startDato.SelectedDate.Value, slutDato.SelectedDate.Value, roomid, pricetotal));

        }
        //Får informationen fra de nødvendige celler i kolonnen
        private void GetInfoFromCells(RoutedEventArgs e)
        {
            IDataRecord dataRowView = (IDataRecord)((Button)e.Source).DataContext;
            roomid = (int)dataRowView[0];
            pricetotal = (Decimal)dataRowView[3];
        }
        //Går til værelses siden og sender nødvendig info med
        private void Seebtn_Click(object sender, RoutedEventArgs e)
        {
            GetInfoFromCells(e);
            NavigationService ns = NavigationService.GetNavigationService(this);
            ns.Navigate(new VærelsesInfo(startDato.SelectedDate.Value, slutDato.SelectedDate.Value, roomid, pricetotal));
        }
    }
}
