<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AppointmentIssuing.aspx.cs" Inherits="HospitalManagementSystem.AppointmentIssuing" %>
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
            <div class="col-md-4">

                <div class="card"  >

                    <div class="card-body" >

                        <div class="row">

                            <div class="col">
                                <center>
                                    <h4>Appointment Issuing</h4>
                                  </center>
                            </div>
                        </div>
                         <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="120" src="imgs/Appointmentslogo.png" />

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
                                             <label">Patient Name</label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Patient Name"></asp:TextBox>
                                     </div>
                                 </div>
                             <div class="col-md-6">            
                                  <center>  
                                      <label">User Id</label>
                                  </center>
                                
                                  <div class="form-group">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder="User Id"></asp:TextBox>
                                      <asp:Button class="btn btn-info" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />
                                  </div>   
                                      </div> 
                            </div>
                            
                         </div>

                        <div class="row">
                           
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Contact no. </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder="Contact no." ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-6">            
                                   <center>
                                             <label">User Address </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder=" User Address" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                             
                            
                         </div>
                        <div class="row">
                           
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Department</label>

                                         </center>
                                      <div class="form-group">
                                         <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                             <asp:ListItem Value="Text 1" Text="Text1" />
                                             <asp:ListItem Value="Text 2" Text="Text2" />

                                         </asp:DropDownList>
                                     </div>
                                 </div>
                            <div class="col-md-6">            
                                   <center>
                                             <label">Doctor Name </label>

                                         </center>
                                      <div class="form-group">
                                         <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                             <asp:ListItem Value="Text 1" Text="Text1" />
                                             <asp:ListItem Value="Text 2" Text="Text2" />

                                         </asp:DropDownList>
                                     </div>
                                 </div>
                             
                            
                         </div>

                        <div class="row">
                           
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Requested Date </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder="  Date" ReadOnly="True"></asp:TextBox>
                                     </div>
                                 </div>
                            
                            <div class="col-md-6">            
                                   <center>
                                             <label">Time </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                        placeholder=" Meeting Time" TextMode="Time"></asp:TextBox>
                                     </div>
                                 </div>
                             
                            
                         </div>
                        <div class="row">
                           
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Issued Date </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                        placeholder="  Date"  TextMode="Date" ReadOnly="False"></asp:TextBox>
                                     </div>
                                 </div>
                            
                            <div class="col-md-6">            
                                   <center>
                                             <label">Status </label>

                                         </center>
                                      <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                          <asp:ListItem Text="Pending" Value="Pending" />
                                          <asp:ListItem Text="Accepted" Value="Accepted" />
                                          <asp:ListItem Text="Date unavailabe" Value="Date unavailabe" />
                                      </asp:DropDownList>
                                    
                                     </div>
                                 </div>
                             
                            
                         </div>
                        


             <div class="row" style="margin-top:10px;">

                 <div class="col-md-5 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-primary btn-lg btn-block" ID="Button3" runat="server" Text="Issue " OnClick="Button3_Click" />
                 </div>
                 <div class="col-md-5 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-danger btn-lg btn-block" ID="Button4" runat="server" Text="Remove Appointment" OnClick="Button4_Click" />
                 </div>

             </div>  
                        
                            
                        
                        <br />
                    </div>
                </div>

                <br />
                <br />
                 
             </div>
            <div class=" col-md-8">
                 <div class="card"  >

                    <div class="card-body" >

                   
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h3> Issued Appointments List</h3>

                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT * FROM [appointment_master_tbl]"></asp:SqlDataSource>
                            <div class="col">            
                                <asp:GridView class="table table-striped table-bordered"
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                                        <asp:BoundField DataField="patient_name" HeaderText="patient_name" SortExpression="patient_name" />
                                        <asp:BoundField DataField="patient_age" HeaderText="patient_age" SortExpression="patient_age" />
                                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                        <asp:BoundField DataField="request_date" HeaderText="request_date" SortExpression="request_date" />
                                        <asp:BoundField DataField="issued_date" HeaderText="issued_date" SortExpression="issued_date" />
                                        <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                                        <asp:BoundField DataField="doctor_name" HeaderText="doctor_name" SortExpression="doctor_name" />
                                        <asp:BoundField DataField="contact_no" HeaderText="contact_no" SortExpression="contact_no" />
                                        <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
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
