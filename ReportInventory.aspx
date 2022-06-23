<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReportInventory.aspx.cs" Inherits="HospitalManagementSystem.ReportInventory" %>
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
                                    <h4>Reports Details</h4>
                                  </center>
                            </div>
                        </div>
                         <div class="row">

                            <div class="col">
              
                                <center>
                                    <img width="150"src="imgs/call-report-icon-3.png" />

                                  </center>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>

                        <div class="row pb-3" >

                            <div class="col">   
                                <center>
                                <label for="formFile" class="form-label">Default file input</label>

                                </center>
                                <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />     
                            </div>
                        </div>

                        <div class="row pb-3">
                           <div class="col-4">            
                                  <center>  
                                      <label">Report Id </label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Report Id" TextMode="Number"></asp:TextBox>
                                          <asp:LinkButton CssClass="btn btn-info" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Go</asp:LinkButton>
                                          </div>   
                                      </div> 
                            </div>
                                    <div class="col-md-5">                                           
                                             <label">Patient name</label>
                                      <div class="form-group">
                                         <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder="Full Name"></asp:TextBox>
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
                            <div class="col-md-4">   
                                <center>
                                             <label">Address</label>
                                    </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" 
                                        placeholder=" Address"></asp:TextBox>
                                     </div>
                                 </div>
                            <!-- City list of Nepal -->
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
                                             <label">State</label>
                               </center>
                                      <div class="form-group">
                                      <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                          <asp:ListItem Text="Select" Value="select" />
                                          <asp:ListItem Text="Province No. 1" Value="Province No. 1"/>
                                          <asp:ListItem Text="Madhesh Province" Value="Madhesh Province" />
                                          <asp:ListItem Text="Bagmati Province" Value="Bagmati Province" />
                                          <asp:ListItem Text="Gandaki Province" Value="Gandaki Province" />
                                          <asp:ListItem Text="Lumbini Province" Value="Lumbini Province" />
                                          <asp:ListItem Text="Karnali Province" Value="Karnali Province" />
                                          <asp:ListItem Text="Sudurpashchim Province" Value="Sudurpashchim Province" />

                                      </asp:DropDownList>
                                      
                                  </div> 
                                 </div>

                         </div>

                        <div class="row pb-4">
                           
                                    <div class="col-md-3">            
                                   <center>
                                             <label">DOB </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder=" User ID" TextMode="Date"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Contact </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder=" Contact no." TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Gender</label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                          <asp:ListItem Text="Select" Value="select" />
                                          <asp:ListItem Text="Male" Value="Male" />
                                          <asp:ListItem Text="Female" Value="Female" />
                                          <asp:ListItem Text="Other" Value="Other" />
                                      </asp:DropDownList>
                                     </div>
                                 </div>
                             
                            
                         </div>
           
                        <div class="row pb-3">
                           
                                    <div class="col-md-4">            
                                   <center>
                                             <label">Checkup Date </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                        placeholder="  date " TextMode="Date"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Report Publish date </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                        placeholder=" Date" TextMode="Date"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Doctor name</label>

                                         </center>
                                      <div class="form-group">
                                         <asp:DropDownList CssClass="form-control" ID="DropDownList5" runat="server">
                                             <asp:ListItem Value="Text 1" Text="Text1" />
                                             <asp:ListItem Value="Text 2" Text="Text2" />

                                         </asp:DropDownList>
                                     </div>
                                 </div>
                             
                            
                         </div>

                        <div class="row pb-3">                                  
                            <div class="col-md-4">            
                                   <center>
                                             <label">Check-up type </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" 
                                        placeholder=" Type" TextMode="SingleLine"></asp:TextBox>
                                     </div>
                                 </div>   
                            <div class="col-md-4">            
                                   <center>
                                             <label">Invoice no. </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" 
                                        placeholder="Invoice no." TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Patient Id </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" 
                                        placeholder="Patient Id." TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>
                         </div>
                        <div class="col pb-4">                                              
                                             <label">Discription</label>                                      
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder=" Discription." TextMode="MultiLine"></asp:TextBox>
                                     </div>
                                 </div>

             <div class="row" style="margin-top:10px;">

                 <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-success btn-lg btn-block" ID="Button3" runat="server" Text=" Add " OnClick="Button3_Click"/>
                 </div>
                 <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-warning btn-lg btn-block" ID="Button1" runat="server" Text="Update " OnClick="Button1_Click" />
                 </div>
                 <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                     <asp:Button CssClass="btn btn-danger btn-lg btn-block" ID="Button2" runat="server" Text="Delete Report " OnClick="Button2_Click" />
                 </div>
                

             </div>  
                        
                            
                        
                        <br />
                    </div>
                </div>

                <br />
                <br />
                 
             </div>
           

            <div class="col-7">
                 <div class="card"  >

                    <div class="card-body" >

                   
                        <div class="row">

                            <div class="col">
                                <center>
                                    <h3> Report Inventory List</h3>

                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                       <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT * FROM [report_master_tbl]"></asp:SqlDataSource>
                            <div class="col">            
                                <asp:GridView class="table table-striped table-bordered"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="report_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="report_id" HeaderText="ID" ReadOnly="True" SortExpression="report_id" >
                                        
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12 py-2">
                                                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("patient_name") %>' Font-Size="XX-Large" Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-2">

                                                                    Address-<asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| City-<asp:Label ID="Label3" runat="server" Text='<%# Eval("city") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| State-<asp:Label ID="Label5" runat="server" Text='<%# Eval("state") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-2">

                                                                    DOB-<asp:Label ID="Label6" runat="server" Text='<%# Eval("dob") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Contact-<asp:Label ID="Label7" runat="server" Text='<%# Eval("contact") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Gender-<asp:Label ID="Label8" runat="server" Text='<%# Eval("gender") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-2">

                                                                    Chekup-Date -
                                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("checkup_date") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Report Published date -<asp:Label ID="Label10" runat="server" Text='<%# Eval("report_publish_date") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Doctor Name-
                                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("doctor_name") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 pb-1">

                                                                    Invoice no:&nbsp;<asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("Invoice_no") %>'></asp:Label>
                                                                    &nbsp;| Patient Id:&nbsp;<asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("patient_id") %>'></asp:Label>
                                                                    &nbsp;| Discription-<asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Underline="False" Text='<%# Eval("Dicscription") %>'></asp:Label>

                                                                    &nbsp;</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Reportfile") %>' />
                                                        </div>
                                                    </div>

                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
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
