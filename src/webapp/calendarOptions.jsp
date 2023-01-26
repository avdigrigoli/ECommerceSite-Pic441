<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.CalendarEventDAO" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<%@ page import="com.picturehouse.picturehouse441.models.CalendarEvent" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Calendar Options</title>

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
<body style="background-color: #fff4e9">
<%
  adminUser user = (adminUser) session.getAttribute("user");
  if(user != null)
  {

%>
<%@include file="navbar2.jsp"%>

<br>
<h3 style="text-align: center">Calendar Options</h3>
<br>
<div id="adminoptions" style="text-align: center">
  <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
</div>
<section class="page-wrapper" style="background-color: #fdf4eb">
  <div class="contact-section">
    <div class="container">
      <div class="row">
        <!-- Contact Form -->
        <h3 style="text-align: center">Add Calendar Event</h3>
        <div class="contact-form">
          <form id="contact-form" method="post" action="CalendarEventServlet" role="form">

            <div class="form-group">
              <label for="name"> Name </label>
              <input type="text" placeholder="Event Name" class="form-control" name="name" id="name" required/>
            </div>

            <div class="form-group">
              <label for="description"> Description </label>
              <input type="text" placeholder="Event Description" class="form-control" name="description" id="description">
            </div>

            <div class="form-group">
              <label for="date"> Date (Use format Exact mm/dd/yyyy)</label>
              <input type="text" placeholder="mm/dd/yyyy" class="form-control" name="date" id="date" required/>
            </div>

            <div class="form-group">
              <input type="hidden" placeholder="Event" value="event" class="form-control" name="type" id="type" required/>
            </div>

            <div class="form-group">
              <label for="color"> Color (One Word All Caps or Hexcode including # in the beginning) </label>
              <input type="text" placeholder="Color" class="form-control" name="color" id="color" required/>
            </div>

            <div class="form-group">
              <label for="time"> Time </label>
              <input type="text" placeholder="Time" class="form-control" name="time" id="time" required/>
            </div>

            <div id="cf-submit">
              <input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit" style="background-color: #122558">
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<h3 style="text-align: center">Calendar Event Table</h3>
<div style="width: 75%; margin-left: auto; margin-right: auto">
  <table class="table table-hover table-dark" border="1">
    <thead>
    <tr>
      <th> ID </th>
      <th> Name </th>
      <th> Description </th>
      <th> Date </th>
      <th> Color </th>
      <th> Time </th>
      <th> Delete Event</th>
    </tr>
    </thead>
    <tbody>
    <% CalendarEventDAO pd = new CalendarEventDAO();
      List<CalendarEvent> products = pd.getAllEvents();
      if(!products.isEmpty()){
        //Collections.reverse(products);
        for(CalendarEvent p : products){
          int id = p.getID();
          String name = p.getName();
          String description = p.getDescription();
          String date = p.getDate();
          String color = p.getColor();
          String time = p.getTime();

    %>
    <tr>
      <td><%= id%></td>
      <td><%= name%></td>
      <td><%= description%></td>
      <td><%= date%></td>
      <td><%= color%></td>
      <td><%= time%></td>
      <td><a class="btn btn-white btn-outline-white" onclick="deleteConfirm()" href="deleteCal?id=<%= id%>">Delete Calendar Event</a></td>

    </tr>
    </tbody>
    <% }} %>
  </table>
</div>
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
