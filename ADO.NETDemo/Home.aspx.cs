using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace ADO.NETDemo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        ProductsCRUD prod = new ProductsCRUD();

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtPID.Text);
            Product product = prod.ProductList.Single(x => x.pid == id);
            txtPNAME.Text = product.pname;
            txtCOST.Text = product.cost.ToString();
        }

        public void ListClear()
        {
            txtPID.Text = "";
            txtPNAME.Text = "";
            txtCOST.Text = "";
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ListClear();
            txtPID.Enabled = false;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ListClear();
            txtPID.Enabled = true;
        }

        protected void btnInsert_Click1(object sender, EventArgs e)
        {
            Product product = new Product();
            product.pname = txtPNAME.Text;
            product.cost = Convert.ToDecimal(txtCOST.Text);
            prod.InsertProduct(product);
            GridView1.DataBind();
            ListClear();
            txtPID.Enabled = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Product product = new Product();
            product.pid = Convert.ToInt32(txtPID.Text);
            product.pname = txtPNAME.Text;
            product.cost = Convert.ToDecimal(txtCOST.Text);
            prod.UpdateData(product);
            GridView1.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Product product = new Product();
            product.pid = Convert.ToInt32(txtPID.Text);
            prod.DeleteData(product);
            GridView1.DataBind();
            ListClear();
        }
    }
}