<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HospitalManagementSystem.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Image slide -->
    <section class="container my-4">
    <div class="bd-example col-12">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="imgs/2.jpg" class="d-block w-100" alt="John Muir">
        <div class="carousel-caption d-none d-md-block">
          <h5>John Muir</h5>
          <p>Everybody needs beauty as well as bread, places to play in and pray in,where nature may heal and give strength to body and soul..</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="imgs/4.jpg" class="d-block w-100" alt="Marilu Henner">
        <div class="carousel-caption d-none d-md-block">
          <h5>Marilu Henner</h5>
          <p>Being in control of your life and having realistic expectations about your day-to-day challenges are the keys to stress management, 
            which is perhaps the most important ingredient to living a happy, healthy and rewarding life.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="imgs/3.jpg" class="d-block w-100" alt="Marilu Henner">
        <div class="carousel-caption d-none d-md-block">
          <h5>Marilu Henner</h5>
          <p>Foods high in bad fats, sugar and chemicals are directly linked to many negative emotions, whereas whole, natural foods rich in nutrients - foods such as fruits, 
            vegetables, grains and legumes - contribute to greater energy and positive emotions.</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</section>

    <!-- Random health text -->

    <section">

        <div class ="container text-justify">
            <div class ="row">
                <div class="col-12 border border-primary" style="color:orange;">
                    <center>
                    <h1> Welcome to Medicity hospital</h1>
                    <p> “Time and health are two precious assets that we don’t recognize and appreciate until they have been depleted.”  – Denis Waitley </p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div  class ="row pt-4 ms-5">
                
                <div class="col-md-4 col-sm-4 ">
                    <div class="shadow-sm p-3 mb-5 bg-white rounded">
                        <center>
                    <i class="fa fa-heartbeat" aria-hidden="true"></i>
					<h4>Anxiety</h4> <br />
                        </center>
					<p>Anxiety is a feeling of unease, 
                        such as worry or fear, that can be mild or severe.
						Everyone has feelings of anxiety at some point in their life. For example, 
                        you may feel worried and anxious about sitting an exam,
                        or having a medical test or job interview.During times like these, feeling anxious can be perfectly normal. </p>
                    </div>
                    
                    
                    </div>
                <div class="col-md-4 col-sm-4">
                    <div class="shadow-sm p-3 mb-5 bg-white rounded " >
                        <center>
                    <i class="fa fa-user-md" aria-hidden="true"></i>
					<h4>Executive Coaching</h4>
                            <br />
                        </center>
					<p>Executive coaching involves a series of one-on-one interactions between a manager or executive and an external coach.
						 The goal of coaching is to equip people with the knowledge and opportunities they need to develop themselves 
						 and become more effective.</p>
                    </div>
                    
                    
                    </div>
                <div class="col-md-4 col-sm-4">
                    <div class=" shadow-sm p-3 mb-5 bg-white rounded">
                        <center>
                    <i class="fa fa-wheelchair-alt" aria-hidden="true"></i>
                        <h4>Depression</h4> <br />
                        </center>                    
					<p>Depression (major depressive disorder) is a common and serious medical illness that negatively affects how you feel, 
						the way you think and how you act. Fortunately, it is also treatable. 
						Depression causes feelings of sadness and/or a loss of interest in activities you once enjoyed </p>
                    </div>
                    
                    
                    </div>
                <div class=" col-md-4 col-sm-4">
                    <div class=" shadow-sm p-3 mb-5 bg-white rounded">
                        <center>
                    <i class="fa fa-medkit" aria-hidden="true"></i>
					<h4>Relationships</h4>
                        </center>
                    <br />
					<p>Loneliness can have dramatic consequences for your health. 
						Loneliness can lead to disrupted sleep patterns, elevated blood pressure, and increased cortisol (a stress hormone). 
						It can affect your immune system and decrease your overall sense of contentment. </p>
                    </div>
                    
                    
                    </div>
                <div class="col-md-4 col-sm-4 ">
                    <div class="shadow-sm p-3 mb-5 bg-white rounded">
                        <center>
                    <i class="fa fa-hospital" aria-hidden="true"></i>
					<h4>Stress Management</h4> 
                        </center> <br />
					<p>Stress is your body’s response to changes in your life. 
						Because life involves constant change—ranging from everyday, routine changes 
						like commuting from home to work to adapting to major life changes
						 like marriage, divorce, or death of a loved one—there is no avoiding stress.</p>
                    </div>
                    
                    
                    </div>
                <div class="col-md-4 col-sm-4">
                    <div class=" shadow-sm p-3 mb-5 bg-white rounded">
                        <center>
                    <i class="fa fa-ambulance" aria-hidden="true"></i>
					<h4>Support Group</h4>
                        </center>
                    <br />
					<p>A support group is a gathering of people facing common issues to share what’s troubling them. 
						Through the sharing of experiences, they’re able to offer support, 
						encouragement, and comfort to the other group members, and receive the same in return. </p>
                    </div>                  
                  </div>
            </div>
            </div>

            
        </div>

    </section>


    <!-- Service text-->
     <section>
        <div class ="container">
            <div class ="row">
                <div class="col pb-5" style="color:orange;">
                    <center>
                    <h1>Services</h1>
                    <p> We offer extensive medical procedures to outbound and inbound patients.</p>
                    </center>
                </div>
              </div>
         
            <div class ="row pt-4 ms-5 px-5"  style="color:black;" >
            <div class="col-md-5 col-sm-5 mr-5  shadow-sm p-3 mb-5 bg-white rounded"> 
                <center>
                    <h2>Centres of Excellence</h2>
			        <h4  style="border-top:2px solid black;"><i class="fa-regular fa-clock"></i>24 Hours Health Services</h4>
			        <h4><i class="fa-solid fa-lightbulb"></i>Operation Theatres</h4>
			        <h4><i class="fa-solid fa-bed-pulse"></i>Speciality Centers</h4>
                    </center>
             </div>
                <div class="col-md-5 col-sm-5  shadow-sm p-3 mb-5 bg-white rounded">  
                   <center> <h2>Emergency Cases</h2>
			<h5><i class="fa fa-phone fs-3 pe-3" aria-hidden="true"></i>+977-1-4217766</h5>
            <h5>+977-981-0136491</h5>
			<p>We have had every type of emergency you can imagine.</p>  </center>
                    </div>
              </div>
          </div>
    </section>


</asp:Content>
