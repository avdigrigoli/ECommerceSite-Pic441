<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.newsdao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.picturehouse.picturehouse441.models.*" %>
<%@ page import="com.picturehouse.picturehouse441.daos.subscriberDao" %>
<%@ page import="com.picturehouse.picturehouse441.models.subscriberModel" %>
<%@ page import="com.picturehouse.picturehouse441.daos.eventDao" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<!DOCTYPE html>

<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Subscriber Options</title>

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

<body id="body" style="background-color: #fff4e9">

<%
    adminUser user = (adminUser) session.getAttribute("user");
    if(user != null)
    {

%>
<%@include file="navbar2.jsp"%>


<section class="page-wrapper" style="background-color: #fdf4eb">
    <div class="contact-section">
        <div class="container">
            <div class="row">
                <!-- Contact Form -->
                <h3 style="text-align: center">SEND SUBSCRIBER LINK</h3>
                <br>
                <div id="adminoptions" style="text-align: center">
                    <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
                </div>
                <br>
                <div class="contact-form">
                    <form id="contact-form" method="post" action="sendSubscriberEmail" role="form">

                        <div class="form-group">
                            <input type="hidden" placeholder="Your Name" class="form-control" name="name" id="name" value="PICTUREHOUSE441">
                        </div>

                        <div class="form-group">
                            <input type="hidden" placeholder="Your Email" class="form-control" name="email" id="email" value="PICTUREHOUSE441">
                        </div>

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
                            <input type="hidden" placeholder="Subject" class="form-control" name="subject" id="subject" value="Your Picturehouse 441 One-Time Passcode" required/>
                        </div>

                        <div class="form-group">
                            <input  type="hidden" placeholder="Message" class="form-control" name="message" id="message" value=" in " required></input>
                        </div>

                        <div id="mail-success" class="success">
                            Thank you. The Mailman is on His Way :)
                        </div>

                        <div id="mail-fail" class="error">
                            Sorry, don't know what happened. Try later :(
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
<h3 style="text-align: center">Subscriber List</h3>
<div style="width: 75%; margin-left: auto; margin-right: auto">
    <table class="table table-hover table-dark" border="1">
        <thead>
        <tr>
            <th> ID </th>
            <th> Email </th>
            <th> Expiration Date </th>
        </tr>
        </thead>
        <tbody>
        <% subscriberDao pd = new subscriberDao();
            List<subscriberModel> products = pd.getSubs();
            if(!products.isEmpty()){
                //Collections.reverse(products);
                for(subscriberModel p : products){
                    int id = p.getId();
                    String name = p.getEmail();
                    String expiration_date = p.getDate();


        %>
        <tr>
            <td><%= id%></td>
            <td><%= name%></td>
            <td><%= expiration_date%></td>
        </tr>
        </tbody>
        <% }} %>
    </table>
</div>
<%@include file="footer.jsp"%>
<!-- ./End Contact Form -->



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