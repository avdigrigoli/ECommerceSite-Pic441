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
	<title>PH441 | Home</title>
	<link href="http://fonts.cdnfonts.com/css/montserrat" rel="stylesheet">

	<%@include file="head.jsp"%>

</head>
<style>
	p{
		font-family: "acumin-pro-condensed", sans-serif;
		font-weight: 500;
	}
</style>

<body id="body" style="background-color: #fff4e9">
<script>
	function successnews() {
		alert("Thanks for subscribing!");
	}
</script>
<script>
	function unsub() {
		alert("Successfully Unsubscribed");
	}
</script>

<!-- Start Top Header Bar -->
<%@include file="navbar2.jsp"%>


<section style="background-color: #fff4e9">
	<div class="container-home">
		<div class="lefthome" style=" background:linear-gradient(0deg, rgba(31, 13, 64, 0.87), rgba(31, 13, 64, 0.87)), url('images/IMG_0163 1.png')
    no-repeat center / cover;">
			<div class="content">
				<%String home1 = grabText.getTextById(1).getText();%>
				<h1><%=home1%></h1>
			</div>
		</div>
		<div class="right">
			<%String home2 = grabText.getTextById(2).getText();%>
			<p style="color: #1F0D40; text-align: center; font-size: 200%"><%=home2%></p>
		</div>
	</div>
</section>

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
				int counter= 0;
				//Collections.reverse(products);
				for(eventModel p : products){
					if(p.getActive().equals("active")){
						if(counter == 6)
						{
							break;
						}
			%>
			<div class="col-md-4">
				<div class="product-item">
					<h3 style="text-align: center; color: #1F0D40"><%=p.getDate()%></h3>
					<div class="product-thumb">
						<%	counter++;	%>
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
										<p class="product-short-description" style="color: #1F0D40; background-color: #f8c892; border: #f8c892 10px solid; font-size: large;">
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
	<br>
	<br>
	<div class="block text-center">

		<div class="col-md-3">
		</div>
		<div class="col-md-3">
			<a href="shop.jsp" class="btn btn-main mt-20">Upcoming Events</a>
		</div>
		<div class="col-md-3">
			<a href="memberships.jsp" class="btn btn-main mt-20" >Membership Options</a>
		</div>
		<div class="col-md-3">
		</div>
	</div>
	<br>
	<br>
	<section class="call-to-action bg-gray section" style="background-color: #fff4e9; color: #1F0D40; ">
		<div class="container" style="">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="col-lg-6 col-md-offset-3">
						<h1 style="text-align: center; background-color: #1F0D40; color:#fff4e9; border: #1F0D40 5px solid">Be the first to hear about even more exclusive events!</h1>
						<form class="input-group subscription-form" action="subscribe" style="border: #1F0D40 1px solid">
							<input type="email" class="form-control" style="font-size: large" placeholder="Enter Your Email Address" name="email" id="email" required>
							<span class="input-group-btn">
				        <button class="btn btn-main" href="index.jsp">Subscribe Now!</button>
				      </span>
						</form><!-- /input-group -->
					</div><!-- /.col-lg-6 -->

				</div>
			</div> 		<!-- End row -->
		</div>   	<!-- End container -->
	</section>
</section>







<%@include file="footer.jsp"%>




</body>
</html>
