using CoffeeHouse.Models;
using CoffeeHouse.Models.Enum;
using CoffeeHouse.Models.View;
using System.Collections.Generic;

internal static class OrderViewHelpers
{

    public static List<OrderView> GetOrderViewList(List<Order> orders)
    {
        List<OrderView> list = new List<OrderView>();

        foreach (Order order in orders)
        {


            list.Add(new OrderView
            {
                Id = order.Id,
                Table = order.Table,
                CustomerAmount = order.CustomerAmount,
                Dishes = string.Join(", ", order.Dishes),
                Status = OrderViewHelpers.StringToEnum(order.Status),
            });
        }

        return list;
    }

    private static OrderStatus StringToEnum(string str)
    {
        if (str == "Paid")
        {
            return OrderStatus.Paid;
        }
        if (str == "Cooking")
        {
            return OrderStatus.Cooking;
        }
        if (str == "Ready")
        {
            return OrderStatus.Ready;
        }

        return OrderStatus.Accepted;
    }
}