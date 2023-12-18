using CoffeeHouse.Data;
using CoffeeHouse.Models;
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
    /// Логика взаимодействия для ChefOrders.xaml
    /// </summary>
    public partial class ChefOrders : Page
    {
        public ChefOrders()
        {
            InitializeComponent();
        }

        private void SetupDataGrid()
        {
            TaskDataGrid.Columns[0].Header = "№";
            TaskDataGrid.Columns[0].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[1].Header = "Столик";
            TaskDataGrid.Columns[1].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[2].Header = "Кол-во людей";
            TaskDataGrid.Columns[2].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[3].Header = "Блюда";
            TaskDataGrid.Columns[3].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[4].Header = "Статус";
            TaskDataGrid.Columns[4].Width = DataGridLength.Auto;
        }
        private void ViewDataGrid_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            DataGrid DG = sender as DataGrid;
            OrderView row = (OrderView)(sender as DataGrid).SelectedItems[0];

            NavigationManager.RootFrame.Navigate(new ChefOrderUpdate(row));

        }
        
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            using (Context db = new Context())
            {
                var data = db.Order.ToList();

                TaskDataGrid.ItemsSource = OrderViewHelpers.GetOrderViewList(data)
                    .Where(o => o.Status != OrderStatus.Paid)
                    .ToList();
            }
            SetupDataGrid();
        }
    }
}
