﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Savy_App
{
    public partial class MDI : Form
    {
        Dashboard dash;
        Brand_List brand;
        Product_List product;
        Supplier_List supplier;
        Payment transaction;
        ViewTransactions record;
        Reports rep;
        ProductStockBalanceList psbl;
        public MDI()
        {
            InitializeComponent();
        }


        private void MDI_Load(object sender, EventArgs e)
        {
        }

        private void menu_logout_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void menu_brands_Click(object sender, EventArgs e)
        {
            brand = new Brand_List();
            brand.MdiParent = this;
            brand.Show();
        }

        private void menu_products_Click(object sender, EventArgs e)
        {
            product = new Product_List();
            product.MdiParent = this;
            product.Show();
        }

        private void menu_suppliers_Click(object sender, EventArgs e)
        {
            supplier = new Supplier_List();
            supplier.MdiParent = this;
            supplier.Show();
        }

        private void menu_dashboard_Click(object sender, EventArgs e)
        {
            dash = new Dashboard();
            dash.MdiParent = this;
        }

        private void menu_orders_Click_1(object sender, EventArgs e)
        {
            transaction = new Payment();
            transaction.MdiParent = this;
            transaction.Show();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.WindowState = System.Windows.Forms.FormWindowState.Minimized; 
        }

        private void ts_past_trans_Click(object sender, EventArgs e)
        {
            
        }

        private void pOSREPORTSToolStripMenuItem_Click(object sender, EventArgs e)
        {
            record = new ViewTransactions();
            record.MdiParent = this;
            record.Show();
        }

        private void oTHERREPORTSToolStripMenuItem_Click(object sender, EventArgs e)
        {
            rep = new Reports();
            rep.MdiParent = this;
            rep.Show();
        }

        private void sBRToolStripMenuItem_Click(object sender, EventArgs e)
        {
            psbl = new ProductStockBalanceList();
            psbl.MdiParent = this;
            psbl.Show();
        }
    }
}
