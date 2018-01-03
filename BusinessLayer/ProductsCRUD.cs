using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class ProductsCRUD
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectToDb"].ToString();
        SqlConnection con;
        SqlCommand cmd;

        //Read the table
        public IEnumerable<Product> ProductList
        {
            get
            {
                List<Product> list = new List<Product>();
                con = new SqlConnection(strcon);
                con.Open();
                cmd = new SqlCommand("spReadProducts", con);
                SqlDataReader dr = cmd.ExecuteReader();
                while(dr.Read())
                {
                    Product prod = new Product();
                    prod.pid = Convert.ToInt32(dr["pid"]);
                    prod.pname = dr["pname"].ToString();
                    prod.cost = Convert.ToDecimal(dr["cost"]);

                    list.Add(prod);
                }
                dr.Close();
                con.Close();
                return list;
            }            
        }

        //Insert the Data
        public void InsertProduct(Product prod)
        {
            con = new SqlConnection(strcon);
            con.Open();
            cmd = new SqlCommand("spAddProducts", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter parmName, parmCost;

            parmName = new SqlParameter();
            parmName.ParameterName = "@pname";
            parmName.Value = prod.pname;
            cmd.Parameters.Add(parmName);

            parmCost = new SqlParameter();
            parmCost.ParameterName = "@cost";
            parmCost.Value = prod.cost;
            cmd.Parameters.Add(parmCost);

            cmd.ExecuteNonQuery();
            con.Close();
        }

        //Update the Data

        public void UpdateData(Product prod)
        {
            con = new SqlConnection(strcon);
            con.Open();
            cmd = new SqlCommand("spUpdateProducts", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parmId = new SqlParameter("@pid", prod.pid);
            cmd.Parameters.Add(parmId);

            SqlParameter parmName = new SqlParameter("@pname", prod.pname);
            cmd.Parameters.Add(parmName);

            SqlParameter parmCost = new SqlParameter("@cost", prod.cost);
            cmd.Parameters.Add(parmCost);

            cmd.ExecuteNonQuery();
            con.Close();
        }

        //Delete the Product
        public void DeleteData(Product prod)
        {
            con = new SqlConnection(strcon);
            con.Open();
            cmd = new SqlCommand("spDeleteProducts", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parmId = new SqlParameter("@pid", prod.pid);
            cmd.Parameters.Add(parmId);

            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
