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
    public partial class InvoiceInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Add Invoice link button.
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheckIfInvoiceExist()) // to avoide same user_id
            {

                Response.Write("<script>alert('Invoice Already Exist with this Invoice no.');</script>");
            }
            else
            {
                AddReport();
            }
        }

        // Update Invoice link button.
        protected void Button1_Click(object sender, EventArgs e)
        {
            UpdateInvoice();
        }

        // Delete Invoice link button.
        protected void Button2_Click(object sender, EventArgs e)
        {
            DeleteReport();
        }

        // Go Link button for using Invloce ID.
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GetInvoiceById();
        }

        // User defined function.

        void DeleteReport()
        {
            if(CheckIfInvoiceExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE from invoice_master_tbl WHERE invoice_no='" + TextBox3.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery(); // code exceute 

                    con.Close(); // to close connection
                    Response.Write("<script>alert('Invoice Removed successfully');</script>"); // print this message after successful signup
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>"); //If there is signup error
                }
            }
            else
            {

                Response.Write("<script>alert('Invoice no. Doesnt exist');</script>");
            }
        }

        void UpdateInvoice()
        {
            if(CheckIfInvoiceExist())
            {
                try
                {
                    string filepath = "~/Invoice_inventory/Ambulance.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("Invoice_inventory/" + filename));
                        filepath = "~/Invoice_inventory/" + filename;
                    }
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand("UPDATE invoice_master_tbl SET date=@date,contact_no=@contact_no,admission_date=@admission_date,discharge_date=@discharge_date,gender=@gender,patient_id=@patient_id,full_name=@full_name,age=@age,address=@address,city=@city,state=@state,InvoiceFile=@InvoiceFile WHERE invoice_no='" + TextBox3.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@date", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_no", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@admission_date", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@discharge_date", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@patient_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@InvoiceFile", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Invoice Updated successfully');</script>");
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invoice no. Invalid');</script>");
            }
        }

        void GetInvoiceById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from invoice_master_tbl WHERE invoice_no='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); // Use sql querie and fill indide (dt) data table.

                if (dt.Rows.Count >= 1)
                {
                    TextBox1.Text = dt.Rows[0]["patient_id"].ToString().Trim();
                    TextBox2.Text = dt.Rows[0]["full_name"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["date"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["contact_no"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["admission_date"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["age"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["discharge_date"].ToString().Trim();
                    TextBox12.Text = dt.Rows[0]["address"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["state"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["city"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["gender"].ToString();

                    global_filepath = dt.Rows[0]["InvoiceFile"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invoice no. is invalid');</script>");
                }
            }
            catch
            {

            }
        }

        void AddReport()
        {
            try
            {
                // File upload code.
                string filepath = "~/Invoice_inventory/Ambulance.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Invoice_inventory/" + filename));
                filepath = "~/Invoice_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO invoice_master_tbl (invoice_no,date,contact_no,admission_date,discharge_date,gender,patient_id,full_name,age,address,city,state,InvoiceFile) values (@invoice_no,@date,@contact_no,@admission_date,@discharge_date,@gender,@patient_id,@full_name,@age,@address,@city,@state,@InvoiceFile) ", con);

                cmd.Parameters.AddWithValue("@invoice_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@admission_date", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@discharge_date", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@patient_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@full_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@age", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@city", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@state", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@InvoiceFile", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Invoice Added successfully');</script>");
                GridView1.DataBind();

            }
            catch
            {

            }
        }

        bool CheckIfInvoiceExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from invoice_master_tbl where invoice_no='" + TextBox3.Text.Trim() + "';", con);
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}