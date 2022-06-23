<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="HospitalManagementSystem.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="container">
        <div class="card mb-3 my-4">
  <div class="row no-gutters ">
    <div class="col-md-4 pt-5" style="background-color:lavender;">
      <img src="imgs/Ambulance.png" class="card-img" alt="Ambulance">
    </div>
    <div class="col-md-8"  style="background-color:ghostwhite;">
      <div class="card-body">
        <h1 class="card-title  fa-4x border-bottom border-primary" style="color:blueviolet; opacity:0.6;">About Us</h1>
        <p class="card-text text-justify">“Faithful to our tradition, we provide the highest possible standard of care and treatment in a professional and compassionate manner to every person who avails of our services”.</p>
          <div style="opacity:0.5;">
          <h5 >Vision and Values</h5>
          <ul>
              <li><small>To build a first class patient focused service based on high quality and evidence based practice throughout the organisation.</small></li>
                <li>
                   <small> To provide this service as close to the patient as possible, in a well-managed and appropriate environment.</small>
                </li>
              <li>
                  <small>  To promote a culture that will:</small>
                  <ul>
                      <li><small>Ensure high quality care/service is provided.</small></li>
                      <li>
                        <small>  Ensure that decisions regarding delivery of care/service are patient focused and evidence based.</small>
                      </li>
                         <li>
                           <small>  Support and invest in education and training, thereby promoting the continuous development of the workforce in order to maximise the potential of staff at all levels.</small>
                         </li>
                  </ul>
                </li>
              
          </ul>
          </div>
          <div style="opacity:0.5;">
          <h5 >Goals</h5>
              <p><small>Our goals are to: –</small></p>
          <ul>
              <li><small>Continuously improve all our services through quality management</small></li>
                <li>
                   <small>Focus on our patients and deliver high quality service</small>
                </li>
              <li>
                  <small>Involve all our partners in our quality improvement activities</small>                 
                </li>
              <li>
                  <small>Use training, teamwork and open communication to enable all employees to achieve their full potential</small>
              </li>
              <li>
                  <small>Measure the effectiveness of our activities and monitor progress towards achieving our Vision</small>      
                </li>
             
          </ul>
          </div>
        <p class="card-text"><small class="text-muted">“Let the young know they will never find a more interesting, more instructive book than the patient himself.” - Giorgio Baglivi</small></p>
      </div>
    </div>
  </div>
</div>
    </div>

</asp:Content>
