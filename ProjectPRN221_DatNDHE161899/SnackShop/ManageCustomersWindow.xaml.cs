using SnackShop.Models;
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
    /// Interaction logic for ManageCustomersWindow.xaml
    /// </summary>
    public partial class ManageCustomersWindow : Window
    {
        private SnackShopDBContext _context;
        private List<Customer> _allCustomers;
        public ManageCustomersWindow()
        {
            InitializeComponent();
            _context = new SnackShopDBContext();
            LoadCustomers();
        }

        private void LoadCustomers()
        {
            _allCustomers = _context.Customers.ToList();
            customersListView.ItemsSource = _allCustomers;
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = searchTextBox.Text.ToLower();

            // Filter customers based on search text
            var filteredCustomers = _allCustomers
                .Where(c => c.CustomerName.ToLower().Contains(searchText))
                .ToList();

            customersListView.ItemsSource = filteredCustomers;
        }
    }
}
