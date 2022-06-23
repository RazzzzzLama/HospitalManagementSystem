<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="HospitalManagementSystem.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid py-5">
        <div class="row ">
            <div class="col-md-5 ml-5">

                <div class="card"  >

                    <div class="card-body" >

                        <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="150" src="imgs/generaluser.png" />

                                  </center>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col" style="font-size: medium">
                                <center>
                                    <h5>Your Profile</h5>
                                    <span>ID - </span>
                                    <asp:Label class="badge  bg-light fa-1ax fa-1x"  ID="Label1" runat="server" Text="Your ID is pending"></asp:Label>
                                  </center>
                            </div>
                        </div>
                        
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">            
                                  <center>  
                                      <label">Full Name </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Full Name"></asp:TextBox>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Date of Birth </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Date of Birth " TextMode="Date"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>
                        <div class="row">
                            <div class="col-md-6">            
                                  <center>  
                                      <label">Contact No. </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder=" Contact No" TextMode="Number"></asp:TextBox>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Email ID </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder=" Email ID" TextMode="Email"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>

                        <div class="row">
                            <div class="col-md-4">            
                                  <center>  
                                      <label">State </label>
                                  </center>
                               
                                  <div class="form-group">
                                      <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                          <asp:ListItem Text="Select" Value="select" />
                                          <asp:ListItem Text="Province No. 1" Value="Province No. 1" />
                                          <asp:ListItem Text="Madhesh Province" Value="Madhesh Province" />
                                          <asp:ListItem Text="Bagmati Province" Value="Bagmati Province" />
                                          <asp:ListItem Text="Gandaki Province" Value="Gandaki Province" />
                                          <asp:ListItem Text="Lumbini Province" Value="Lumbini Province" />
                                          <asp:ListItem Text="Karnali Province" Value="Karnali Province" />
                                          <asp:ListItem Text="Sudurpashchim Province" Value="Sudurpashchim Province" />

                                      </asp:DropDownList>
                                      
                                  </div>   
                            </div>
                                    <div class="col-md-4">                                          
                                             <label">City </label>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                        placeholder=" City" TextMode="SingleLine"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Full address </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                        placeholder=" address"></asp:TextBox>
                                     </div>
                                 </div>

                         </div>

                         <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>

                        <div class="row py-3" style="padding-left:250px;">
                            
                            <div class="col-5 badge badge-pill badge-info" >
                                    <h5>login credentials</h5>                     
                            </div>
                             
                        </div>
                         <div class="row">
                            <div class="col-md-4">            
                                  <center>  
                                      <label">User ID </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder=" User ID " ReadOnly="True"></asp:TextBox>
                                  </div>   
                            </div>
                                    <div class="col-md-4">            
                                   <center>
                                             <label">Old Password </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                        placeholder=" password" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>

                             <div class="col-md-4">            
                                   <center>
                                             <label"> NewPassword </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" 
                                        placeholder=" Password " TextMode="Password" ReadOnly="False"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>
                        
                        <br />
                        <div class="row">

                            <div class="col">  
                                  
                                      <div class="form-group d-grid gap-2 col-4 mx-auto" style="margin-top:10px;">
                                          <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update." OnClick="Button1_Click" />
                                      </div>     
                                <br />

                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />
                 
             </div>
           <div class="col-md-6 ml-5">
                 <div class="card"  >
                   <div class="card-body" style="background-color:#e6fff2;">
        <center>
            <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="120"  src="imgs/Note.png" />

                                  </center>
                            </div>

                        </div>
            <h1 class="card-title  fa-2x border-bottom border-primary" style="color:blueviolet; opacity:0.6;">Basic Notes</h1>
        </center>
        <p class="card-text text-justify">“A fit body, a calm mind, a house full of love. These things cannot be bought – they must be earned.” – Naval Ravikant</p>
          <div>
          <h5 style="font-size: x-large; color:blueviolet;">Profile</h5>
          <ul>
              <li>You will get your Id when admin verifies profile.</li>
                <li>
                   You need to palce your original Data to get verified.
                </li>
              <li>
                 Falls Data may lead into problems
               </li>
              <li>
                 You cannot change your user ID.
               </li>
              
          </ul>
          </div>
                       <div>
                           <hr />
                       </div>
          <div>
          <h5 style="font-size: x-large; color:blueviolet;" >Invoice and Report</h5>
              <p><small>To get your Invoice And Report: –</small></p>
          <ul>
              <li><small>You need to use same contact number on your profile that you have written in invoice.</small></li>
                <li>
                   <small>Patient Id is necessary to get report.</small>
                </li>
              <li>
                  <small>Invoice number is necessary to get report</small>                 
                </li>
              <li>
                  <small>You need to pay bills physically to get the invoice number.</small>
              </li>
              <li>
                  <small>Once you have invoice number and patient id you will be able to download your report.</small>      
                </li>
             
          </ul>
          </div>
                       <div>
          <h5 style="font-size: x-large; color:blueviolet;">Appointments</h5>
             
          <ul>
              <li>
                  You can cancle your appointment from here.
              </li>
                <li>
                   Appointment Table have different colors based on your appointmnet status.
                </li>
              
              <li>
                 Your Appointment is marked Green if it is Success.
               </li>
              <li>
                 Your Appointment is marked Red if it is accepted and isued date has passed.
               </li>
              <li>
                 Your Appointment is marked Oragne if it says new date.
               </li>
              
          </ul>
          </div>
        
      </div>
                    </div>
               </div>
            
        </div>           
    </div>
    <div class="px-4">
        <div class="col-lg-12 pt-2">
                 <div class="card"  >

                    <div class="card-body" style="background-color:#e6f7ff;" >

                        <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="80"  src="imgs/FormLogo.png" />

                                  </center>
                            </div>


                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h5>Your Appointments</h5>
                                    <asp:Label CssClass="badge badge-primary" ID="Label2" runat="server" Text="Your appointment status"></asp:Label>
                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                            <br />
                        <div class="row">
                            <div class="col-md-6">            
                                  <center>  
                                      <label">Patient name. </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" 
                                        placeholder=" Patient name "></asp:TextBox>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Contact no</label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" 
                                        placeholder=" Contact no" TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>

                             <div class="col-md-3 mx-auto">            
                                   <div class="form-group pt-3" style="margin-top:10px;">
                                          <asp:Button class="btn btn-warning btn-block" ID="Button2" runat="server" Text="Cancle Appointment" OnClick="Button2_Click" />
                                      </div>  
                             </div>
                            
                         </div>
                        <p style="font-size: medium; font-style: normal; font-weight: bold">Note: Appointment will only be canceled if it's status is pending. Once it is issued it cannot be canceled</p>
                            <br />
                        <div class="row">
                            <div class="col">            
                               <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                                   <AlternatingRowStyle BackColor="White" />
                                   <EditRowStyle BackColor="#2461BF" />
                                   <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                   <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                   <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                   <RowStyle BackColor="#EFF3FB" />
                                   <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                   <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                   <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                   <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                   <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                        </div>                
                    </div>
                </div>

                <br />
                <br />


            </div>
    </div>

</asp:Content>
