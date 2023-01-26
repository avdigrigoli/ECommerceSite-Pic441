<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>

<%	textEditDao grabText = new textEditDao();%>
<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | About Us</title>

	<%@include file="head.jsp"%>

</head>
<style>
	h3{
		color: #1F0D40;
		font-family: "acumin-pro-condensed", sans-serif;
		font-weight: 600;
	}

</style>
<body id="body" style="background-color: #fff4e9">

<%@include file="navbar2.jsp"%>

<br>
<%String about1 = grabText.getTextById(7).getText();%>
<h1 style="text-align: center;" class="testheader"><%=about1%></h1>

<section class="about section" style="background-color: #fff4e9">

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 70%;
			 display: flex;
			 justify-content: right;
			 max-width: 800px;
			text-align: right;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String about2 = grabText.getTextById(8).getText();%>
						<h1 style="text-align: right; color:#fff4e9;"><%=about2%></h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container" style="width: 80%">
		<div class="row">

			<div class="col-md-12" style="margin-top: 30px">
				<%String about3 = grabText.getTextById(9).getText();%>
				<h3 style="text-align: center; line-height: 25pt; font-family: 'acumin-pro-condensed', sans-serif; font-weight: 500;"><%=about3%></h3>
			</div>
		</div>
		</div>
	</div>

	<br>
	<br>
	<br>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative;background-color: #f8c892; width: 70%;
			 display: flex;
			 justify-content: left;
			 max-width: 800px;
			text-align: right;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String about4 = grabText.getTextById(10).getText();%>
						<h1 style="text-align: left; color: #1F0D40;"><%=about4%></h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container"  style="width: 80%">
			<div class="row">
				<div class="col-md-12" style="margin-top: 30px; background-color: #fff4e9; z-index: 99">
					<%String about5 = grabText.getTextById(11).getText();%>
					<h3 style="text-align: center; line-height: 25pt; font-family: 'acumin-pro-condensed', sans-serif; font-weight: 500;"><%=about5%></h3>
					<br>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 70%;
			 display: flex;
			 justify-content: right;
			 max-width: 800px;
			text-align: right;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String about6 = grabText.getTextById(12).getText();%>
						<h1 style="text-align: right; color:#fdf3e6;"><%=about6%></h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container"  style="width: 80%">
			<div class="row">
				<div class="col-md-12" style="margin-top: 30px">
					<%String about7 = grabText.getTextById(13).getText();%>
					<h3 style="text-align: center; line-height: 25pt; font-family: 'acumin-pro-condensed', sans-serif; font-weight: 500;"><%=about7%></h3>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="block text-center">
		<div class="col-md-3">
		</div>
		<div class="col-md-3">
			<a href="schedule.jsp" class="btn btn-main mt-20">Upcoming Events</a>
		</div>
		<div class="col-md-3">
			<a href="memberships.jsp" class="btn btn-main mt-20" >Memberships</a>
		</div>
		<div class="col-md-3">
		</div>
	</div>
	<br>
	<br>
</section>


<%@include file="footer.jsp"%>




  </body>
  </html>