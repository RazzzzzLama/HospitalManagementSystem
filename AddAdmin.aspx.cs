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
    public partial class AddAdmin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Add Amin link button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckAdmin()) // to avoide same user_id
            {

                Response.Write("<script>alert('Admin Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                AdminAdd();
            }
        }

        // Update Admin link button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckAdmin()) // to avoide same user_id
            {
                UpdateAdmin();
            }
            else
            {
                Response.Write("<script>alert('Admin ID doesnt exist in database');</script>");
            }
        }
        // Delete admin link button

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckAdmin()) // to avoide same user_id
            {
                DeleteAdmin();

            }
            else
            {
                Response.Write("<script>alert('Admin doesnt exist in database');</script>");
            }
        }
        // Check link button.
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GetAdminId();
        }

        // user defined functions.

        void GetAdminId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from admin_master_tbl where user_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    TextBox4.Text = dt.Rows[0]["Fullname"].ToString();
                    TextBox1.Text = dt.Rows[0]["contact_no"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["password"].ToString().Trim();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Admin ID');</script>");
                    Clearform();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void UpdateAdmin()
        {
            
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE admin_master_tbl SET Fullname=@fullname,contact_no=@contact_no WHERE user_id='" + TextBox3.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@fullname", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox1.Text.Trim());


                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection

                Response.Write("<script>alert('Admin Updated successfully');</script>");
                Clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }
        void AdminAdd()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO admin_master_tbl (Fullname,contact_no,user_id,password) values (@Fullname,@contact_no,@user_id,@password)", con);
                cmd.Parameters.AddWithValue("@Fullname", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close(); // to close connection
                Response.Write("<script>alert('Admin added successfully');</script>");
                Clearform();
                GridView1.DataBind();

            }
            catch
            {

            }
        }

        bool CheckAdmin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from admin_master_tbl where user_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void DeleteAdmin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from admin_master_tbl WHERE user_id='" + TextBox3.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Admin Removed successfully');</script>");
                Clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }
        void Clearform()
        {
            TextBox1.Text = "";
            TextBox8.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

        
    }
}