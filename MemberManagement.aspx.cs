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
    public partial class MemberManagement : System.Web.UI.Page
    {
        //Creating a connection to my database using the connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Check  link button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GetUserById();
        }

        // Delete user button
        protected void Button1_Click(object sender, EventArgs e)
        {
            DeleteUserUsingId();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists()) // to avoide same user_id
            {
                UpdateMemberId();

            }
            else
            {
                Response.Write("<script>alert('User Id doesnt exist in database');</script>");
            }
        }

        // user defined methods

        void UpdateMemberId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET patient_id=@patient_id WHERE user_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@patient_id", TextBox7.Text.Trim());

                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('User Updated successfully');</script>"); // print this message after successful signup
                GridView1.DataBind();
                Clearform();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }

        }

        bool CheckMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where user_id='" + TextBox1.Text.Trim() + "';", con);
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
        void DeleteUserUsingId()
        {
            if (CheckMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE from member_master_tbl WHERE user_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery(); // code exceute 

                    con.Close(); // to close connection
                    Response.Write("<script>alert('User Removed successfully');</script>"); // print this message after successful signup
                    GridView1.DataBind();
                    Clearform();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
                }
            }
            else
            {
                Response.Write("<script>alert('User Id Doesnt exist');</script>");
            }

        }


        //void UpdateMeberStatusuUsingId(String status)
        //{
        //    if (CheckMemberExists())
        //    {
        //        try
        //        {
        //            SqlConnection con = new SqlConnection(strcon);
        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();

        //            }
        //            SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE user_id='" + TextBox1.Text.Trim() + "'", con);
        //            cmd.ExecuteNonQuery();
        //            con.Close();

        //            Response.Write("<script>alert('Member Status Updated');</script>");
        //            GridView1.DataBind();
        //            Clearform();
        //        }
        //        catch (Exception ex) //If there is signup error
        //        {
        //            Response.Write("<script>alert('" + ex.Message + "');</script>");
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('User Id Invalid');</script>");
        //    }

        //}

        void GetUserById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where user_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows) // Use sql querie and getting values from data table.(dr i.e data reader)
                {
                    while (dr.Read()) // checking if there is any record stored.
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(9).ToString();
                        TextBox3.Text = dr.GetValue(1).ToString();
                        TextBox4.Text = dr.GetValue(2).ToString();
                        TextBox5.Text = dr.GetValue(3).ToString();
                        TextBox6.Text = dr.GetValue(4).ToString();
                        TextBox8.Text = dr.GetValue(5).ToString();
                        TextBox9.Text = dr.GetValue(6).ToString();
                    }

                }
                else // send message if the username or password is invalid.
                {
                    Response.Write("<script>alert('Invalid User id');</script>");
                }

            }
            catch (Exception ex) //If there is signup error
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void Clearform()
        {
            TextBox2.Text = "";
            TextBox7.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
        }

        
    }
}