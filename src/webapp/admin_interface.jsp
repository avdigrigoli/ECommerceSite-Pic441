<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<!DOCTYPE html>

<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Admin Interface</title>

    <%@include file="head.jsp"%>

</head>

<body style="background-color: #fff4e9">


 <%
     adminUser user = (adminUser) session.getAttribute("user");
     if(user != null)
     {

 %>
 <%@include file="navbar2.jsp"%>


 <div style="background-color: #fff4e9;">
<br>
 <h1 style="text-align: center">Welcome Back, <%=user.getUname().toUpperCase()%></h1>
 <h1 style="text-align: center">Admin Options</h1>
<br>
 <div id="eventOptions" style="text-align: center">
     <a id="eventButton"  class="btn btn-main text-center"  href="add_event.jsp">Event Options</a>
 </div>
<br>
 <div id="layoutOptions" style="text-align: center">
     <a id="layoutButton"  class="btn btn-main text-center" href="interfaceLayout.jsp">Text Editor</a>
 </div>
<br>
 <div id="orderOptions" style="text-align: center">
     <a id="orderButton"  class="btn btn-main text-center"  href="orderBackups.jsp">Order Backups</a>
 </div>
<br>
 <div id="messagesTab" style="text-align: center">
     <a id="messagesButton"  class="btn btn-main text-center"  href="adminMessages.jsp">Messages</a>
 </div>
 <br>
     <div id="calendarOptions" style="text-align: center">
         <a id="calendarButton"  class="btn btn-main text-center"  href="calendarOptions.jsp">Calendar Options</a>
     </div>
     <br>
<div id="sendNewsEmail" style="text-align: center">
     <a id="sendNews"  class="btn btn-main text-center"  href="sendNews.jsp">Send Newsletter Email</a>
</div>
     <br>
<div id="admin_q" style="text-align: center">
     <a id="admin_question_list"  class="btn btn-main text-center"  href="admin_question_list.jsp">Event Question List</a>
</div>
     <br>
<div id="sendSubInfo" style="text-align: center;">
     <a id="subInfo"  class="btn btn-main text-center"  href="subscriberOptions.jsp">Subscriber Options</a>
</div>
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
