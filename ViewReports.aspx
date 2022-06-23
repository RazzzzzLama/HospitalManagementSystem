<%@ Page Title="View Report" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewReports.aspx.cs" Inherits="HospitalManagementSystem.ViewReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
             <div class="col-4 py-5 ml-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="50"  src="imgs/call-report-icon-3.png" />
                                    <h1 class="card-title  fa-2x border-bottom border-primary" style="color:blueviolet; opacity:0.6;">Report Notes</h1>
                                  </center>
                            </div>

                        </div>
                        <div>
          <h5 style="font-size: x-large; color:blueviolet;" >Reports</h5>
              <p><small>To get your Reports: –</small></p>
          <ul>
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
                  <small>Once you have invoice number and patient id you will be able to search your report.</small>      
                </li>
              <li>
                   <small>You can download report by clicking on download button.</small>
                </li>
              <li>
                  <small>Report histoy is shown here</small>                 
                </li>
              <li>
                  <small>You need to wait 24hrs to get report online.</small>      
                </li>
             
          </ul>
          </div>

                        <hr />
                        <div class="row justify-content-center">
                            <div class="col-md-5">            
                                  <center>  
                                      <label">Patient ID </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder="Patient ID" TextMode="Number"></asp:TextBox>
                                  </div>   
                            </div>
                                    <div class="col-md-5">            
                                   <center>
                                             <label">Invoice No. </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder="Enter Invoice number " TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group col-4 mx-auto" style="margin-top:20px;">
                            <asp:Button CssClass="btn btn-info btn-block" ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
                                    <br />
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True"></asp:Label>
                        </div>
                            </div>
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
                                    <h3> Report List</h3>

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
                                 <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="No particular serached data available. Please Input correct Data and Search again" DataKeyNames="Reportfile" ForeColor="#333333" GridLines="None" DataSouceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                     <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="report_id" HeaderText="ReportId." ReadOnly="True" SortExpression="report_no" />     
                                    
                                    <asp:TemplateField HeaderText="Report Data" HeaderStyle-CssClass="fa-2x">

                                        <ItemTemplate>

                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-9">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                    <asp:Label  style="font-size: 30px; font-weight: bold; color: #FF9900;" ID="Label1" runat="server" Text='<%# Eval("patient_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                    <br />
                                                                </div>
                                                        </div>
                                                        <div class="row">
                                                                <div class="col-12 py-2">
                                                                 Address-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("address")%>'></asp:Label>
                                                                &nbsp;| City-<asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("city") %>'></asp:Label>
                                                                &nbsp;| State-<asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("state") %>'></asp:Label>
                                                                </div>                                                          
                                                            </div>
                                                        <div class="row">
                                                                <div class="col-12 py-2">
                                                                 Contact: <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("contact")%>'></asp:Label>
                                                                &nbsp;| Check-Up date: <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("checkup_date") %>'></asp:Label>
                                                                &nbsp;| Report date: <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("report_publish_date") %>'></asp:Label>
                                                                </div>                                                          
                                                            </div>
                                                        <div class="row">
                                                                <div class="col-12 py-2">
                                                              Invoice No.:<asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("invoice_no") %>'></asp:Label>
                                                             &nbsp;| Patient ID :<asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("patient_id") %>'></asp:Label>                    </div>                                                              
                                                            </div>
                                                        <asp:LinkButton ID="LinkButton2" class="btn btn-outline-dark btn-sm" runat="server" Text="Download" OnClick="LinkButton1_Click"></asp:LinkButton>          
                                                    </div>
                                                    <div class="col-lg-3 py-3">
                                                        <%--<%# Eval("Reportfile")%>--%>
                                                        <img width="150" height="150" src="imgs/PDF.png" style="border: 1px solid #000000" />
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
                            </div>                 
                        </div>                 
                    </div>
                </div>
            </div>
        </div>
    </div>   
</asp:Content>
