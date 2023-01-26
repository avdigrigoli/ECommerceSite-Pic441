<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="com.picturehouse.picturehouse441.daos.OrderDao" %>
<%@ page import="com.picturehouse.picturehouse441.models.orderModel" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.picturehouse.picturehouse441.daos.eventDao" %>
<%@ page import="com.picturehouse.picturehouse441.models.eventModel" %>
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
<h3 style="text-align: center">Order Backups</h3>
<br>
<div id="adminoptions" style="text-align: center">
  <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
</div>

<section class="page-wrapper" style="background-color: #fdf4eb">
  <div class="contact-section">
    <div class="container">
      <div class="row">
        <!-- Contact Form -->
        <h3 style="text-align: center">Add Manual Event</h3>
        <div class="contact-form">
          <form id="contact-form" method="post" action="adminAddOrder" role="form">

            <div class="form-group">
              <label for="product_id">Select Event:</label>
              <select class="form-control" id="product_id" name="product_id" required>
                <%String chooseid;
                  String choosename;
                  eventDao getids = new eventDao(Utils.getConnection());
                  List<eventModel> list = getids.getAllProducts();
                  for(eventModel i : list)
                  {
                    chooseid = String.valueOf(i.getId());
                    choosename = i.getName();
                %>
                <option value="<%=chooseid%>"><%= chooseid%> | <%= choosename%></option>
                <%}%>
              </select>
            </div>

            <div class="form-group">
              <label for="email"> Email </label>
              <input type="email" placeholder="Email" class="form-control" name="email" id="email" required/>
            </div>

            <div class="form-group">
              <label for="otp"> OTP</label>
              <input type="text" placeholder="One Time Password" class="form-control" name="otp" id="otp" pattern="\d*" maxlength="6" required/>
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

<h3 style="text-align: center">Order List</h3>
<br>
<div style="width: 75%; margin-left: auto; margin-right: auto">
  <table class="table table-hover table-dark" border="1">
    <thead>
    <tr>
      <th> ID </th>
      <th> Product ID </th>
      <th> Product Link </th>
      <th> Email </th>
      <th> One Time Password </th>
      <th> Date </th>
      <th> Delete Event</th>
    </tr>
    </thead>
    <tbody>
    <% OrderDao pd = new OrderDao(Utils.getConnection());
      List<orderModel> products = pd.getAllOrders();
      if(!products.isEmpty()){
        Collections.reverse(products);
        for(orderModel p : products){
          int id = p.getId();
          int product_id = p.getProduct_id();
          String product_link = p.getProduct_link();
          String email = p.getEmail();
          String otp = p.getOtp();
          String date = p.getDate();

          String p_id;
          if (product_id == 0)
          {
            p_id = "Subscriber Order";
          }
          else if(product_id == -1)
          {
            p_id = "Manually Added Order";
          }
          else
          {
            //p_id = String.valueOf(product_id);
            eventDao productname = new eventDao(Utils.getConnection());
            eventModel pname = productname.getSingleProduct(product_id);
            p_id = pname.getName();
          }

    %>
    <tr>
      <td><%= id%></td>
      <td><%= p_id%></td>
      <td><a href="<%= product_link%>"><%= product_link%></></td>
      <td><%= email%></td>
      <td><%= otp%></td>
      <td><%= date%></td>
      <td><a class="btn btn-white btn-outline-white" onclick="deleteConfirm()" href="deleteOrder?id=<%= id%>">Delete Backup Order</a></td>

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
