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
    public partial class AppointmentsStatus : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            if (!IsPostBack) // To avoid data reload.
            {
                FillDoctorName();
            }
        }

        // Update link button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckPatientExist())
            {
                UpdateAppointmentStatus();
            }
            else
            {
                Response.Write("<script>alert('Sorry you Patient doesn't exist');</script>");
            }
        }

        // Go link button.
        protected void Button2_Click(object sender, EventArgs e)
        {
            GetPatientByid();
        }

        // User Defined function.

        void UpdateAppointmentStatus()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE appointment_master_tbl SET issued_date=@issued_date,time=@time,doctor_name=@doctor_name,status=@status WHERE user_id='" + TextBox1.Text.Trim() + "'AND department='" + TextBox8.Text.Trim() + "'AND patient_name='" + TextBox2.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@issued_date", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@time", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@doctor_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Appointment Issued Successfully.');</script>");
                GridView1.DataBind();

            }
            catch
            {

            }
        }

        void GetPatientByid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from appointment_master_tbl where user_id='" + TextBox1.Text.Trim() + "' AND status='Accepted';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                    TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                    TextBox4.Text = dt.Rows[0]["address"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["doctor_name"].ToString();
                    TextBox8.Text = dt.Rows[0]["department"].ToString();
                    TextBox5.Text = dt.Rows[0]["request_date"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["time"].ToString();
                    TextBox7.Text = dt.Rows[0]["issued_date"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["Status"].ToString().Trim();

                }
                else
                {
                    Response.Write("<script>alert('Invalid User ID Or user have no appointments.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        bool CheckPatientExist()
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

        void FillDoctorName() // for doctor dropdownlist and department droplist.
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT doctor_name from doctor_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "doctor_name";
                DropDownList2.DataBind();
            }
            catch
            {

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Checking condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    string status = Convert.ToString(e.Row.Cells[3].Text);
                    if (status == "Pending")
                    {
                        e.Row.BackColor = System.Drawing.Color.Yellow;
                    }
                    else
                    if(status=="Success")
                    {
                        e.Row.BackColor = System.Drawing.Color.LightGreen;
                    }
                    else
                    if (status == "New Appointment")
                    {
                        e.Row.BackColor = System.Drawing.Color.Orange;
                    }
                    else if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception)
            {

            }
        }
    }
}