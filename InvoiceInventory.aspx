<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InvoiceInventory.aspx.cs" Inherits="HospitalManagementSystem.InvoiceInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" >
        <div class="row py-4">
            <div class=" col-md-5">
                <div class="card">  
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Invocie Details</h4>
                                  </center>
                            </div>

                        </div>
                        
                        <div class="row">
                            <div class="col">          
                                <center>
                                    <img width="120" src="imgs/Invoice.png" />
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
                                <label for="formFile" class="form-label">Invoice file input</label>
                                </center>
                                <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />     
                            </div>
                        </div>
                         <div class="row pb-3">
                             <div class="col-4">            
                                  <center>  
                                      <label">Invoice no</label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" 
                                        placeholder=" Invoice no" TextMode="Number"></asp:TextBox>
                                      <asp:LinkButton CssClass="btn btn-info" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                  </div>   
                                      </div> 
                            </div>
                                    <div class="col-md-4">                                           
                                             <label">Date</label>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder="Date" TextMode="Date"></asp:TextBox>
                                     </div>
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">contact no</label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder="Contact no" TextMode="Number"></asp:TextBox>
                                     </div>
                                 </div>

                             <div class="row ps-5">
                                 <hr />
                                 <br />
                             </div>
                             <div class="col-4 ps-5">            
                                  <center>  
                                      <label">Admission date </label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                        placeholder="Admission date" TextMode="Date"></asp:TextBox>
                                  </div>   
                                      </div> 
                            </div>
                                    <div class="col-4 ps-5">  
                                        <center>
                                             <label">Discharge date</label>
                                            </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                        placeholder=" Discharge date" TextMode="Date"></asp:TextBox>
                                     </div>
                                 </div>
                             <div class="col-4 ps-5">            
                                  <center>  
                                      <label">Gender </label>
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

                           <div class="col-4">            
                                  <center>  
                                      <label">Patient Id </label>
                                  </center>
                                
                                  <div class="form-group pb-3">
                                      <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" 
                                        placeholder=" Patient Id"></asp:TextBox>
                                  </div>   
                                      </div> 
                            </div>
                                    <div class="col-md-5">   
                                        <center>
                                             <label">Full name</label>
                                            </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Full name"></asp:TextBox>
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
                             <div class="row col-12" style="margin-top:10px;">

                             <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                             <asp:Button CssClass="btn btn-success btn-lg btn-block" ID="Button3" runat="server" Text=" Add " OnClick="Button3_Click" />
                              </div>
                              <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                                  <asp:Button CssClass="btn btn-warning btn-lg btn-block" ID="Button1" runat="server" Text="Update " OnClick="Button1_Click" />
                                   </div>
                                       <div class="col-md-4 d-grid gap-2 col-4 mx-auto">
                                   <asp:Button CssClass="btn btn-danger btn-lg btn-block" ID="Button2" runat="server" Text="Delete Invoice " OnClick="Button2_Click" />
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
                                    <h3> Invoice Inventory List</h3>

                                  </center>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">            
                                    <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HospitalDBConnectionString %>" SelectCommand="SELECT * FROM [invoice_master_tbl]"></asp:SqlDataSource>
                            <div class="col">            
                                <asp:GridView class="table table-striped table-bordered"
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="invoice_no" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="invoice_no" HeaderText="Invoice No." ReadOnly="True" SortExpression="invoice_no" />                                      
                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("full_name") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
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
                                                                    &nbsp;| Gender-<asp:Label ID="Label6" runat="server" Text='<%# Eval("gender") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Age-<asp:Label ID="Label7" runat="server" Text='<%# Eval("age") %>' Font-Bold="True"></asp:Label>

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
                                                                    &nbsp;| Contact number: <asp:Label ID="Label11" runat="server" Text='<%# Eval("contact_no") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>
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
