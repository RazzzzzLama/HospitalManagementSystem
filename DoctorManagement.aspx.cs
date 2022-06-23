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
    public partial class DoctorManagement : System.Web.UI.Page
    {
        //Creating a connection to my database using the connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            
        }

        // add button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckIfDoctorExist()) // to avoide same user_id
            {

                Response.Write("<script>alert('Doctor Already Exist with this Docotor ID, try other ID');</script>");
            }
            else if (CheckIfDoctorUserIdExist())
            {
                Response.Write("<script>alert('Doctor Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                AddNewDoctor();


            }
        }
        // update button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckIfDoctorExist()) // to avoide same user_id
            {
                UpdateDoctor();
               

            }
            else if (CheckIfDoctorUserIdExist())
            {
                Response.Write("<script>alert('Doctor Already Exist with this User ID, try other ID');</script>");
            }

            else
            {
                Response.Write("<script>alert('Doctor Id doesnt exist in database');</script>");
            }
        }
        //remove button click
        protected void Button2_Click(object sender, EventArgs e)
        {

            if (CheckIfDoctorExist()) // to avoide same user_id
            {
                DeleteDoctor();

            }
            else if (CheckIfDoctorUserIdExist())
            {
                Response.Write("<script>alert('Doctor Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                Response.Write("<script>alert('Doctor Id doesnt exist in database');</script>");
            }
        }

        // Go button click
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GetDoctorByid();
            
        }


        // User defined function


        void GetDoctorByid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from doctor_master_tbl where doctor_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    TextBox4.Text = dt.Rows[0][1].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["gender"].ToString();
                    TextBox1.Text = dt.Rows[0]["contact"].ToString().Trim();
                    TextBox2.Text = dt.Rows[0]["department"].ToString();
                    TextBox7.Text = dt.Rows[0]["age"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["State"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["City"].ToString();
                    TextBox6.Text = dt.Rows[0][9].ToString();
                    TextBox5.Text = dt.Rows[0]["address"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Doctor ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void DeleteDoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from doctor_master_tbl WHERE doctor_id='" + TextBox3.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Doctor Removed successfully');</script>"); 
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }


        void UpdateDoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE doctor_master_tbl SET doctor_name=@doctor_name,gender=@gender,contact=@contact,department=@department,age=@age,state=@state,city=@city,address=@address WHERE doctor_id='" + TextBox3.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@doctor_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@department", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", TextBox5.Text.Trim());


                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Doctor Updated successfully');</script>"); // print this message after successful signup
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }

        void AddNewDoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO doctor_master_tbl(doctor_id,doctor_name,gender,contact,department,age,state,city,address,user_id,password) values (@doctor_id, @doctor_name, @gender, @contact, @department, @age, @state, @city, @address,@user_id,@password)", con);
                cmd.Parameters.AddWithValue("@doctor_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@doctor_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@department", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());


                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Doctor added successfully');</script>"); // print this message after successful signup
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }

        bool CheckIfDoctorExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from doctor_master_tbl where doctor_id='" + TextBox3.Text.Trim() + "';", con);
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

        bool CheckIfDoctorUserIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from doctor_master_tbl where user_id='" + TextBox6.Text.Trim() + "';", con);
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
        void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            DropDownList1.SelectedItem.Value = "";
            DropDownList2.SelectedItem.Value = "";
            DropDownList3.SelectedItem.Value = "";
        }
    }
}