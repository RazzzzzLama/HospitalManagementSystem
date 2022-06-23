<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="HospitalManagementSystem.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row justify-content-md-center">
        <div class="card my-5 col-md-5 ">
            <center>
            <div class="form-group" style="color:deepskyblue;" >
                <div class="row">
                    <div class="col mr-auto py-4">
                        <center>
                            <img width="150" src="imgs/Appointment.png" />
                        </center>                      
                    </div>
                </div>              
                <div>
                    <center>
                <h3 >Book Your Appointment</h3>
                        <div class="row mr-auto">
                            <div class="col-4 ml-5">                          
                            <div class="form-group">
                                <label>Patient ID</label>
                        <asp:TextBox CssClass="form-control text-center" ID="TextBox6" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                        </div>
                        <div class="col-4 ml-5">
                            
                            <div class="form-group">
                                <label>User ID</label>
                        <asp:TextBox CssClass="form-control text-center" ID="TextBox8" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                        </div>
                        </div>
                        
                        
                   </center>
                </div>
                <div>
                    <hr />
                </div>
                
                <div class="row ">
                        <div class="col-6">
                            <label>Your name</label>

                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Patient name."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is invalid" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name is invalid" ValidationExpression="^[a-zA-Z'.\s]{1,50}" ControlToValidate="TextBox1" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div> 
                        </div>
                    <div class="col-6">
                            <label>Your Age</label>

                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Your Age" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Age is invalid" ControlToValidate="TextBox7" ForeColor="Red"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Age is invalid" ValidationExpression="[0-9]{1,2}" ControlToValidate="TextBox7" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div> 
                        </div>
                    <div class="col-6">
                            <label>Gender</label>

                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server">
                                    <asp:ListItem Text="Select" Value="Select" />
                                          <asp:ListItem Text="Male" Value="Male" />
                                          <asp:ListItem Text="Female" Value="Female" />
                                          <asp:ListItem Text="Other" Value="Other" />
                                      </asp:DropDownList>
                                <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="DropDownList2"
    InitialValue="Select" runat="server" ForeColor="Red" />
                            </div> 
                        </div>
                    <div class="col-6">
                            <label>Your Address</label>

                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Your Address."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address is invalid" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Address is invalid" ValidationExpression="[0-9a-zA-Z #,-]+" ControlToValidate="TextBox3" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div> 
                        </div>
                    <div class="col-6">
                            <label>Email address</label>

                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder=" Email ID" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is invalid" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox5" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div> 
                        </div>
                        <div class="col-6">
                            <label>Contact no.</label>
                            <div class="form-group">
                               <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder=" Enter Contact no." TextMode="Number"></asp:TextBox>  
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Contact is invalid" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Contact is invalid" ValidationExpression="[0-9]{10}" ControlToValidate="TextBox2" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div> 
                     </div>                   
                    <div class="col-6">
                         <label>Request date.</label>

                        <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Request date" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select Date " ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>

                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Date must be greater than today" Operator="GreaterThanEqual" Type="Date" ForeColor="Red"></asp:CompareValidator>

                         </div> 

                     </div>
                    <div class="col-6">
                         <label>Select Department.</label>
                        <div class="form-group">
                                         <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                             <asp:ListItem Value="Text 1" Text="Text1" />
                                             <asp:ListItem Value="Text 2" Text="Text2" />

                                         </asp:DropDownList>
                                     </div>
                     </div>
                    <div class="form-group col-md-4 mx-auto mt-3">
                        <asp:Button CssClass="btn btn-block btn-warning btn-lg" ID="Button1" runat="server" Text="Request an Appointment" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
</center>
        </div>
            <div class="card my-5 col-md-5 mx-5" style="background-color:ghostwhite;">
                <div class="card-body">
                <h1  class="card-title  fa-4x" style="color:blueviolet; opacity:0.6;">Appointment</h1>
                    <div style="opacity:0.5;">
          <h5 class=" border-top border-primary" >Doctor's Appointment</h5>
          <ul>
              <li><small>You must wear something that covers your nose and mouth when you go to a hospital</small></li>
                <li>
                   <small>Some appointments may be online, by phone or by video call</small>
                </li>
              <li>
                  <small>You may be asked to come to your appointment alone, if you can</small>
                </li>
              
          </ul>
                        <h5>Attending your appointment</h5>
                        <p><smal>Patients find it helps to prepare what they want to talk about in their appointment. It can be helpful to write a list of the things you want to discuss. This could include:</smal> </p>
                        <ul>
              <li><small>All your symptoms</small></li>
                <li>
                   <small>Medicines you're taking including prescriptions, medicines you've bought yourself and alternative treatments. You can bring the medicine packets or your prescriptions with you, or take photos of them</small>
                </li>
              <li>
                  <small>Any questions or concerns</small>
                </li>
              
          </ul>
          </div>
                    <br />

                    <p  style="color:rebeccapurple;"><small>"If I have made an appointment with you, I owe you punctuality, I have no right to throw away your time, if I do my own." - Richard Cecil </small></p>
                    </div>
            </div>
            </div>
    </div>
</asp:Content>
