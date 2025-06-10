using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

namespace SnackShop.Models
{
    public partial class SnackShopDBContext : DbContext
    {
        public SnackShopDBContext()
        {
        }

        public SnackShopDBContext(DbContextOptions<SnackShopDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<Employee> Employees { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<PaymentMethod> PaymentMethods { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<SoldOrder> SoldOrders { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
                optionsBuilder.UseSqlServer(config.GetConnectionString("Test"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryName).HasMaxLength(100);
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.CustomerName).HasMaxLength(100);

                entity.Property(e => e.PhoneNumber).HasMaxLength(15);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasIndex(e => e.Username, "UQ__Employee__536C85E44F056E50")
                    .IsUnique();

                entity.Property(e => e.EmployeeName).HasMaxLength(100);

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.Username).HasMaxLength(50);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Employees__RoleI__412EB0B6");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.SalesDate).HasColumnType("datetime");

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Orders__Customer__45F365D3");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Orders__Employee__46E78A0C");

                entity.HasOne(d => d.PaymentMethod)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.PaymentMethodId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Orders__PaymentM__47DBAE45");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__Order__4AB81AF0");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__Produ__4BAC3F29");
            });

            modelBuilder.Entity<PaymentMethod>(entity =>
            {
                entity.Property(e => e.PaymentMethodName).HasMaxLength(50);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.Company).HasMaxLength(100);

                entity.Property(e => e.Country).HasMaxLength(100);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductName).HasMaxLength(100);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Products__Catego__398D8EEE");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleName).HasMaxLength(50);
            });

            modelBuilder.Entity<SoldOrder>(entity =>
            {
                entity.Property(e => e.SaleDate).HasColumnType("datetime");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.SoldOrders)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SoldOrder__Emplo__4F7CD00D");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.SoldOrders)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SoldOrder__Order__4E88ABD4");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
