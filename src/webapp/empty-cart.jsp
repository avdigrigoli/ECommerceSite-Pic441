<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<!DOCTYPE html>



<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Empty Cart</title>

    <%@include file="head.jsp"%>

</head>
<style>
    p{
        font-family: "acumin-pro-condensed", sans-serif;
        font-weight: 500;
    }
</style>

<body id="body" style="background-color: #fdf4eb">

<%@include file="navbar2.jsp"%>

<section class="empty-cart page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-ios-cart-outline" style="color: #1F0D40"></i>
            <%String empty1 = grabText.getTextById(18).getText();%>
            <h2 class="text-center" style="color: #1F0D40"><%=empty1%></h2>
            <%String empty2 = grabText.getTextById(19).getText();%>
            <p style="color: #1F0D40"><%=empty2%></p>
          	<a href="shop.jsp" class="btn btn-main mt-20">EVENTS</a>
      </div>
    </div>
  </div>
  </div>
</section>

<%@include file="footer.jsp"%>



  </body>
  </html>