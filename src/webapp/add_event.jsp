<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.eventDao" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<%@ page import="com.picturehouse.picturehouse441.models.eventModel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Event Options</title>

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
        alert("Successfully Deleted Event, Related Orders, Related Questions!");
    }
        function switchConfirm() {
            alert("Successfully Switched!");
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
<h3 style="text-align: center">Event Options</h3>
<br>
<div id="adminoptions" style="text-align: center">
    <a id="adminoptionsbutton"  class="btn btn-main text-center" href="admin_interface.jsp"> Back to Options Menu </a>
</div>
<section class="page-wrapper" style="background-color: #fff4e9">
    <div class="contact-section">
        <div class="container">
            <div class="row">
                <!-- Contact Form -->
                <h3 style="text-align: center">Add An Event</h3>
                <p style="text-align: center">If brought to the error page when trying to submit an event, rename the name of your photo file and try again!</p>
                <div class="contact-form">
                    <form id="contact-form" method="post" action="add_event" role="form" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="name"> Name </label>
                            <input type="text" placeholder="Event Name" class="form-control" name="name" id="name" required/>
                        </div>

                        <div class="form-group">
                            <label for="price"> Price </label>
                            <input type="text" placeholder="Event Price" class="form-control" name="price" id="price" required/>
                        </div>

                        <div class="form-group">
                            <label for="date"> Date </label>
                            <input type="text" placeholder="Event Date" class="form-control" name="date" id="date" required/>
                        </div>

                        <div class="form-group">
                            <label for="description"> Description </label>
                            <input type="text" placeholder="Event Description" class="form-control" name="description" id="description" required/>
                        </div>

                        <div class="form-group">
                            <label for="guest"> Guest </label>
                            <input type="text" placeholder="Event Guest" class="form-control" name="guest" id="guest" required/>
                        </div>

                        <div class="form-group">
                            <label for="guest_description"> Guest Description </label>
                            <input type="text" placeholder="Guest Description" class="form-control" name="guest_description" id="guest_description" required/>
                        </div>

                        <div class="form-group">
                            <label for="platforms_to_watch"> Platforms To Watch </label>
                            <input type="text" placeholder="Platforms to Watch" class="form-control" name="platforms_to_watch" id="platforms_to_watch" required/>
                        </div>

                        <div class="form-group">
                            <input type="text" placeholder="active" value="active" class="form-control" name="active" id="active" style="display: none">
                        </div>

                        <div class="form-group">
                            <label for="link"> link </label>
                            <input type="text" placeholder="Event Link" class="form-control" name="link" id="link" required/>
                        </div>

                        <div class="form-group">
                            <label for="photo"> photo </label>
                            <input type="file" class="form-control" name="photo" id="photo" required/>
                        </div>

                        <div id="cf-submit">
                            <input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit" >
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<h3 style="text-align: center">Active Event List Table</h3>
<div style="width: 75%; margin-left: auto; margin-right: auto">
    <table class="table table-hover table-dark" border="1">
        <thead>
        <tr>
            <th> ID </th>
            <th> Name </th>
            <th> Price </th>
            <th> Date </th>
            <th> Description </th>
            <th> Guest </th>
            <th> Guest Description </th>
            <th> Platforms </th>
            <th> Link </th>
            <th> Image </th>
            <th> Switch </th>
            <th> Delete Event</th>
        </tr>
        </thead>
        <tbody>
        <% eventDao pd = new eventDao(Utils.getConnection());
            List<eventModel> products = pd.getAllProducts();
            if(!products.isEmpty()){
                //Collections.reverse(products);
                for(eventModel p : products){
                    if(p.getActive().equals("active")){
                    int id = p.getId();
                    String name = p.getName();
                    double price = p.getPrice();
                    String date = p.getDate();
                    String description = p.getDescription();
                    String guest = p.getGuest();
                    String guest_description = p.getGuest_description();
                    String platforms = p.getPlatforms_to_watch();
                    String active = p.getActive();
                    String link = p.getLink();


        %>
        <tr>
            <td><%= id%></td>
            <td><%= name%></td>
            <td>$<%= price%></td>
            <td><%= date%></td>
            <td><%= description%></td>
            <td><%= guest%></td>
            <td><%= guest_description%></td>
            <td><%= platforms%></td>
            <td><%= link%></td>
            <td><img src="create_event_image.jsp?id=<%= id%>" loading="lazy" width="100px" class="img-fluid"/></td>
            <td><a class="btn btn-white btn-outline-white" onclick="switchConfirm()" href="archiveEvent?id=<%= id%>"> Archive Event</a></td>
            <td><a class="btn btn-white btn-outline-white" onclick="deleteConfirm()" href="deleteEvent?id=<%= id%>">Delete Event</a></td>
        </tr>
        </tbody>
        <% } }}%>
    </table>
</div>

<br>

<h3 style="text-align: center">Archived Event List Table</h3>
<div style="width: 75%; margin-left: auto; margin-right: auto">
    <table class="table table-hover table-dark" border="1">
        <thead>
        <tr>
            <th> ID </th>
            <th> Name </th>
            <th> Price </th>
            <th> Date </th>
            <th> Description </th>
            <th> Guest </th>
            <th> Guest Description </th>
            <th> Platforms </th>
            <th> Link </th>
            <th> Image </th>
            <th> Switch </th>
            <th> Delete Event</th>
        </tr>
        </thead>
        <tbody>
        <%
            if(!products.isEmpty()){
                //Collections.reverse(products);
                for(eventModel p : products){
                    if(p.getActive().equals("archive")){
                        int id = p.getId();
                        String name = p.getName();
                        double price = p.getPrice();
                        String date = p.getDate();
                        String description = p.getDescription();
                        String guest = p.getGuest();
                        String guest_description = p.getGuest_description();
                        String platforms = p.getPlatforms_to_watch();
                        String active = p.getActive();
                        String link = p.getLink();


        %>
        <tr>
            <td><%= id%></td>
            <td><%= name%></td>
            <td>$<%= price%></td>
            <td><%= date%></td>
            <td><%= description%></td>
            <td><%= guest%></td>
            <td><%= guest_description%></td>
            <td><%= platforms%></td>
            <td><%= link%></td>
            <td><img src="create_event_image.jsp?id=<%= id%>" loading="lazy" width="100px" class="img-fluid"/></td>
            <td><a class="btn btn-white btn-outline-white" onclick="switchConfirm()" href="archiveEvent?id=<%= id%>"> Activate Event</a></td>
            <td><a class="btn btn-white btn-outline-white" onclick="deleteConfirm()" href="deleteEvent?id=<%= id%>">Delete Event</a></td>
        </tr>
        </tbody>
        <% } }}%>
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
