using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton4.Visible = true; // user login link button
                    LinkButton5.Visible = true; // user Signup link button

                    LinkButton1.Visible = false; // appointment link button
                    LinkButton2.Visible = false; // Get Report link button
                    LinkButton3.Visible = false; // Get Invoice link button
                    LinkButton6.Visible = false; // user logOut link button
                    LinkButton7.Visible = false; // Hello User link button

                    LinkButton8.Visible = true; // Super Admin Login link button
                    LinkButton17.Visible = true; // Super Admin Login link button
                    LinkButton15.Visible = true; //Doctor Login Login Link button
                    LinkButton16.Visible = true; // Lab Login link button
                    LinkButton9.Visible = false; // Doctor Management link button
                    LinkButton10.Visible = false; // Patient Management link button
                    LinkButton11.Visible = false; // Report inventory link button
                    LinkButton12.Visible = false; // Invoice inventory link buttton
                    LinkButton13.Visible = false; // Appointment issuing link button
                    LinkButton14.Visible = false; // Member management link button
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton4.Visible = false; // user login link button
                    LinkButton5.Visible = false; // user Signup link button

                    LinkButton1.Visible = true; // appointment link button
                    LinkButton2.Visible = true; // Get Report link button
                    LinkButton3.Visible = true; // Get Invoice link button
                    LinkButton6.Visible = true; // user logOut link button
                    LinkButton7.Visible = true; // Hello User link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton8.Visible = false; //  Admin Login link button
                    LinkButton17.Visible = false; // Super Admin Login link button
                    LinkButton15.Visible = false; //Doctor Login Login Link button
                    LinkButton16.Visible = false; // Lab Login link button
                    LinkButton9.Visible = false; // Doctor Management link button
                    LinkButton10.Visible = false; // Patient Management link button
                    LinkButton11.Visible = false; // Report inventory link button
                    LinkButton12.Visible = false; // Invoice inventory link buttton
                    LinkButton13.Visible = false; // Appointment issuing link button
                    LinkButton14.Visible = false; // Member management link button
                }
                else if (Session["role"].Equals("HeadAdmin"))
                {
                    LinkButton4.Visible = false; // user login link button
                    LinkButton5.Visible = false; // user Signup link button

                    LinkButton1.Visible = false; // appointment link button
                    LinkButton2.Visible = false; // Get Report link button
                    LinkButton3.Visible = false; // Get Invoice link button
                    LinkButton6.Visible = true; // user logOut link button
                    LinkButton7.Visible = true; // Hello User link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton8.Visible = true; //  Admin Login link button
                    LinkButton17.Visible = false; //Super Admin Login link button
                    LinkButton18.Visible = true; // AddAdmin Link Button
                    LinkButton19.Visible = true; // AddLabMember Link Button
                    LinkButton15.Visible = true; //Doctor Login Login Link button
                    LinkButton16.Visible = true; // Lab Login link button
                    LinkButton9.Visible = true; // Doctor Management link button
                    LinkButton10.Visible = true; // Patient Management link button
                    LinkButton11.Visible = false; // Report inventory link button
                    LinkButton12.Visible = false; // Invoice inventory link buttton
                    LinkButton13.Visible = false; // Appointment issuing link button
                    LinkButton14.Visible = false; // Member management link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton4.Visible = false; // user login link button
                    LinkButton5.Visible = false; // user Signup link button

                    LinkButton1.Visible = false; // appointment link button
                    LinkButton2.Visible = false; // Get Report link button
                    LinkButton3.Visible = false; // Get Invoice link button
                    LinkButton6.Visible = true; // user logOut link button
                    LinkButton7.Visible = true; // Hello User link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton8.Visible = false; //  Admin Login link button
                    LinkButton17.Visible = false; //Super Admin Login link button
                    LinkButton18.Visible = false; // AddAdmin Link Button
                    LinkButton19.Visible = true; // AddLabMember Link Button
                    LinkButton15.Visible = false; //Doctor Login Login Link button
                    LinkButton16.Visible = false; // Lab Login link button
                    LinkButton9.Visible = true; // Doctor Management link button
                    LinkButton10.Visible = true; // Patient Management link button
                    LinkButton11.Visible = false; // Report inventory link button
                    LinkButton12.Visible = false; // Invoice inventory link buttton
                    LinkButton13.Visible = true; // Appointment issuing link button
                    LinkButton20.Visible = false; // Appointment Status link button
                    LinkButton14.Visible = true; // Member management link button
                }
                else if (Session["role"].Equals("Doctor"))
                {
                    LinkButton4.Visible = false; // user login link button
                    LinkButton5.Visible = false; // user Signup link button

                    LinkButton1.Visible = false; // appointment link button
                    LinkButton2.Visible = true; // Get Report link button
                    LinkButton3.Visible = false; // Get Invoice link button
                    LinkButton6.Visible = true; // user logOut link button
                    LinkButton7.Visible = true; // Hello User link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton8.Visible = false; //  Admin Login link button
                    LinkButton17.Visible = false; // Super Admin Login link button
                    LinkButton15.Visible = false; //Doctor Login Login Link button
                    LinkButton16.Visible = false; // Lab Login link button
                    LinkButton18.Visible = false; // AddAdmin Link Button
                    LinkButton19.Visible = false; // AddLabMember Link Button
                    LinkButton9.Visible = false; // Doctor Management link button
                    LinkButton10.Visible = false; // Patient Management link button
                    LinkButton11.Visible = false; // Report inventory link button
                    LinkButton12.Visible = false; // Invoice inventory link buttton
                    LinkButton13.Visible = true; // Appointment issuing link button
                    LinkButton20.Visible = true; // Appointment Status link button
                    LinkButton14.Visible = false; // Member management link button
                }
                else if (Session["role"].Equals("Lab"))
                {
                    LinkButton4.Visible = false; // user login link button
                    LinkButton5.Visible = false; // user Signup link button

                    LinkButton1.Visible = false; // appointment link button
                    LinkButton2.Visible = false; // Get Report link button
                    LinkButton3.Visible = false; // Get Invoice link button
                    LinkButton6.Visible = true; // user logOut link button
                    LinkButton7.Visible = true; // Hello User link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    LinkButton8.Visible = false; //  Admin Login link button
                    LinkButton17.Visible = false; // Super Admin Login link button
                    LinkButton15.Visible = false; //Doctor Login Login Link button
                    LinkButton16.Visible = false; // Lab Login link button
                    LinkButton18.Visible = false; // AddAdmin Link Button
                    LinkButton19.Visible = false; // AddLabMember Link Button
                    LinkButton9.Visible = false; // Doctor Management link button
                    LinkButton10.Visible = true; // Patient Management link button
                    LinkButton11.Visible = true; // Report inventory link button
                    LinkButton12.Visible = true; // Invoice inventory link buttton
                    LinkButton13.Visible = false; // Appointment issuing link button
                    LinkButton14.Visible = false; // Member management link button
                }

            }
            catch (Exception)
            {

            }
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorManagement.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientManagement.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportinventory.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("InvoiceInventory.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppointmentIssuing.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberManagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Appointment.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewReports.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("GetInvoice.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignup.aspx");
        }
        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            Response.Redirect("SuperAdminlogin.aspx");
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctorlogin.aspx");
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("Lablogin.aspx");
        }

        // Logout button link
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["contact_no"] = "";
            Session["role"] = "";
            Session["status"] = "";
            Response.Redirect("Home.aspx");
            LinkButton4.Visible = true; // user login link button
            LinkButton5.Visible = true; // user Signup link button

            LinkButton1.Visible = false; // appointment link button
            LinkButton2.Visible = false; // Get Report link button
            LinkButton3.Visible = false; // Get Invoice link button
            LinkButton6.Visible = false; // user logOut link button
            LinkButton7.Visible = false; // Hello User link button

            LinkButton8.Visible = true; // Admin Login link button
            LinkButton18.Visible = false; // AddAdmin Link Button
            LinkButton19.Visible = false; // AddLabMember Link Button
            LinkButton9.Visible = false; // Doctor Management link button
            LinkButton10.Visible = false; // Patient Management link button
            LinkButton11.Visible = false; // Report inventory link button
            LinkButton12.Visible = false; // Invoice inventory link buttton
            LinkButton13.Visible = false; // Appointment issuing link button
            LinkButton14.Visible = false; // Member management link button
        }

        // Helo User link button
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void LinkButton18_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddAdmin.aspx");
        }

        protected void LinkButton19_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddLabMember.aspx");
        }

        protected void LinkButton20_Click(object sender, EventArgs e)
        {
            Response.Redirect("AppointmentsStatus.aspx");
        }
    }
}