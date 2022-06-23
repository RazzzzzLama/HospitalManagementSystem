<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberManagement.aspx.cs" Inherits="HospitalManagementSystem.MemberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row py-4">
            <div class="col-md-5">

                <div class="card"  >

                    <div class="card-body" >

                        <div class="row">

                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                  </center>
                            </div>
                        </div>
                         <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="120" src="imgs/generaluser.png" />

                                  </center>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>

                        <div class="row pb-3">
                           <div class="col-3">            
                                  <center>  
                                      <label">User Id </label>
                                  </center>
                                
                                  <div class="form-group">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Member Id"></asp:TextBox>
                                      <asp:LinkButton CssClass="btn btn-info" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                  </div>   
                                      </div> 
                            </div>
                                    <div class="col-md-4">            
                                   <center>
                                             <label">Full name</label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Full name" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-5">            
                                   <center>
                                             <label">Account ID</label>
                                         </center> 
                                    <div class="form-group">  
                                        <div class="input-group">
                                    <asp:TextBox CssClass="form-control mr-1" ID="TextBox7" runat="server" 
                                        placeholder="Member ID"></asp:TextBox>
                                        
                                     </div>
                                 </div>
                                 </div>
                             
                            
                         </div>

                        <div class="row pb-3">
                           
                                    <div class="col-md-3">            
                                   <center>
                                             <label">DOB </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder=" DOB" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Contact </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder=" Contact no." ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-5">            
                                   <center>
                                             <label">Email </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder=" Email" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                             
                            
                         </div>

                       
                        <div class="row pb-3">
                           
                                    <div class="col-md-4">            
                                   <center>
                                             <label">State </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                        placeholder=" State " ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">City </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                        placeholder=" city" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Full Address </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" 
                                        placeholder="Full Address" ReadOnly="True" TextMode="SingleLine"></asp:TextBox>
                                     </div>
                                 </div>
                             
                            
                         </div>


             <div class="row" style="margin-top:10px;">
                 <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Update account " OnClick="Button2_Click" />
                 </div>
                 <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-danger btn-lg btn-block" ID="Button3" runat="server" Text="Delete account " OnClick="Button1_Click"/>
                 </div>
                

             </div>  
                        
                            
                        
                        <br />
                    </div>
                </div>

                <br />
                <br />
                 
             </div>
           

            <div class="col-md-7">
                 <div class="card"  >

                    <div class="card-body" >

                   
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h3> Members List</h3>

                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col container-fluid">
                                 <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="full_name" HeaderText="full_name" SortExpression="full_name" />
                                    <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" ReadOnly="True" />
                                    <asp:BoundField DataField="patient_id" HeaderText="patient_id" SortExpression="patient_id" />
                                    <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                                    <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                    <asp:BoundField DataField="email_id" HeaderText="email_id" SortExpression="email_id" />
                                    <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
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
