﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoffeeHouse.Models
{
    internal class Order
    {
        public int Id { get; set; }
        public int Table { get; set; }
        public int CustomerAmount { get; set; }
        public string[] Dishes { get; set; }
        public string Status { get; set; }
    }
}
