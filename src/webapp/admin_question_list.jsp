<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.picturehouse.picturehouse441.daos.contactemailDao" %>
<%@ page import="com.picturehouse.picturehouse441.models.contactModel" %>
<%@ page import="com.picturehouse.picturehouse441.daos.eventDao" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<%@ page import="com.picturehouse.picturehouse441.models.*" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Question List</title>

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
<h2 style="text-align: center">Question Lists</h2>
<br>
<div id="adminoptions" style="text-align: center">
  <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
</div>
<br>
    <% eventDao pd = new eventDao(Utils.getConnection());
      List<eventModel> products = pd.getAllProducts();
      if(!products.isEmpty()){
        //Collections.reverse(products);
        for(eventModel p : products){
          int product_id = p.getId();
          String name = p.getName();
          %>
<div style="width: 75%; margin-left: auto; margin-right: auto">
  <table class="table table-hover table-dark" border="1">
    <h3 style="text-align: center"><%= name%> Questions</h3>
    <thead>
    <tr>
      <th> ID </th>
      <th> Event Name </th>
      <th> Customer Name </th>
      <th> Question </th>
    </tr>
    </thead>
          <%

          questionModel question = new questionModel();
          List<questionModel> qPerEvent = question.getSingleEventQuestions(product_id);
          if(!qPerEvent.isEmpty())
          {
            for(questionModel q : qPerEvent)
            {
              int id = q.getId();
              String customer_name = q.getCustomer_name();
              String user_question = q.getQuestion();
    %>
    <tbody>
    <tr>
      <td><%= id%></td>
      <td><%= name%></td>
      <td><%= customer_name%></td>
      <td><%= user_question%></td>

    </tr>
    </tbody>
    <% }}}} %>
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
