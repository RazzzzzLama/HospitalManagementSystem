<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="HospitalManagementSystem.UserSignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ValidateDOB(sender, args) {
            //Get the date from the TextBox.
            var dateString = document.getElementById(sender.controltovalidate).value;
            var regex = /(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$/;

            //Check whether valid dd/MM/yyyy Date Format.
            if (regex.test(dateString)) {
                var parts = dateString.split("/");
                var dtDOB = new Date(parts[1] + "/" + parts[0] + "/" + parts[2]);
                var dtCurrent = new Date();
                sender.innerHTML = "You must be 18 years to register."
                if (dtCurrent.getFullYear() - dtDOB.getFullYear() < 18) {
                    args.IsValid = false;
                    return;
                }

                if (dtCurrent.getFullYear() - dtDOB.getFullYear() == 18) {

                    //CD: 11/06/2018 and DB: 15/07/2000. Will turned 18 on 15/07/2018.
                    if (dtCurrent.getMonth() < dtDOB.getMonth()) {
                        args.IsValid = false;
                        return;
                    }
                    if (dtCurrent.getMonth() == dtDOB.getMonth()) {
                        //CD: 11/06/2018 and DB: 15/06/2000. Will turned 18 on 15/06/2018.
                        if (dtCurrent.getDate() < dtDOB.getDate()) {
                            args.IsValid = false;
                            return;
                        }
                    }
                }
                args.IsValid = true;
            } else {
                sender.innerHTML = "Enter date in dd/MM/yyyy format."
                args.IsValid = false;
            }
        }
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row justify-content-md-center">
            <div class="col-md-5 pt-5">

                <div class="card" style="color:Blue;" >

                    <div class="card-body" >

                        <div class="row">

                            <div class="col">
               <a href="Home.aspx"> <i class=" fa fa-home" style="color:orange; font-size:20px;"></i></a>
                <a href="Home.aspx" style="color:gray" > Back to home</a><br /><br />
                                <center>
                                    <img width="150" src="imgs/generaluser.png" />

                                  </center>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col">
                                <center>
                                     <h5> New Member Sign up</h5>
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
                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is invalid" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name is invalid" ValidationExpression="^[a-zA-Z'.\s]{1,50}" ControlToValidate="TextBox1" ForeColor="Red"></asp:RegularExpressionValidator>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Date of Birth </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                        placeholder=" Date of Birth "></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Date of Birth required" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                                          <center>
                                              <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="ValidateDOB"
    ControlToValidate="TextBox2" ErrorMessage="" ForeColor = "Red" />
                                          </center>
                                                            
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
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Contact is invalid" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Contact is invalid" ValidationExpression="[0-9]{10}" ControlToValidate="TextBox3" ForeColor="Red"></asp:RegularExpressionValidator>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Email ID </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" 
                                        placeholder=" example@example.com" TextMode="Email"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is invalid" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox4" ForeColor="Red"></asp:RegularExpressionValidator>
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
                                          <asp:ListItem Text="--Select--" Value="select" />
                                          <asp:ListItem Text="Province No. 1" Value="Province No. 1" />
                                          <asp:ListItem Text="Madhesh Province" Value="Madhesh Province" />
                                          <asp:ListItem Text="Bagmati Province" Value="Bagmati Province" />
                                          <asp:ListItem Text="Gandaki Province" Value="Gandaki Province" />
                                          <asp:ListItem Text="Lumbini Province" Value="Lumbini Province" />
                                          <asp:ListItem Text="Karnali Province" Value="Karnali Province" />
                                          <asp:ListItem Text="Sudurpashchim Province" Value="Sudurpashchim Province" />

                                      </asp:DropDownList>
                                      <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="DropDownList1"
    InitialValue="select" runat="server" ForeColor="Red" />
                                      
                                  </div>   
                            </div>
                                    <div class="col-md-4">          
                               <center>
                                             <label">City</label>
                               </center>
                                      <div class="form-group">
                                          <asp:DropDownList CssClass="form-control" ID="DropDownList3" runat="server">
                                              <asp:ListItem Text="--Select--" Value="select" />
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
                                          <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="DropDownList3"
    InitialValue="select" runat="server" ForeColor="Red" />
                                  </div> 
                                 </div>
                            <div class="col-md-4">            
                                   <center>
                                             <label">Full Address </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                        placeholder="Full Address"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address is invalid" ControlToValidate="TextBox7" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Address is invalid" ValidationExpression="[0-9a-zA-Z #,-]+" ControlToValidate="TextBox7" ForeColor="Red"></asp:RegularExpressionValidator>
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
                            <div class="col-md-6">            
                                  <center>  
                                      <label">User ID </label>
                                  </center>
                                
                                  <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" 
                                        placeholder=" User ID "></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="User Id is invalid" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Minimum 8 characters required " ValidationExpression="^[\s\S]{8,}$" ControlToValidate="TextBox5" ForeColor="Red"></asp:RegularExpressionValidator>
                                  </div>   
                            </div>
                                    <div class="col-md-6">            
                                   <center>
                                             <label">Password </label>

                                         </center>
                                      <div class="form-group">
                                    
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" 
                                        placeholder=" Password " TextMode="Password"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="Password required" ControlToValidate="TextBox8" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="Password must be between 8 to 15" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,15}$" ControlToValidate="TextBox8" ForeColor="Red"></asp:RegularExpressionValidator>
                                     </div>
                                 </div>
                         </div>
                        
                        <br />
                        <div class="row">

                            <div class="col">  
                                  
                                      <div class="form-group col-4 mx-auto" style="margin-top:20px;">
                                          <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Signup." OnClick="Button1_Click" />

                                      </div> 
                                <a href="Userlogin.aspx">Already have account?</a>
                                <br />

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
