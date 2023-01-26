<%@page import="com.picturehouse.picturehouse441.Utils"%>
<%@page import="com.picturehouse.picturehouse441.daos.eventDao"%>
<%@page import="com.picturehouse.picturehouse441.models.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>

<%
	adminUser auth = (adminUser) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("person", auth);
	}
	textEditDao grabText = new textEditDao();
	eventDao pd = new eventDao(Utils.getConnection());
	List<eventModel> products = pd.getAllProducts();
	ArrayList<cartModel> cart_list = (ArrayList<cartModel>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>

<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Shop</title>

	<%@include file="head.jsp"%>
</head>
<style>
	h4{
		font-family: "acumin-pro-condensed", sans-serif;
		font-weight: 500;
	}
</style>

<body id="body" style="background-color: #fdf4eb">


<%@include file="navbar2.jsp"%>




<section class="products section bg-gray" style="background-color: #fff4e9; border-bottom: 1px solid #dedede;">

	<%String home3 = grabText.getTextById(3).getText();%>
	<h1 style="text-align: center" class="testheader"><%=home3%></h1>
	<%String home4 = grabText.getTextById(4).getText();%>
	<h3 style="text-align: center; color: #1F0D40; font-family: 'acumin-pro-condensed', sans-serif;
	font-weight: 500;"><%=home4%></h3>
	<br>

	<% if(!products.isEmpty()){
	%>
	<div class="container">
		<div class="row">
		</div>
		<div class="row">
			<%
				//Collections.reverse(products);
				for(eventModel p : products){
					if(p.getActive().equals("active")){
			%>
			<div class="col-md-4">
				<div class="product-item">
					<h3 style="text-align: center; color: #1F0D40"><%=p.getDate()%></h3>
					<div class="product-thumb">
						<img class="img-responsive" src="create_event_image.jsp?id=<%=p.getId()%>" width="336px" height="500px" alt="product-img"/>

					</div>
					<div class="product-content">
						<h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px"><%=p.getName()%> Q&A with <%=p.getGuest()%></h3>
						<h3 style="color: #1F0D40;">$<%=p.getPrice()%>0</h3>
						<div class="col-md-4" style="text-align: center; justify-content: center; align-items: center">
							<a class="btn btn-main mt-20" style="scale: .75" data-toggle="modal" data-target="#product-modal<%=p.getId()%>">
								Event Info
							</a>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-4" style="text-align: center; justify-content: center; align-items: center">

							<a class="btn btn-main mt-20" style="scale: .75" href="add-to-cart?id=<%=p.getId()%>">Add To Cart</a>

						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="product-modal<%=p.getId()%>" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="border-width: 0">
						<div class="modal-header" role="document" style="background-color: #fff4e9; border-bottom: transparent">
							<button type="button" style="border: none; color: #1F0D40; background-color: #fff4e9" data-dismiss="modal" aria-label="Close">
								&times;</button>
						</div>
						<div class="modal-body" style="background-color: #fff4e9;">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="product-short-details">
										<div class="col-md-5 col-sm-12 col-xs-12"></div>
										<div class="col-md-7 col-sm-12 col-xs-12" style="margin-top: -50px">
											<h2 style="background-color: #1F0D40; color: #fff4e9; text-align: right; border: #1F0D40 10px solid;"><%=p.getName()%></h2>
										</div>
										<p class="product-short-description" style="color: #1F0D40; background-color: #f8c892; border: #f8c892 10px solid; font-size: large; font-family: 'Montserrat', sans-serif">
											<br>
											Where to Watch: <%=p.getPlatforms_to_watch()%><br>
											<br>
											Date: <%=p.getDate()%> <br>
											<br>
											Description: <%=p.getDescription()%> <br>
											<br>
											Guest: <%=p.getGuest()%> <br>
											<br>
											Guest Description: <%=p.getGuest_description()%> <br>
											<br>
											Price: $<%=p.getPrice()%>0
										</p>
										<div class="col-md-4 col-sm-4 col-xs-2"></div>
										<div class="col-md-4 col-sm-4 col-xs-8" style="justify-content: center; align-items: center; text-align: center">
											<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-main">Add To Cart</a>
										</div>
										<div class="col-md-4 col-sm-4 col-xs-2"></div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
						}
					}
				}else {
					out.println("<h3 style=\"text-align: center\"> THERE ARE NO UPCOMING EVENTS LISTED AT THIS TIME</h3>");
				}
			%>
		</div>
	</div>
</section>


<section class="products section bg-gray" style="background-color: #fff4e9;">

	<%String home5 = grabText.getTextById(5).getText();%>
	<h1 style="text-align: center" class="testheader"><%=home5%></h1>
	<%String home6 = grabText.getTextById(6).getText();%>
	<h3 style="text-align: center; color: #1F0D40; font-family: 'acumin-pro-condensed', sans-serif;
	font-weight: 500;"><%=home6%></h3>
	<br>

	<% if(!products.isEmpty()){
	%>
	<div class="container">
		<div class="row">
		</div>
		<div class="row">
			<%
				//Collections.reverse(products);
				for(eventModel p : products){
					if(p.getActive().equals("archive")){
			%>
			<div class="col-md-4">
				<div class="product-item">
					<h3 style="text-align: center; color: #1F0D40"><%=p.getDate()%></h3>
					<div class="product-thumb">
						<img class="img-responsive" src="create_event_image.jsp?id=<%=p.getId()%>" width="336px" height="500px" alt="product-img"/>

					</div>
					<div class="product-content">
						<h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px"><%=p.getName()%> Q&A with <%=p.getGuest()%></h3>
						<div class="col-md-12" style="text-align: center; justify-content: center; align-items: center">
							<a class="btn btn-main mt-20" data-toggle="modal" data-target="#product-modal<%=p.getId()%>">
								Event Info
							</a>
						</div>

					</div>
				</div>
			</div>

			<div class="modal fade" id="product-modal<%=p.getId()%>" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="border-width: 0">
						<div class="modal-header" role="document" style="background-color: #fff4e9; border-bottom: transparent">
							<button type="button" style="border: none; color: #1F0D40; background-color: #fff4e9" data-dismiss="modal" aria-label="Close">
								&times;</button>
						</div>
						<div class="modal-body" style="background-color: #fff4e9;">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="product-short-details">
										<div class="col-md-5 col-sm-12 col-xs-12"></div>
										<div class="col-md-7 col-sm-12 col-xs-12" style="margin-top: -50px">
											<h2 style="background-color: #1F0D40; color: #fff4e9; text-align: right; border: #1F0D40 10px solid;"><%=p.getName()%></h2>
										</div>
										<p class="product-short-description" style="color: #1F0D40; background-color: #f8c892; border: #f8c892 10px solid; font-size: large; font-family: 'Montserrat', sans-serif">
											<br>
											Where to Watch: <%=p.getPlatforms_to_watch()%><br>
											<br>
											Date: <%=p.getDate()%> <br>
											<br>
											Description: <%=p.getDescription()%> <br>
											<br>
											Guest: <%=p.getGuest()%> <br>
											<br>
											Guest Description: <%=p.getGuest_description()%> <br>
											<br>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
						}
					}
				}else {
					out.println("<h3 style=\"text-align: center\"> THERE ARE NO PAST EVENTS AT THIS TIME</h3>");
				}
			%>
		</div>
	</div>
	<br>
	<br>
	<%String home7 = grabText.getTextById(20).getText();%>
	<h1 style="text-align: center" class="testheader"><%=home7%></h1>
	<%String home8 = grabText.getTextById(65).getText();%>
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<h3 style="text-align: center; color: #1F0D40; font-family: 'acumin-pro-condensed', sans-serif;
		font-weight: 500;"><%=home8%></h3>
	</div>
	<div class="col-md-3"></div>
</section>


<section class="pricing-table">
<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="container">
					<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 700px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
						<div class="row">
							<div class="col-md-12">
								<div class="content">
									<%String home0 = grabText.getTextById(69).getText();%>
									<h1 style="text-align: center; color:#fff4e9;"><%=home0%></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="container" style="position: relative; width: 75%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
						<div class="row">

							<div class="col-md-12" style="">
								<%String home01 = grabText.getTextById(75).getText();%>
								<h4 style="text-align: center; font-size: 185%"><%=home01%></h4>
							</div>
						</div>
					</div>
					<div class="col-md-12" style="text-align: center; justify-content: center; align-items: center;">
						<form action="subscription-payment" method="POST" id="sixmonthsub" name="sixmonthsub">
							<input type="hidden" name="subscriptionType" value="sixmonth" />
							<script
									src="https://checkout.stripe.com/checkout.js" class="stripe-button"
									data-key="pk_live_51LfOoICkxKOFJaMRsyLYQ3CLe028v3N0vcpN3bNUwwHzzXe3NU5nIzFQEpOTBUAY3jrwXdl03JCmwHvDesdv7Gfi00HROmQdcO"
									data-amount="15000"
									data-name="Picturehouse 441"
									data-description="6 Month Subscription"
									data-image="images/smalllogo2.jpg"
									data-locale="auto"
									data-billing-address="true"
									data-currency="usd">
							</script>
							<script>
								document.getElementsByClassName("stripe-button-el")[0].style.display = 'none';
							</script>
							<button type="submit" class="btn btn-main mt-20">Buy now</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<br>
	<br>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="container">
					<div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 700px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
						<div class="row">
							<div class="col-md-12">
								<div class="content">
									<%String home02 = grabText.getTextById(71).getText();%>
									<h1 style="text-align: center; color:#fff4e9;"><%=home02%></h1>
								</div>
							</div>
						</div>
					</div>
					<div class="container" style="position: relative; width: 75%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
						<div class="row">

							<div class="col-md-12" style="">
								<%String home03 = grabText.getTextById(76).getText();%>
								<h4 style="text-align: center; font-size: 185%"><%=home03%></h4>
							</div>
						</div>
					</div>
					<div class="col-md-12" style="text-align: center; justify-content: center; align-items: center;">

						<form action="subscription-payment" method="POST" id="yearsub" name="yearsub">
							<input type="hidden" name="subscriptionType" value="oneyear" />
							<script
									src="https://checkout.stripe.com/checkout.js" class="stripe-button"
									data-key="pk_live_51LfOoICkxKOFJaMRsyLYQ3CLe028v3N0vcpN3bNUwwHzzXe3NU5nIzFQEpOTBUAY3jrwXdl03JCmwHvDesdv7Gfi00HROmQdcO"
									data-amount="25000"
									data-name="Picturehouse 441"
									data-description="One Year Subscription"
									data-image="images/smalllogo2.jpg"
									data-locale="auto"
									data-billing-address="true"
									data-currency="usd">
							</script>
							<script>
								document.getElementsByClassName("stripe-button-el")[1].style.display = 'none';
							</script>
							<button type="submit" class="btn btn-main mt-20">Buy now</button>
						</form>
					</div>
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>
	  	<!-- End container -->
	<br>
</section>   <!-- End section -->


<%@include file="footer.jsp"%>

  </body>
  </html>
