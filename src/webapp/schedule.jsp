<%@page import="com.picturehouse.picturehouse441.Utils"%>
<%@page import="com.picturehouse.picturehouse441.daos.eventDao"%>
<%@page import="com.picturehouse.picturehouse441.models.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    adminUser auth = (adminUser) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
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
    <title>PH441 | Event List</title>

    <%@include file="head.jsp"%>

</head>

<body id="body" style="background-color: #fff4e9">


<%@include file="navbar2.jsp"%>

<br>
<br>
<br>
<br>
<br>
<br>
<div style="position: center; z-index: 0;">
<%String cal1 = grabText.getTextById(33).getText();%>
<h1 style="text-align: center" class="testheader"><%=cal1%></h1>
</div>

<section class="call-to-action bg-gray section" style="background-color: #fff4e9; color: #122558; border-bottom: 1px solid #dedede;">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <%@include file="calendar.jsp"%>
            </div>
        </div> 		<!-- End row -->
    </div>   	<!-- End container -->
</section>



<%@include file="footer.jsp"%>

</body>
</html>
