<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.picturehouse.picturehouse441.daos.contactemailDao" %>
<%@ page import="com.picturehouse.picturehouse441.models.contactModel" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Messages</title>

    <%@include file="head.jsp"%>

    <style>
        p{
            color: #122558;
        }

        h1,h2,h3,h4{
            color: #122558;
        }
    </style>
</head>
<script>
    function deleteConfirm() {
        alert("Successfully Deleted!");
    }
</script>
<style>
    #insertform
    {
        text-align: center;
        display: block;
    }
    form
    {
        width: 50%;
        margin-left: auto;
        margin-right: auto;
        text-align: left;
        border-bottom: 10px solid white;
        border-top: 10px solid white;
        border-left: 10px solid white;
        border-right: 10px solid white;
    }
</style>
<body style="background-color: #fff4e9">
<%
    adminUser user = (adminUser) session.getAttribute("user");
    if(user != null)
    {

%>

<%@include file="navbar2.jsp"%>
<br>
<h3 style="text-align: center">Messages</h3>
<br>
<div id="adminoptions" style="text-align: center">
    <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
</div>
<br>
<div style="width: 75%; margin-left: auto; margin-right: auto">
    <table class="table table-hover table-dark" border="1">
        <thead>
        <tr>
            <th> ID </th>
            <th> Name </th>
            <th> Email </th>
            <th> Subject </th>
            <th> Message </th>
            <th> Delete Message</th>
        </tr>
        </thead>
        <tbody>
        <% contactemailDao pd = new contactemailDao();
            List<contactModel> products = pd.getAllEmails();
            if(!products.isEmpty()){
                Collections.reverse(products);
                for(contactModel p : products){
                    int id = p.getID();
                    String name = p.getName();
                    String email = p.getEmail();
                    String subject = p.getSubject();
                    String msg = p.getMsg();


        %>
        <tr>
            <td><%= id%></td>
            <td><%= name%></td>
            <td><%= email%></td>
            <td><%= subject%></td>
            <td><%= msg%></td>
            <td><a class="btn btn-white btn-outline-white" onclick="deleteConfirm()" href="deleteMessage?id=<%= id%>">Delete Message</a></td>

        </tr>
        </tbody>
        <% }} %>
    </table>
</div>
<br>
<br>
<%@include file="footer.jsp"%>
<%
}
else
{


%>
<section class="page-404" style="background-color: #f6eee3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="index.jsp">
                    <img src="images/smalllogo2.jpg" width="25%" alt="site logo" />
                </a>
                <h2 style="color: #122558; font-size: xx-large">Access Denied</h2>
                <br>
                <h4 style="color: #122558">You're not supposed to be here ;)</h4>
                <a href="index.jsp" class="btn btn-main" style="background-color: #122558"><i class="tf-ion-android-arrow-back"></i> Home</a>
                <p class="copyright-text">Copyright &#169; 2022, Designed & Developed for PICTUREHOUSE441</p>
            </div>
        </div>
    </div>
</section>
<%
    }
%>
</body>
</html>
