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
    public partial class Appointment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CompareValidator1.ValueToCompare = DateTime.Now.ToShortDateString();
            if (!IsPostBack) // To avoid data reload.
            {
                FillDoctorName();
                GetUserData();
               
            }
        }

        // Request appointment link button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(CheckIfAppointmentExist())
            {
                Response.Write("<script>alert('Sorry you already 1 appointment pending. Visit your profile.');</script>");
                
            }
            //else if(CheckIfIdPending())
            //{
            //    Response.Write("<script>alert('Sorry you Id is still pending. Wait for admin to asign Id before Requesting an appointment');</script>");
            //}
            else
            {
                appointmentrequest();                
            }          
            

        }

        // user defined function.

        void GetUserData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where user_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox6.Text = dt.Rows[0]["patient_id"].ToString();
                TextBox8.Text = dt.Rows[0]["user_id"].ToString();
            }
            catch
            {

            }
        }

        void appointmentrequest()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("INSERT INTO appointment_master_tbl (patient_id,patient_name,patient_age,gender,address,email,contact_no,request_date,doctor_name,department,time,issued_date,status,user_id) values(@patient_id,@patient_name,@patient_age,@gender,@address,@email,@contact_no,@request_date,@doctor_name,@department,@time,@issued_date,@status,@user_id)", con);
                cmd.Parameters.AddWithValue("@patient_id", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@patient_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@patient_age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@request_date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@doctor_name", "Pending");
                cmd.Parameters.AddWithValue("@department", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@time", "Pending");
                cmd.Parameters.AddWithValue("@issued_date", "Pending");
                cmd.Parameters.AddWithValue("@status", "Pending");
                cmd.Parameters.AddWithValue("@user_id", TextBox8.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Appointment Requested Successfully.');</script>");
                Clearform();
            }
            catch
            {

            }
        }
        void FillDoctorName() // for doctor dropdownlist.
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT  department from doctor_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "department";
                DropDownList1.DataBind();

            }
            catch
            {

            }
        }

        bool CheckIfAppointmentExist()
        {
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * from appointment_master_tbl where patient_name='" + TextBox1.Text.Trim() + "'AND contact_no='" + TextBox2.Text.Trim() + "'AND status='pending'AND department='" + DropDownList1.SelectedValue.Trim() + "'AND patient_id='" + TextBox6.Text.Trim() + "'AND user_id='" + TextBox8.Text.Trim() + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        //bool CheckIfIdPending()
        //{
        //    {
        //        try
        //        {
        //            SqlConnection con = new SqlConnection(strcon);
        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            SqlCommand cmd = new SqlCommand("SELECT * from appointment_master_tbl where patient_id='pending'", con);
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            if (dt.Rows.Count >= 1)
        //            {
        //                return true;
        //            }
        //            else
        //            {
        //                return false;
        //            }
        //        }
        //        catch (Exception)
        //        {
        //            return false;
        //        }
        //    }
        //}

        void Clearform()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            DropDownList1.SelectedValue = "";
            DropDownList2.SelectedValue = "Select";

        }


    }
}