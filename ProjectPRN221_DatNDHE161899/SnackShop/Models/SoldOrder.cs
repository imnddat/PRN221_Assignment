using System;
using System.Collections.Generic;

namespace SnackShop.Models
{
    public partial class SoldOrder
    {
        public int SoldOrderId { get; set; }
        public int OrderId { get; set; }
        public int EmployeeId { get; set; }
        public DateTime SaleDate { get; set; }

        public virtual Employee Employee { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
