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
using System.Windows.Shapes;

namespace SnackShop
{
    /// <summary>
    /// Interaction logic for Dashboard.xaml
    /// </summary>
    public partial class Dashboard : Window
    {
        public Dashboard()
        {
            InitializeComponent();
        }

        private void ManageProductsButton_Click(object sender, RoutedEventArgs e)
        {
            var manageProductsWindow = new ManageProductsWindow();
            manageProductsWindow.Show();
        }

        private void ManageCustomersButton_Click(object sender, RoutedEventArgs e)
        {
            var manageCustomersWindow = new ManageCustomersWindow();
            manageCustomersWindow.Show();
        }

        private void ManageOrdersButton_Click(object sender, RoutedEventArgs e)
        {
            var manageOrdersWindow = new ManageOrdersWindow();
            manageOrdersWindow.Show();
        }
    }
}
