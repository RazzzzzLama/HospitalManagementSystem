using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class ViewReport : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Search link button
        protected void Button1_Click(object sender, EventArgs e)
        {
            SearchReport();
        }

        // Download link button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                // Response.Write("<script>alert('Button test');</script>");
                LinkButton linkdownload = sender as LinkButton;
                GridViewRow gridrow = linkdownload.NamingContainer as GridViewRow;
                string downloadfile = GridView1.DataKeys[gridrow.RowIndex].Value.ToString();
                Response.ContentType = "image/jpeg";
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + downloadfile + "\"");
                Response.TransmitFile(Server.MapPath(downloadfile));
                Response.End();
            }
            catch (Exception)
            {
            }
        }

        // User Defined Function
        void SearchReport()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from report_master_tbl where patient_id='" + TextBox1.Text.Trim() + "'AND invoice_no='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                Clearfrom();
                Label10.Text = "Search Completed";
            }
            catch (Exception)
            {
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        void Clearfrom()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}