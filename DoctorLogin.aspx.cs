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
    public partial class DoctorLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // Doctorlogin button cilic event.
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from doctor_master_tbl where user_id='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows) // Use sql querie and getting values from (dr i.e data reader) data table.
                {
                    while (dr.Read()) // checking if there is any record stored.
                    {
                        
                        Session["username"] = dr.GetValue(9).ToString();
                        Session["fullname"] = dr.GetValue(1).ToString();
                        Session["role"] = "Doctor";
                    }
                    Response.Write("<script>alert('Welcome docotor "+ Session["fullname"] + "');</script>");
                    Server.Transfer("AppointmentsStatus.aspx");
                }
                else // send message if the username or password is invalid.
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception) //If there is signup error
            {
               
            }
        }
    }
}