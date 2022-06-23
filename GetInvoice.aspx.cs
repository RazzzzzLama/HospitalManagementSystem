using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HospitalManagementSystem
{
    public partial class GetInvoice : System.Web.UI.Page
    {
        //Creating a connection to my database using the connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getUserInvoiceData();
            }
        }

        // User Defined Funcation.
        void getUserInvoiceData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from invoice_master_tbl where contact_no='" + Session["contact_no"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
            catch (Exception)
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

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
    }
}