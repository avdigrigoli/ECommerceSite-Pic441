<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>

<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Contact Us</title>

<%@include file="head.jsp"%>


</head>

<body id="body" style="background-color:#fff4e9">


<%@include file="navbar2.jsp"%>

<br>
<div class="container">
	<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 70%;
			 display: flex;
			 justify-content: center;
			 max-width: 800px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<%String contact1 = grabText.getTextById(14).getText();%>
					<h1 style="text-align: center; color:#fff4e9;"><%=contact1%></h1>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="position: relative; width: 85%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
		<div class="row">

			<div class="col-md-12" style="">
				<%String contact2 = grabText.getTextById(15).getText();%>
				<h3 style="text-align: center; line-height: 25pt; color: #1F0D40; font-family: 'acumin-pro-condensed', sans-serif;
				font-weight: 500;"><%=contact2%></h3>
			</div>
		</div>
	</div>
</div>

<section class="page-wrapper" style="background-color: #fff4e9">
	<div class="contact-section">
		<div class="container">
			<div class="row">
				<!-- Contact Form -->
				<div class="checkout-form col-md-12" >
					<form id="contact-form" method="post" action="SendEmail" role="form">
					
						<div class="form-group" style="border: #1F0D40 1px solid">
							<label for="name" style="font-size: large" >Name</label>
							<input type="text" style="font-size: large" placeholder="" class="form-control" name="name" id="name" required/>
						</div>
						
						<div class="form-group" style="border: #1F0D40 1px solid">
							<label for="email" style="font-size: large">Email</label>
							<input type="email" style="font-size: large" placeholder="" class="form-control" name="email" id="email" required/>
						</div>
						
						<div class="form-group" style="border: #1F0D40 1px solid">
							<label for="subject" style="font-size: large">Subject</label>
							<input type="text" style="font-size: large" placeholder="" class="form-control" name="subject" id="subject" required/>
						</div>
						
						<div class="form-group" style="border: #1F0D40 1px solid">
							<textarea rows="6" style="font-size: large" placeholder="How Can We Help?" class="form-control" name="message" id="message" style="font-size: large" required></textarea>
						</div>
						
						<div id="mail-success" class="success">
							Thank you. The Mailman is on His Way :)
						</div>
						
						<div id="mail-fail" class="error">
							Sorry, don't know what happened. Try later :(
						</div>

						<div id="cf-submit" style="align-items: center; justify-content: center; display: flex; width: 100%">
							<button type="submit" class="btn btn-main mt-20" >Submit</button>
						</div>

					</form>
				</div>
				<!-- ./End Contact Form -->
				
			
			</div> <!-- end row -->
		</div> <!-- end container -->
	</div>

</section>


<%@include file="footer.jsp"%>




  </body>
  </html>