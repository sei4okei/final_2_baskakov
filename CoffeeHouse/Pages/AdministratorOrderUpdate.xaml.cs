using CoffeeHouse.Data;
using CoffeeHouse.Models.Enum;
using CoffeeHouse.Models.View;
using CoffeeHouse.Models;
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
    /// Логика взаимодействия для AdministratorOrderUpdate.xaml
    /// </summary>
    public partial class AdministratorOrderUpdate : Page
    {
        List<string> dishes = new List<string>();

        public AdministratorOrderUpdate(OrderView view)
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
            DishesListBox.ItemsSource = view.Dishes.Split(", ");
            StatusComboBox.SelectedItem = view.Status;

            dishes = view.Dishes.Split(", ").ToList();
        }

        private void SetupComboBox()
        {
            StatusComboBox.ItemsSource = new List<OrderStatus>
            {
                OrderStatus.Accepted, OrderStatus.Paid
            };
            DishesComboBox.ItemsSource = new List<Dish>
            {
                Dish.Baguette, Dish.BavarianCream, Dish.BoeufBourguignon, Dish.Bouillabaisse, Dish.Brandade, Dish.Brioche, Dish.Cassoulet,
                Dish.Champagne, Dish.Chateaubriand, Dish.CheeseFondue, Dish.ConfitDeCanard, Dish.CoqAuVin, Dish.Crepes, Dish.Croissant,
                Dish.Eclair, Dish.Escargot, Dish.FoieGras, Dish.FrogsLegs, Dish.GratinDauphinois, Dish.HachisParmentier, Dish.JambonBeurre,
                Dish.Macaron, Dish.Madeleines, Dish.MilleFeuille, Dish.MoulesMarinieres, Dish.Omelette, Dish.OnionSoup, Dish.Pissaladiere,
                Dish.QuicheLorraine, Dish.Raclette, Dish.Ratatouille, Dish.SaladeNicoise, Dish.Souffle, Dish.TarteTatin
            };
            DishesComboBox.SelectedItem = Dish.Baguette;
        }

        private void RemoveDishButton_Click(object sender, RoutedEventArgs e)
        {
            dishes.Remove(dishes[DishesListBox.SelectedIndex]);
            DishesListBox.ItemsSource = null;
            DishesListBox.ItemsSource = dishes;
        }

        private void AddDishButton_Click(object sender, RoutedEventArgs e)
        {
            dishes.Add(DishesComboBox.SelectedItem.ToString());
            DishesListBox.ItemsSource = null;
            DishesListBox.ItemsSource = dishes;
        }

        private void RemoveOrderButton_Click(object sender, RoutedEventArgs e)
        {
            using (Context db = new Context())
            {
                try
                {
                    var status = StatusComboBox.SelectedItem.ToString();

                    var order = new Order
                    {
                        Id = Convert.ToInt32(IdTextBox.Text),
                        CustomerAmount = Convert.ToInt32(CustomersTextBox.Text),
                        Table = Convert.ToInt32(TableTextBox.Text),
                        Dishes = dishes.ToArray(),
                        Status = status
                    };

                    db.Order.Remove(order);

                    db.SaveChanges();

                    MessageBox.Show("Статус успешно изменен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

                    NavigationManager.RootFrame.Navigate(new AdministratorOrders());
                }
                catch (Exception)
                {
                    MessageBox.Show("Неправильно введены данные, попробуйте снова!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void UpdateOrderButton_Click(object sender, RoutedEventArgs e)
        {
            using (Context db = new Context())
            {
                try
                {
                    var status = StatusComboBox.SelectedItem.ToString();

                    var order = new Order
                    {
                        Id = Convert.ToInt32(IdTextBox.Text),
                        CustomerAmount = Convert.ToInt32(CustomersTextBox.Text),
                        Table = Convert.ToInt32(TableTextBox.Text),
                        Dishes = dishes.ToArray(),
                        Status = status
                    };

                    db.Order.Update(order);

                    db.SaveChanges();

                    MessageBox.Show("Статус успешно изменен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

                    NavigationManager.RootFrame.Navigate(new AdministratorOrders());
                }
                catch (Exception)
                {
                    MessageBox.Show("Неправильно введены данные, попробуйте снова!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
