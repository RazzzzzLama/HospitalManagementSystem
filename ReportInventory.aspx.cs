using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class ReportInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // To avoid data reload.
            {
                FillDoctorName();
            }

            GridView1.DataBind();
        }

        // Add report button link
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckIfReportExist()) // to avoide same user_id
            {

                Response.Write("<script>alert('Report Already Exist with this Report ID, try other ID');</script>");
            }
            else
            {
                AddNewReport();
            }
        }

        // Update report button link
        protected void Button1_Click(object sender, EventArgs e)
        {
            UpdateReportById();
        }

        // Delete report button link
        protected void Button2_Click(object sender, EventArgs e)
        {
            DeleteReportById();
        }


        // Go button link
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GetReportById();
        }


        // User defined function


        void DeleteReportById()
        {
            if (CheckIfReportExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE from report_master_tbl WHERE report_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery(); // code exceute 

                    con.Close(); // to close connection
                    Response.Write("<script>alert('Report Removed successfully');</script>"); // print this message after successful signup
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
                }
            }
            else
            {
                Response.Write("<script>alert('Report Id Doesnt exist');</script>");
            }
        }

        void UpdateReportById()
        {
            if (CheckIfReportExist())
            {
                try
                {
                    string filepath = "~/Report_inventory/Ambulance.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("Report_inventory/" + filename));
                        filepath = "~/Report_inventory/" + filename;
                    }
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE report_master_tbl SET patient_name=@patient_name,age=@age,address=@address,city=@city,state=@state,dob=@dob,contact=@contact,gender=@gender,checkup_date=@checkup_date,report_publish_date=@report_publish_date,doctor_name=@doctor_name,checkup_type=@checkup_type,Dicscription=@Dicscription,Reportfile=@Reportfile,invoice_no=@invoice_no,patient_id=@patient_id WHERE report_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@patient_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@dob", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@checkup_date", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@report_publish_date", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@doctor_name", DropDownList5.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@checkup_type", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@Dicscription", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@Reportfile", filepath);
                    cmd.Parameters.AddWithValue("@invoice_no", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@patient_id", TextBox11.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Report Updated Successfully');</script>");
                    GridView1.DataBind();

                }
                catch (Exception ex) //If there is signup error
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Report Id Invalid');</script>");
            }
        }
        void GetReportById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from report_master_tbl WHERE report_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["patient_name"].ToString();
                    TextBox7.Text = dt.Rows[0]["age"].ToString().Trim();
                    TextBox12.Text = dt.Rows[0]["address"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["city"].ToString();
                    DropDownList2.SelectedValue = dt.Rows[0]["state"].ToString();
                    TextBox3.Text = dt.Rows[0]["dob"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["contact"].ToString().Trim();
                    DropDownList1.SelectedValue = dt.Rows[0]["state"].ToString();
                    TextBox6.Text = dt.Rows[0]["checkup_date"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["report_publish_date"].ToString().Trim();
                    DropDownList5.SelectedValue = dt.Rows[0]["doctor_name"].ToString();
                    TextBox10.Text = dt.Rows[0]["checkup_type"].ToString();
                    TextBox5.Text = dt.Rows[0]["Dicscription"].ToString();
                    TextBox9.Text = dt.Rows[0]["invoice_no"].ToString();
                    TextBox11.Text = dt.Rows[0]["patient_id"].ToString();


                    global_filepath = dt.Rows[0]["Reportfile"].ToString();
                }


                else
                {
                    Response.Write("<script>alert('Report Id is invalid');</script>");
                }
            }
            catch (Exception)
            {

            }
        }

        void AddNewReport()
        {
            try
            {  // File upload code.
                string filepath = "~/Report_inventory/Ambulance.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Report_inventory/" + filename));
                filepath = "~/Report_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO report_master_tbl(report_id,patient_name,age,address,city,state,dob,contact,gender,checkup_date,report_publish_date,doctor_name,checkup_type,Dicscription,Reportfile,invoice_no,patient_id) values (@report_id,@patient_name,@age,@address,@city,@state,@dob,@contact,@gender,@checkup_date,@report_publish_date,@doctor_name,@checkup_type,@Dicscription,@Reportfile,@invoice_no,@patient_id)", con);

                cmd.Parameters.AddWithValue("@report_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@patient_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@dob", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@checkup_date", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@report_publish_date", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@doctor_name", DropDownList5.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@checkup_type", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@Dicscription", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Reportfile", filepath);
                cmd.Parameters.AddWithValue("@invoice_no", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@patient_id", TextBox11.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Report Added successfully');</script>");
                GridView1.DataBind();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void FillDoctorName() // for doctor and patient dropdownlist.
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT  doctor_name from doctor_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.
                DropDownList5.DataSource = dt;
                DropDownList5.DataValueField = "doctor_name";
                DropDownList5.DataBind();

              
            }
            catch
            {

            }
        }

        bool CheckIfReportExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from report_master_tbl where report_id='" + TextBox1.Text.Trim() + "';", con);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}