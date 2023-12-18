using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoffeeHouse.Models
{
    internal class Employee
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string? Patronymic { get; set; }
        public string Role { get; set; }
        public string Status { get; set; }
        [ForeignKey("AccountId")]
        public Account Account { get; set; }
        public int AccountId { get; set; }

    }
}
