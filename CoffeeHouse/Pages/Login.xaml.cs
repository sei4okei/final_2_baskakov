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
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        public Login()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            using (Context db = new Context())
            {
                try
                {
                    var account = db.Account.FirstOrDefault(l => LoginTextBox.Text == l.Login);

                    if (account.Password.Equals(PasswordTextBox.Password) &&
                        account.Login.Equals(LoginTextBox.Text)) 
                    {
                        Navigate();
                    }
                    else
                    {
                        ErrorMessage();
                    }
                }
                catch (Exception)
                {
                    ErrorMessage();
                }
            }
        }

        private void Navigate()
        {
            NavigationManager.RootFrame.Navigate(new Home());
        }

        private void ErrorMessage()
        {
            MessageBox.Show("Неправильно введены данные, попробуйте снова!", "Ошибка!",
                        MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
