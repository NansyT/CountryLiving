using System;
using System.Collections.Generic;
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
        SqlManager cnn = new SqlManager();
        List<string> items;
        public VælgVærelse()
        {
            InitializeComponent();

            startDato.DisplayDateStart = DateTime.Today;
            slutDato.DisplayDateStart = DateTime.Today.AddDays(1);
        }

        private void Filterbtn_Click(object sender, RoutedEventArgs e)
        {
            if (!popup.IsOpen)
            {
                popup.IsOpen = true;
                additions.Visibility = Visibility.Visible;
            }
            else
            {
                popup.IsOpen = false;
                additions.Visibility = Visibility.Collapsed;
            }
        }

        private void Searchbtn_Click(object sender, RoutedEventArgs e)
        {
            if (startDato.SelectedDate < slutDato.SelectedDate)
            {
                CheckFilter();
                searchedRooms.ItemsSource = null;
                
                searchedRooms.ItemsSource = cnn.SelectAvailableRooms(startDato.ToString(), slutDato.ToString(), items[0], items[1], items[2], items[3], items[4], items[5], items[6]).ExecuteReader();
            }
        }
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
    }
}
