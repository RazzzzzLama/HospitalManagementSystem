<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adminlogin.aspx.cs" Inherits="HospitalManagementSystem.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row justify-content-md-center"">
            <div class="col-5 py-4">

                <div class="card">

                    <div class="card-body">

                        <div class="row">

                            <div class="col">
               <a href="Home.aspx"> <i class=" fa fa-home" style="color:orange; font-size:20px;"></i></a>
                <a href="Home.aspx" style="color:gray" > Back to home</a><br /><br />
                                <center>
                                    <img width="150" src="imgs/adminuser.png" />

                                  </center>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h4>Admin Login</h4>
                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">  
                                  <center>  
                                      <label">Admin ID </label>
                                  </center>
                                
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Enter User ID"></asp:TextBox>
                                 
                                        </div>  
                                         <center>
                                             <label"> Admin Password </label>

                                         </center>
                                 <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Enter your password" TextMode="Password"></asp:TextBox>
                   
                                        </div>                      
                                        <div class="form-group col-md-5 mx-auto"style="margin-top:20px;">
                                            <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login." OnClick="Button1_Click"/>
                                         </div>
                            </div>
                        </div>

                    </div>
                </div>
                <br />
                <br /><br />
             </div>
        </div>
    </div>

</asp:Content>
