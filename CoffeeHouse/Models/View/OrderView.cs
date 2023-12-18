using CoffeeHouse.Models.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace CoffeeHouse.Models.View
{
    public class OrderView
    {
        public int Id { get; set; }
        public int Table { get; set; }
        public int CustomerAmount { get; set; }
        public string Dishes { get; set; }
        public OrderStatus Status { get; set; }
    }
}
