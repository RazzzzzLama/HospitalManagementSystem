using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
namespace HospitalManagementSystem
{
    public partial class AppointmentIssuing : System.Web.UI.Page
    {
        //Creating a connection to my database using the connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            if (!IsPostBack) // To avoid data reload.
            {
                FillDoctorName();
                
         
            }
        }
        // Issue link button

        protected void Button3_Click(object sender, EventArgs e)
        {
                IssueAppointment();
           // SendMail();
        }

        // remove appointmnet link button.
        protected void Button4_Click(object sender, EventArgs e)
        {      
                DeletePendingAppointment();          
        }

        // check link button.
        protected void Button2_Click(object sender, EventArgs e)
        {
            GetPatientByid();
        }


        // user derfined function.

        //void SendMail()
        //{

        //    try
        //    {
        //        using (MailMessage mail = new MailMessage())
        //        {
        //            mail.From = new MailAddress("anishlama851@gmail.com");
        //            mail.To.Add("razzzzzlama@gmail.com");
        //            mail.Subject = " Your appointment request";
        //            mail.Body = "Dear User,<br /><br /> Your appintment for has been Accepted. Check full details on your profile appointment Stats. Please Vist hospital 15 min earlier " + TextBox6.Text.Trim() + "<br /><br /> Thank you.";

        //            mail.IsBodyHtml = true;

        //            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
        //            {
        //                smtp.Credentials = new System.Net.NetworkCredential("anishlama851@gmail.com", "lama123456");
        //                smtp.EnableSsl = true;
        //                smtp.Send(mail);
        //                Response.Write("<script>alert('Mail send');</script>");

        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {


        //    }

        //}


        void DeletePendingAppointment()
        {
            if (CheckPatientExist())
            {
                try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from appointment_master_tbl Where user_id='" + TextBox1.Text.Trim() + "' AND status='Pending';", con);

                cmd.ExecuteNonQuery(); // code exceute 

                con.Close(); // to close connection
                Response.Write("<script>alert('Appointment Removed successfully');</script>");
                GridView1.DataBind();
                 
            }
            catch
            {

            }
            }
            else
            {
                Response.Write("<script>alert('User id Invalid ');</script>");
            }

        }

        void IssueAppointment()
        {
            if (CheckPatientExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE appointment_master_tbl SET issued_date=@issued_date,time=@time,doctor_name=@doctor_name,status=@status WHERE user_id='" + TextBox1.Text.Trim() + "'AND department='" + DropDownList3.SelectedValue.Trim() + "'AND patient_name='" + TextBox2.Text.Trim() + "'", con);
                    cmd.Parameters.AddWithValue("@issued_date", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@time", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@doctor_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.Value);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Appointment Issued Successfully.');</script>");
                    GridView1.DataBind();
                    Clearform();
                }
                catch
                {

                }
            }
           
            else
            {
                Response.Write("<script>alert('User id Invalid ');</script>");
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
                SqlCommand cmd = new SqlCommand("SELECT * from appointment_master_tbl where user_id='" + TextBox1.Text.Trim() + "' AND status='Pending';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                if (dt.Rows.Count >= 1) // checking if there is any record.
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                    TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                    TextBox4.Text = dt.Rows[0]["address"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["doctor_name"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["department"].ToString();
                    TextBox5.Text = dt.Rows[0]["request_date"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["time"].ToString();
                    TextBox7.Text = dt.Rows[0]["issued_date"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["Status"].ToString().Trim();
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid User ID Or user have no pending appointments.');</script>");
                    Clearform();
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

                cmd = new SqlCommand("SELECT  department from doctor_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "department";
                DropDownList3.DataBind();
            }
            catch
            {

            }
        }
        void Clearform()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox5.Text = "";
            TextBox7.Text = "";           

        }

        // For issued_date past event.
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
                    
                    if (status == "Success")
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
                    else if ((status == "Accepted"))
                    {
                        e.Row.BackColor = System.Drawing.Color.Yellow;
                    }
                }
            }
            catch (Exception)
            {
                
            }
        }
    }
}