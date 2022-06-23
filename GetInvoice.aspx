<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GetInvoice.aspx.cs" Inherits="HospitalManagementSystem.GetInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid ">
            <div class="row">
            <div class="col-4 py-5 ml-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="50"  src="imgs/Invoice.png" />
                                    <h1 class="card-title  fa-2x border-bottom border-primary" style="color:blueviolet; opacity:0.6;">Invoice Notes</h1>
                                  </center>
                            </div>

                        </div>
                        <div>
          <h5 style="font-size: x-large; color:blueviolet;" >Invoice</h5>
              <p><small>To get your Invoice: –</small></p>
          <ul>
              <li><small>You need to use same contact number on your profile that you have written in invoice.</small></li>
                <li>
                   <small>You can download invoice by clicking on download button.</small>
                </li>
              <li>
                  <small>Invoice histoy is shown here</small>                 
                </li>
              <li>
                  <small>You need to pay bills physically to get the invoice number.</small>
              </li>
              <li>
                  <small>If you paid bill today, you need to wait 24hrs to get invoice online.</small>      
                </li>
             
          </ul>
          </div>
                    </div>
                </div>
            </div>
            <div class="col-7 py-5">
                 <div class="card"  >

                    <div class="card-body" >

                   
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h3> Invoice List</h3>

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
                               <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataKeyNames="InvoiceFile" CellPadding="4" ForeColor="#333333" GridLines="None">
                                   <AlternatingRowStyle BackColor="White" />
                                   <Columns>
                                       <asp:BoundField DataField="invoice_no" HeaderText="Invoice No." ReadOnly="True" SortExpression="invoice_no" />                                      
                                    <asp:TemplateField HeaderText="Invoice Data" HeaderStyle-CssClass="fa-2x">

                                            <ItemTemplate>
                                                
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label  style="font-size: 30px; font-weight: bold; color: #FF9900;" ID="Label1" runat="server" Text='<%# Eval("full_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                    <br />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 py-2">
                                                                 Address-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("address") %>'></asp:Label>
                                                                &nbsp;| City-<asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("city") %>'></asp:Label>
                                                                &nbsp;| State-<asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("state") %>'></asp:Label>
                                                                </div>
                                                                
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-2">

                                                                    Pattient ID-<asp:Label ID="Label5" runat="server" Text='<%# Eval("patient_id") %>' Font-Bold="True"></asp:Label>
  
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-2">

                                                                    Admission Date: <asp:Label ID="Label8" runat="server" Text='<%# Eval("admission_date") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Discharge Date: <asp:Label ID="Label9" runat="server" Text='<%# Eval("discharge_date") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-2" style="font-size: 16px">

                                                                    Date: <asp:Label ID="Label10" runat="server" Text='<%# Eval("date") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>
                                                                    <asp:LinkButton ID="LinkButton2" class="btn btn-outline-dark btn-sm" runat="server" Text="Download" OnClick="LinkButton1_Click"></asp:LinkButton>

                                                        </div>

                                                        <div class="col-lg-2" style="border: thin solid #FFFFFF">
                                                            <asp:Image CssClass="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("InvoiceFile") %>' />
                                                         </div>
                                                    </div>

                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT [invoice_no], [date], [admission_date], [discharge_date], [patient_id], [full_name], [InvoiceFile], [address], [city], [state] FROM [invoice_master_tbl]"></asp:SqlDataSource>
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
