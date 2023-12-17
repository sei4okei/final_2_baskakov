using CoffeeHouse.Data;
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
    /// Логика взаимодействия для Home.xaml
    /// </summary>
    public partial class Home : Page
    {
        public Home()
        {
            InitializeComponent();
        }

        private void SetupDataGrid()
        {
            TaskDataGrid.Columns[0].Header = "№";
            TaskDataGrid.Columns[0].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[1].Header = "Блюда";
            TaskDataGrid.Columns[1].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[2].Header = "Столик";
            TaskDataGrid.Columns[2].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[3].Header = "Кол-во людей";
            TaskDataGrid.Columns[3].Width = DataGridLength.Auto;
            TaskDataGrid.Columns[4].Header = "Статус";
            TaskDataGrid.Columns[4].Width = DataGridLength.Auto;
        }
        private void ViewDataGrid_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            DataGrid DG = sender as DataGrid;
            //Model.Task row = (Model.Task)(sender as DataGrid).SelectedItems[0];

            //NavigationManager.MainFrame.Navigate(new Add(row));

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            using (Context db = new Context())
            {
                TaskDataGrid.ItemsSource = db.Order.ToList();
            }
            SetupDataGrid();
        }

        private void CreateOrderButton_Click(object sender, RoutedEventArgs e)
        {
            //NavigationManager.RootFrame.Navigate(new CreateTask());
        }
    }
}
