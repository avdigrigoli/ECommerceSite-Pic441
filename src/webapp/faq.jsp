<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | FAQ</title>

	<%@include file="head.jsp"%>

</head>
<style>
	h3{
		font-family: "acumin-pro-condensed", sans-serif;
		font-weight: 500;
		color: #1F0D40;
	}
	.content h3{
		font-family: "DIN Condensed", sans-serif;
	}
</style>
<body id="body" style="background-color: #fdf4eb">


<%@include file="navbar2.jsp"%>



<section class="about section" style="background-color: #fdf4eb">
	<%String faq1 = grabText.getTextById(36).getText();%>
	<h1 style="text-align: center;" class="testheader"><%=faq1%></h1>
	<br>
	<br>
	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq2 = grabText.getTextById(37).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq2%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq3 = grabText.getTextById(38).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq3%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq4 = grabText.getTextById(39).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq4%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq5 = grabText.getTextById(40).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq5%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq6 = grabText.getTextById(41).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq6%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq7 = grabText.getTextById(42).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq7%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq8 = grabText.getTextById(43).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq8%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq9 = grabText.getTextById(44).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq9%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq10 = grabText.getTextById(45).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq10%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq11 = grabText.getTextById(46).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq11%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq12 = grabText.getTextById(47).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq12%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq13 = grabText.getTextById(48).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq13%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq14 = grabText.getTextById(49).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq14%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq15 = grabText.getTextById(50).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq15%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq16 = grabText.getTextById(51).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq16%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq17 = grabText.getTextById(52).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq17%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq18 = grabText.getTextById(53).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq18%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq19 = grabText.getTextById(54).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq19%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq20 = grabText.getTextById(55).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq20%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq21 = grabText.getTextById(56).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq21%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq22 = grabText.getTextById(57).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq22%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq23 = grabText.getTextById(58).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq23%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq24 = grabText.getTextById(59).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq24%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq25 = grabText.getTextById(60).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq25%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #f7c591; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq26 = grabText.getTextById(61).getText();%>
						<h3 style="text-align: left; color:#1F0D40;"><%=faq26%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq27 = grabText.getTextById(62).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq27%></h3>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 100%;
			 display: flex;
			 justify-content: left;
			text-align: left;
			margin-right: auto; margin-left: auto;">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<%String faq28 = grabText.getTextById(63).getText();%>
						<h3 style="text-align: left; color:#f6eee3;"><%=faq28%></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<%String faq29 = grabText.getTextById(64).getText();%>
					<h3 style="text-align: left; line-height: 25pt"><%=faq29%></h3>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 800px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<%String faq30 = grabText.getTextById(77).getText();%>
					<h3 style="text-align: center; color:#f6eee3;"><%=faq30%></h3>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="text-center">
		<a href="contact.jsp" class="btn btn-main text-center">Contact Us</a>
	</div>
</section>

<%@include file="footer.jsp"%>


  </body>
  </html>
