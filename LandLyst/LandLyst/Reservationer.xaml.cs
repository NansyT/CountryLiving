using System;
using System.Collections.Generic;
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

            using (NpgsqlDataReader reader = MainWindow.cnn.SeeAllReservations())
            {
                if (reader != null)
                {
                    foreach (var item in reader)
                    {
                        IDataRecord record = (IDataRecord)item;
                        roomIdC.Binding = "pkreservation_id";
                        reservationer.Items.Add(record);

                    }
                }
            }
        }
    }
}
