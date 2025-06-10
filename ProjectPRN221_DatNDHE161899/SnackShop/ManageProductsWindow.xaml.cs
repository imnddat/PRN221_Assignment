using Microsoft.EntityFrameworkCore;
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
    /// Interaction logic for ManageProductsWindow.xaml
    /// </summary>
    public partial class ManageProductsWindow : Window
    {
        private List<Product> products;
        private List<Category> categories;
        private SnackShopDBContext context;
        public ManageProductsWindow()
        {
            InitializeComponent();
            context = new SnackShopDBContext();
            LoadProducts();
            LoadCategories();
        }

        private void LoadProducts()
        {
            products = context.Products.ToList();
            productsListView.ItemsSource = products;
        }

        private void LoadCategories()
        {
            categories = context.Categories.ToList();
            productCategoryCombox.ItemsSource = categories;
            productCategoryCombox.DisplayMemberPath = "CategoryName";
            productCategoryCombox.SelectedValuePath = "CategoryId";
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchText = searchTextBox.Text.ToLower();

            // Filter products based on search text
            var filteredProducts = context.Products
                .Where(p => p.ProductName.ToLower().Contains(searchText))
                .ToList();

            productsListView.ItemsSource = filteredProducts;
        }

        private void ProductsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (productsListView.SelectedItem is Product selectedProduct)
            {
                productNameTextBox.Text = selectedProduct.ProductName;
                productCategoryCombox.SelectedValue = selectedProduct.CategoryId;
                productPriceTextBox.Text = selectedProduct.Price.ToString("F2");
                productStockQuantityTextBox.Text = selectedProduct.StockQuantity.ToString();
                productCompanyTextBox.Text = selectedProduct.Company;
                productCountryTextBox.Text = selectedProduct.Country;
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(productNameTextBox.Text) ||
                productCategoryCombox.SelectedItem == null ||
                string.IsNullOrWhiteSpace(productPriceTextBox.Text) ||
                string.IsNullOrWhiteSpace(productStockQuantityTextBox.Text))
            {
                MessageBox.Show("Please fill in all required fields.", "Input Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            // Kiểm tra định dạng dữ liệu
            if (!decimal.TryParse(productPriceTextBox.Text, out var price))
            {
                MessageBox.Show("Invalid price format.", "Input Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!int.TryParse(productStockQuantityTextBox.Text, out var stockQuantity))
            {
                MessageBox.Show("Invalid stock quantity format.", "Input Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var newProduct = new Product
            {
                ProductName = productNameTextBox.Text,
                CategoryId = (int)productCategoryCombox.SelectedValue,
                Price = price,
                StockQuantity = stockQuantity,
                Company = productCompanyTextBox.Text,
                Country = productCountryTextBox.Text
            };

            try
            {
                context.Products.Add(newProduct);
                context.SaveChanges();

                MessageBox.Show("Product has been successfully added.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);

                LoadProducts();
                ClearFields();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while adding the product: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            if (productsListView.SelectedItem is Product selectedProduct)
            {                
                if (string.IsNullOrWhiteSpace(productNameTextBox.Text) ||
                    productCategoryCombox.SelectedItem == null ||
                    string.IsNullOrWhiteSpace(productPriceTextBox.Text) ||
                    string.IsNullOrWhiteSpace(productStockQuantityTextBox.Text))
                {
                    MessageBox.Show("Please fill in all required fields.", "Input Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Kiểm tra định dạng dữ liệu
                if (!decimal.TryParse(productPriceTextBox.Text, out var price))
                {
                    MessageBox.Show("Invalid price format.", "Input Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (!int.TryParse(productStockQuantityTextBox.Text, out var stockQuantity))
                {
                    MessageBox.Show("Invalid stock quantity format.", "Input Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // Cập nhật thông tin sản phẩm
                selectedProduct.ProductName = productNameTextBox.Text;
                selectedProduct.CategoryId = (int)productCategoryCombox.SelectedValue;
                selectedProduct.Price = price;
                selectedProduct.StockQuantity = stockQuantity;
                selectedProduct.Company = productCompanyTextBox.Text;
                selectedProduct.Country = productCountryTextBox.Text;

                try
                {
                    context.Products.Update(selectedProduct);
                    context.SaveChanges();
                    
                    MessageBox.Show("Product has been successfully updated.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);

                    LoadProducts();
                    ClearFields();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred while updating the product: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Please select a product to update.");
            }
        }


        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (productsListView.SelectedItem is Product selectedProduct)
            {
                
                var result = MessageBox.Show(
                    $"Are you sure you want to delete the product '{selectedProduct.ProductName}'?",
                    "Confirm Delete",
                    MessageBoxButton.YesNo,
                    MessageBoxImage.Warning);

                if (result == MessageBoxResult.Yes)
                {
                    context.Products.Remove(selectedProduct);
                    context.SaveChanges();

                    MessageBox.Show("Product has been successfully deleted.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);

                    LoadProducts();
                    ClearFields();
                }
            }
            else
            {
                MessageBox.Show("Please select a product to delete.");
            }
        }

        private void ClearButton_Click(object sender, RoutedEventArgs e)
        {
            ClearFields();
        }

        private void ClearFields()
        {
            productNameTextBox.Text = string.Empty;
            productPriceTextBox.Text = string.Empty;
            productStockQuantityTextBox.Text = string.Empty;
            productCompanyTextBox.Text = string.Empty;
            productCountryTextBox.Text = string.Empty;
            productCategoryCombox.SelectedIndex = -1;
            productsListView.SelectedItem = null;
        }
    }
}
