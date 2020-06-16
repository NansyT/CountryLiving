using CountryLiving;
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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            mainFrame.Navigate(new Reservationer());
        }
        
        // FOR TESTING PURPOSES!! NOT FINAL. NEED TO FIGURE THIS SHIT OUT FIRST!
        private void Værelsebtn_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new VælgVærelse());
        }

        private void Bookingbtn_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new Booking());
        }

        private void Tilbagebtn_Click(object sender, RoutedEventArgs e)
        {
            if (mainFrame.CanGoBack)
            {
                mainFrame.GoBack();
            }
        }

        private void SeReservationer_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new Reservationer());
        }

        private void VærelsesInfo_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new VærelsesInfo());
        }
        // FOR TESTING PURPOSES!! NOT FINAL. NEED TO FIGURE THIS SHIT OUT FIRST!
    }
}
