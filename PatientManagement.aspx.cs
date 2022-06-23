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
    public partial class PatientManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        // Add button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            {
                if (CheckIfpatientExist()) // to avoide same user_id
                {

                    Response.Write("<script>alert('Patient Already Exist with this User ID, try other ID');</script>");
                }
                else
                {
                    AddNewPatients();
                }
            }

        }

        // Update Button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            {
                if (CheckIfpatientExist()) // to avoide same user_id
                {

                    UpdatePatient();
                }
                else
                {
                    Response.Write("<script>alert('Patient Id doesnt exist in database');</script>");
                }
            }
        }

        // Remove patient Button Click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckIfpatientExist()) // to avoide same user_id
            {
                DeletePatient();

            }
            else
            {
                Response.Write("<script>alert('Patient Id doesnt exist in database');</script>");
            }

        }

        // Ckeck Button click
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GetPatientByid();
        }
        // User defined function


        void GetPatientByid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from patient_master_tbl where patient_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    TextBox4.Text = dt.Rows[0][1].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0][2].ToString().Trim();
                    TextBox1.Text = dt.Rows[0][3].ToString().Trim();
                    TextBox2.Text = dt.Rows[0][4].ToString();
                    TextBox7.Text = dt.Rows[0]["age"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["email_id"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["State"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["city"].ToString();
                    TextBox5.Text = dt.Rows[0]["address"].ToString().Trim();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Patient ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void DeletePatient()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from patient_master_tbl WHERE patient_id='" + TextBox3.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Patient Removed successfully');</script>"); // print this message after successful signup
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }


        void UpdatePatient()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE patient_master_tbl SET full_name=@full_name,gender=@gender,contact=@contact,dob=@dob,age=@age,email_id=@email_id,state=@state,city=@city,address=@address WHERE patient_id='" + TextBox3.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@email_id", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", TextBox5.Text.Trim());


                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Patient Updated successfully');</script>"); // print this message after successful signup
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }

        void AddNewPatients()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO patient_master_tbl(patient_id,full_name,gender,contact,dob,age,email_id,state,city,address) values (@patient_id, @full_name, @gender, @contact, @dob,@age,@email_id, @state, @city, @address)", con);
                cmd.Parameters.AddWithValue("@patient_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@full_name", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@email_id", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", TextBox5.Text.Trim());



                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Patient added successfully');</script>"); // print this message after successful signup
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
            }
        }

        bool CheckIfpatientExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from patient_master_tbl where patient_id='" + TextBox3.Text.Trim() + "';", con);
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
            TextBox7.Text = "";
            TextBox9.Text = "";
            DropDownList1.SelectedItem.Value = "";
            DropDownList2.SelectedItem.Value = "";
            DropDownList3.SelectedItem.Value = "";
        }
    }
}