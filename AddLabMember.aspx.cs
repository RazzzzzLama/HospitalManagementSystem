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
    public partial class AddLabMember : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Add Lab Member link button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckLabMember()) // to avoide same user_id
            {

                Response.Write("<script>alert('LabMember Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                LabMemberAdd();
            }
        }

        // Update Lab Member link button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckLabMember()) // to avoide same user_id
            {
                UpdateLabMember();
            }
            else
            {
                Response.Write("<script>alert('Lab Member ID doesnt exist in database');</script>");
            }
        }

        // Delete Lab Member link button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckLabMember()) // to avoide same user_id
            {
                DeleteLabMember();

            }
            else
            {
                Response.Write("<script>alert('Lab Member doesnt exist in database');</script>");
            }
        }

        // Go link button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GetLabMemberId();
        }

        // User Defined function.

        void DeleteLabMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from LabMember_master_tbl WHERE user_id='" + TextBox3.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Lab Member Removed successfully');</script>");
                Clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }

        void GetLabMemberId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from LabMember_master_tbl where user_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    TextBox4.Text = dt.Rows[0]["full_name"].ToString();
                    TextBox2.Text = dt.Rows[0]["address"].ToString();
                    TextBox1.Text = dt.Rows[0]["contact_no"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["password"].ToString().Trim();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Lab Member ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void UpdateLabMember()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE LabMember_master_tbl SET full_name=@full_name,contact_no=@contact_no,address=@address WHERE user_id='" + TextBox3.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox2.Text.Trim());


                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection

                Response.Write("<script>alert('Lab Member Updated successfully');</script>");
                Clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }

        void LabMemberAdd()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO LabMember_master_tbl (full_name,contact_no,address,user_id,password) values (@full_name,@contact_no,@address,@user_id,@password)", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close(); // to close connection
                Response.Write("<script>alert('Lab Member added successfully');</script>");
                GridView1.DataBind();
                Clearform();
            }
            catch
            {

            }
        }

        bool CheckLabMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from LabMember_master_tbl where user_id='" + TextBox3.Text.Trim() + "';", con);
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

        void Clearform()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox3.Text = "";
            TextBox8.Text = "";
        }


    }
}