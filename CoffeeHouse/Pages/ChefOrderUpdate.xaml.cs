using CoffeeHouse.Data;
using CoffeeHouse.Models.Enum;
using CoffeeHouse.Models.View;
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

namespace CoffeeHouse.Pages
{
    /// <summary>
    /// Логика взаимодействия для ChefOrderUpdate.xaml
    /// </summary>
    public partial class ChefOrderUpdate : Page
    {
        public ChefOrderUpdate(OrderView view)
        {
            InitializeComponent();
            SetupPage(view);
            SetupComboBox();
        }

        private void SetupPage(OrderView view)
        {
            IdTextBox.Text = view.Id.ToString();
            TableTextBox.Text = view.Table.ToString();
            CustomersTextBox.Text = view.CustomerAmount.ToString();
            DishesTextBox.Text = view.Dishes.ToString();
            StatusComboBox.SelectedItem = view.Status;
        }

        private void SetupComboBox()
        {
            StatusComboBox.ItemsSource = new List<OrderStatus>
            {
                OrderStatus.Cooking, OrderStatus.Ready
            };
        }

        private void UpdateTaskButton_Click(object sender, RoutedEventArgs e)
        {
            using (Context db = new Context())
            {
                try
                {
                    var status = StatusComboBox.SelectedItem.ToString();

                    var order = db.Order.FirstOrDefault(x => x.Id == Convert.ToInt32(IdTextBox.Text));

                    order.Status = status;

                    db.Order.Update(order);

                    db.SaveChanges();

                    MessageBox.Show("Статус успешно изменен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

                    NavigationManager.RootFrame.Navigate(new ChefOrders());
                }
                catch (Exception)
                {
                    MessageBox.Show("Неправильно введены данные, попробуйте снова!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
