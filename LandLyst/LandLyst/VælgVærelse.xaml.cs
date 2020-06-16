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
    /// Interaction logic for VælgVærelse.xaml
    /// </summary>
    public partial class VælgVærelse : Page
    {
        SqlManager cnn = new SqlManager();
        public VælgVærelse()
        {
            InitializeComponent();

            startDato.DisplayDateStart = DateTime.Today;
            sluttDato.DisplayDateStart = DateTime.Today.AddDays(1);
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

    }
}
