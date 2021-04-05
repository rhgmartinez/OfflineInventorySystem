using System;
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
    public partial class ProductStockBalanceList : Form
    {
        SQL Record;
        DataTable dt;
        public ProductStockBalanceList()
        {
            InitializeComponent();
        }

        private void btn_close_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void ProductStockBalanceList_Load(object sender, EventArgs e)
        {
            loadRecords();
        }

        public void loadRecords()
        {
            Record = new SQL();
            dt = new DataTable();
            dt = Record.SELECT_STATEMENT("SELECT prod.productName, prod.productPrice, prod.productQty, (CONVERT(FLOAT,prod.productQty) * CONVERT(FLOAT,prod.productPrice)) AS balance FROM Products prod " +
            "ORDER BY prod.productName ASC");

            dgv_chart.DataSource = dt;

            dgv_chart.Columns[0].HeaderText = "Product Name";
            dgv_chart.Columns[1].HeaderText = "Price";
            dgv_chart.Columns[2].HeaderText = "Stock";
            dgv_chart.Columns[3].HeaderText = "Stock Balance";

            lbl_total_products.Text = dt.Rows.Count.ToString();
            if (dt.Rows.Count > 0)
            {
                lbl_total_psb.Text = dt.Compute("SUM([" + dt.Columns[3].ColumnName + "])", String.Empty).ToString();
            }
        }

        private void txt_search_TextChanged(object sender, EventArgs e)
        {
            DataView dv = new DataView(dt);
            dv.RowFilter = string.Format("productName LIKE '%{0}%'", txt_search.Text);
            dgv_chart.DataSource = dv;
        }
    }
}
