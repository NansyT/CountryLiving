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
        public VærelsesInfo()
        {
            InitializeComponent();
            //Tjek om man kan booke værelset ved hjælp af booking table roomid og datoer
        }
        // NEED TO FIGURE THIS SHIT OUT!
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new VærelsesInfo());
        }
    }
}
