<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddLabMember.aspx.cs" Inherits="HospitalManagementSystem.AddLabMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div class="container-fluid">
        <div class="row py-5">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Lab Members</h4>
                                  </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">          
                                <center>
                                    <img width="120" src="imgs/science.png" />
                                  </center>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row pb-3">
                            <div class="col-md-4">                                           
                                             <label">Full name</label>
                                      <div class="form-group">                                 
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder="Full Name" TextMode="SingleLine"></asp:TextBox>
                                     </div>
                             </div>
                            <div class="col-4">            
                                  <center>  
                                      <label">Contact no. </label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Contact no." TextMode="Number"></asp:TextBox>
                                  </div>   
                                      </div> 
                            </div>
                            <div class="col-md-4">                                           
                                             <label">Address</label>
                                      <div class="form-group">                                 
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder="Address" TextMode="SingleLine"></asp:TextBox>
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
                                      <label">User ID</label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder=" User Id"></asp:TextBox>
                                      <asp:LinkButton class="btn btn-info" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fa-solid fa-check"></i></asp:LinkButton>
                                  </div>   
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
                             <asp:Button CssClass="btn btn-success btn-lg btn-block" ID="Button3" runat="server" Text=" Add Lab Member" OnClick="Button3_Click"/>
                              </div>
                              <div class="col-md-4 ">
                                  <asp:Button CssClass="btn btn-warning btn-lg btn-block" ID="Button1" runat="server" Text="Update " OnClick="Button1_Click"/>
                                   </div>
                                       <div class="col-md-4 ">
                                   <asp:Button CssClass="btn btn-lg btn-block btn-danger" ID="Button2" runat="server" Text="Remove Lab member" OnClick="Button2_Click"/>
                                  </div>

             </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h3> Lab Member List</h3>

                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT * FROM [LabMember_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered"  ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                                        <asp:BoundField DataField="user_id" HeaderText="Member Id" SortExpression="user_id" />
                                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                    </Columns>
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

            </div>

        </div>
    </div>

</asp:Content>
