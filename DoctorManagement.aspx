<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorManagement.aspx.cs" Inherits="HospitalManagementSystem.DoctorManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" >
        <div class="row py-5">
            <div class=" col-md-5" >
                <div class="card">  
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Doctor Management</h4>
                                  </center>
                            </div>

                        </div>
                        
                        <div class="row">
                            <div class="col">          
                                <center>
                                    <img width="120" src="imgs/Doctor.png" />
                                  </center>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>                       
                         <div class="row pb-3">
                             <div class="col-4">            
                                  <center>  
                                      <label">Doctor ID</label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder=" Doctor Id" TextMode="Number"></asp:TextBox>
                                      <asp:LinkButton class="btn btn-info" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fa-solid fa-check"></i></asp:LinkButton>
                                  </div>   
                                      </div> 
                            </div>
                                    <div class="col-md-4">                                           
                                             <label">Full name</label>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder="Full Name" TextMode="SingleLine"></asp:TextBox>
                                     </div>
                                 </div>
                             <div class="col-4 ">            
                                  <center>  
                                      <label">Gender </label>
                                  </center>
                                
                                  <div class="form-group">
                                    
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                          <asp:ListItem Text="Male" Value="Male" />
                                          <asp:ListItem Text="Female" Value="Female" />
                                          <asp:ListItem Text="Other" Value="Other" />
                                      </asp:DropDownList>
                                     </div> 
                            </div>
                           

                             <div class="row ps-5">
                                 <hr />
                                 <br />
                             </div>
                             

                           <div class="col-4">            
                                  <center>  
                                      <label">Contact no. </label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Contact no." TextMode="Number" ></asp:TextBox>
                                  </div>   
                                      </div> 
                            </div>
                                    <div class="col-md-5">   
                                        <center>
                                             <label">Department</label>
                                            </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Department"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-3">            
                                   <center>
                                             <label">Age</label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                        placeholder=" Age" TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="row">
                            <div class="col-md-4">            
                                  <center>  
                                      <label">State </label>
                                  </center>
                               
                                  <div class="form-group">
                                      <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
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
                               <center>
                                             <label">City</label>
                               </center>
                                      <div class="form-group">
                                          <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                              <asp:ListItem Text="Select" Value="select" />
                                              <asp:ListItem Text="Achham" Value="Achham"/>
                                                <asp:ListItem Text="Arghakhanchi" Value="Arghakhanchi"/>
                                                <asp:ListItem Text="Baglung" Value="Baglung"/>
                                                <asp:ListItem Text="Baitadi" Value="Baitadi"/>
                                                <asp:ListItem Text="Bajhang" Value="Bajhang"/>
                                                <asp:ListItem Text="Bajura" Value="Bajura"/>
                                                <asp:ListItem Text="Banke" Value="Banke"/>
                                                <asp:ListItem Text="Bara" Value="Bara"/>
                                                <asp:ListItem Text="Bardiya" Value="Bardiya"/>
                                                <asp:ListItem Text="Bhaktapur" Value="Bhaktapur"/>
                                                <asp:ListItem Text="Bhojpur" Value="Bhojpur"/>
                                                <asp:ListItem Text="Chitwan" Value="Chitwan"/>
                                                <asp:ListItem Text="Dadeldhura" Value="Dadeldhura"/>
                                                <asp:ListItem Text="Dailekh" Value="Dailekh"/>
                                                <asp:ListItem Text="Dang " Value="Dang "/>
                                                <asp:ListItem Text="Darchula" Value="Darchula"/>
                                                <asp:ListItem Text="Dhading" Value="Dhading"/>
                                                <asp:ListItem Text="Dhankuta" Value="Dhankuta"/>
                                                <asp:ListItem Text="Dhanusa" Value="Dhanusa"/>
                                                <asp:ListItem Text="Dolakha" Value="Dolakha"/>
                                                <asp:ListItem Text="Dolpa" Value="Dolpa"/>
                                                <asp:ListItem Text="Doti" Value="Doti"/>
                                                <asp:ListItem Text="Gorkha" Value="Gorkha"/>
                                                <asp:ListItem Text="Gulmi" Value="Gulmi"/>
                                                <asp:ListItem Text="Humla" Value="Humla"/>
                                                <asp:ListItem Text="Ilam" Value="Ilam"/>
                                                <asp:ListItem Text="Jajarkot" Value="Jajarkot"/>
                                                <asp:ListItem Text="Jhapa" Value="Jhapa"/>
                                                <asp:ListItem Text="Jumla" Value="Jumla"/>
                                                <asp:ListItem Text="Kailali" Value="Kailali"/>
                                                <asp:ListItem Text="Kalikot" Value="Kalikot"/>
                                                <asp:ListItem Text="Kanchanpur" Value="Kanchanpur"/>
                                                <asp:ListItem Text="Kapilvastu" Value="Kapilvastu"/>
                                                <asp:ListItem Text="Kaski" Value="Kaski"/>
                                                <asp:ListItem Text="Kathmandu" Value="Kathmandu"/>
                                                <asp:ListItem Text="Kavrepalanchok" Value="Kavrepalanchok"/>
                                                <asp:ListItem Text="Khotang" Value="Khotang"/>
                                                <asp:ListItem Text="Lalitpur" Value="Lalitpur"/>
                                                <asp:ListItem Text="Lamjung" Value="Lamjung"/>
                                                <asp:ListItem Text="Mahottari" Value="Mahottari"/>
                                                <asp:ListItem Text="Makwanpur" Value="Makwanpur"/>
                                                <asp:ListItem Text="Manang" Value="Manang"/>
                                                <asp:ListItem Text="Morang" Value="Morang"/>
                                                <asp:ListItem Text="Mugu" Value="Mugu"/>
                                                <asp:ListItem Text="Mustang" Value="Mustang"/>
                                                <asp:ListItem Text="Myagdi" Value="Myagdi"/>
                                                <asp:ListItem Text="Nawalparasi" Value="Nawalparasi"/>
                                                <asp:ListItem Text="Nuwakot" Value="Nuwakot"/>
                                                <asp:ListItem Text="Okhaldhunga" Value="Okhaldhunga"/>
                                                <asp:ListItem Text="Palpa" Value="Palpa"/>
                                                <asp:ListItem Text="Panchthar" Value="Panchthar"/>
                                                <asp:ListItem Text="Parbat" Value="Parbat"/>
                                                <asp:ListItem Text="Parsa" Value="Parsa"/>
                                                <asp:ListItem Text="Pyuthan" Value="Pyuthan"/>
                                                <asp:ListItem Text="Ramechhap" Value="Ramechhap"/>
                                                <asp:ListItem Text="Rasuwa" Value="Rasuwa"/>
                                                <asp:ListItem Text="Rautahat" Value="Rautahat"/>
                                                <asp:ListItem Text="Rolpa" Value="Rolpa"/>
                                                <asp:ListItem Text="Rukum" Value="Rukum"/>
                                                <asp:ListItem Text="Rupandehi" Value="Rupandehi"/>
                                                <asp:ListItem Text="Salyan" Value="Salyan"/>
                                                <asp:ListItem Text="Sankhuwasabha" Value="Sankhuwasabha"/>
                                                <asp:ListItem Text="Saptari" Value="Saptari"/>
                                                <asp:ListItem Text="Sarlahi" Value="Sarlahi"/>
                                                <asp:ListItem Text="Sindhuli" Value="Sindhuli"/>
                                                <asp:ListItem Text="Sindhupalchok" Value="Sindhupalchok"/>
                                                <asp:ListItem Text="Siraha" Value="Siraha"/>
                                                <asp:ListItem Text="Solukhumbu" Value="Solukhumbu"/>
                                                <asp:ListItem Text="Sunsari" Value="Sunsari"/>
                                                <asp:ListItem Text="Surkhet" Value="Surkhet"/>
                                                <asp:ListItem Text="Syangja" Value="Syangja"/>
                                                <asp:ListItem Text="Tanahu" Value="Tanahu"/>
                                                <asp:ListItem Text="Taplejung" Value="Taplejung"/>
                                                <asp:ListItem Text="Terhathum" Value="Terhathum"/>
                                                <asp:ListItem Text="Udayapur" Value="Udayapur"/>

                                          </asp:DropDownList>
                                  </div> 
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Full Address </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder="Full Address"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>
                             
                             <div class="col-12">
                                 <hr />
                            <center>
                            <div class=" col-md-5 badge badge-pill badge-info" >
                                    <h5>login credentials</h5>                     
                            </div>
                             </center>
                        </div>
                             <div class="row">                               
                            <div class="col-md-6">            
                                  <center>  
                                      <label">User ID </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                        placeholder=" User ID "></asp:TextBox>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Password </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                        placeholder=" Password " TextMode="Password"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>

                             <div class="row col-12 py-4" style="margin-top:10px;">

                             <div class="col-md-4 ">
                             <asp:Button CssClass="btn btn-success btn-lg btn-block" ID="Button3" runat="server" Text=" Add " OnClick="Button3_Click" />
                              </div>
                              <div class="col-md-4 ">
                                  <asp:Button CssClass="btn btn-warning btn-lg btn-block" ID="Button1" runat="server" Text="Update " OnClick="Button1_Click" />
                                   </div>
                                       <div class="col-md-4 ">
                                   <asp:Button CssClass="btn btn-lg btn-block btn-danger" ID="Button2" runat="server" Text="Remove Doctor " OnClick="Button2_Click" />
                                  </div>

             </div> 
                         </div>

                    </div>

                </div>


            </div>
             <div class="col-md-7">
                 <div class="card"  >

                    <div class="card-body" >

                   
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h3> Doctor List</h3>

                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT [doctor_id], [doctor_name], [gender], [contact], [department], [password] FROM [doctor_master_tbl]"></asp:SqlDataSource>
                            <div class="col">            
                                <asp:GridView class="table table-striped table-bordered"
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="doctor_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="doctor_id" HeaderText="doctor_id" ReadOnly="True" SortExpression="doctor_id" />
                                        <asp:BoundField DataField="doctor_name" HeaderText="doctor_name" SortExpression="doctor_name" />
                                        <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                                        <asp:BoundField DataField="contact" HeaderText="contact" SortExpression="contact" />
                                        <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
                                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                   
                    </div>
                </div>

                <br />
                <br />


            </div>
        </div>
        </div>
</asp:Content>
