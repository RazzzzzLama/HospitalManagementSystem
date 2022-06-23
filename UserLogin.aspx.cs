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
    public partial class UserLogin : System.Web.UI.Page
    {
        //Creating a connection to my database using the connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userid"] != null)
                    TextBox1.Text = Request.Cookies["userid"].Value;
                if (Request.Cookies["pwd"] != null)
                    TextBox2.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                    rememberme.Checked = true;
            }
        }

        // user login button cilic event.
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                if (rememberme.Checked == true)
                {
                    Response.Cookies["userid"].Value = TextBox1.Text;
                    Response.Cookies["pwd"].Value = TextBox2.Text;
                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where user_id='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows) // Use sql querie and getting values from data table.(dr i.e data reader)
                {
                    while (dr.Read()) // checking if there is any record stored.
                    {
                        Response.Write("<script>alert('Login Successful');</script>");
                        Session["username"] = dr.GetValue(7).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["contact_no"] = dr.GetValue(2).ToString();

                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(9).ToString();
                    }
                    Response.Redirect("UserProfile.aspx");
                }
                else // send message if the username or password is invalid.
                {
                    Response.Write("<script>alert('Invalid User id or password');</script>");
                }

            }
            catch (Exception ex) //If there is signup error
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}