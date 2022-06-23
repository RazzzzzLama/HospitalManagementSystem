using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class UserProfile : System.Web.UI.Page
    {
        //Creating a connection to my database using the connection string
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    getUserAppointmentData();

                    if (!Page.IsPostBack)
                    {
                        GetUserData();
                        GridView1.DataBind();
                    }

                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
        }

        // update proifle link button.
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                
                UpdateUserData();
            }
            
        }
        // Cancle Appointment Link button
        protected void Button2_Click(object sender, EventArgs e)
        {
            CancleAppointment();
        }


        // user defined function.

        void CancleAppointment()
        {
            if (CheckAppointmentExists())
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE from appointment_master_tbl WHERE patient_name='" + TextBox11.Text.Trim() + "' AND contact_no='" + TextBox12.Text.Trim() + "' AND status='Pending';", con);
                 cmd.ExecuteNonQuery(); // code exceute 
                    con.Close(); // to close connection
                    Response.Write("<script>alert('Appointment Removed successfully');</script>"); // print this message after successful signup
                     GridView1.DataBind();

            }
                catch (Exception ex)
                {
                Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is  error
                 }
            else
            {
                    Response.Write("<script>alert('Appointment Stats Doesn`t exist');</script>");  
            }
            
        }

        bool CheckAppointmentExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from appointment_master_tbl where patient_name='" + TextBox11.Text.Trim() + "' AND contact_no='" +TextBox12.Text.Trim()+ "' AND patient_id='"+Label1.Text.Trim()+"'  AND status='Pending';", con);
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

        void UpdateUserData()
        {
            string password = "";
            if (TextBox9.Text.Trim() == "")
            {
                password = TextBox8.Text.Trim();
            }
            else
            {
                password = TextBox9.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl set full_name=@full_name,dob= @dob,contact_no=@contact_no,email_id=@email_id,state=@state,city=@city,full_address=@full_address,password=@password WHERE user_id='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email_id", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    GetUserData();                  
                    getUserAppointmentData();
                    LogOut();
                   
                    Server.Transfer("UserLogin.aspx"); 
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch
            {

            }
        }

        void getUserAppointmentData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from appointment_master_tbl where user_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
            catch (Exception )
            {
               
            }
        }

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

                TextBox1.Text = dt.Rows[0]["full_name"].ToString();
                TextBox2.Text = dt.Rows[0]["dob"].ToString();
                TextBox3.Text = dt.Rows[0]["contact_no"].ToString();
                TextBox4.Text = dt.Rows[0]["email_id"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["state"].ToString();
                TextBox6.Text = dt.Rows[0]["city"].ToString();
                TextBox7.Text = dt.Rows[0]["full_address"].ToString();
                TextBox5.Text = dt.Rows[0]["user_id"].ToString();
                TextBox8.Text = dt.Rows[0]["password"].ToString();
                Label1.Text = dt.Rows[0]["patient_id"].ToString().Trim();
                
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
                        DateTime dt = Convert.ToDateTime(e.Row.Cells[11].Text);
                        DateTime today = DateTime.Today;
                    string status = Convert.ToString(e.Row.Cells[12].Text.Trim());

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
                    
                }
            }
            catch (Exception )
                {
                    
                }
        }
        void LogOut()
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["contact_no"] = "";
            Session["role"] = "";
            Session["status"] = "";
        }
    }
}