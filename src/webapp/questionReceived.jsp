<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<!DOCTYPE html>


<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Question Received</title>

    <%@include file="head.jsp"%>

</head>
<style>
    h4{
        font-family: "acumin-pro-condensed", sans-serif;
        font-weight: 500;
    }
</style>

<body id="body" style="background-color: #fdf4eb">

<%@include file="navbar2.jsp"%>
<!-- Page Wrapper -->
<section class="page-wrapper success-msg">
    <div class="container">
        <div class="block text-center">
            <i class="tf-ion-film-marker" style="background-color: #1F0D40" ></i>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 40%;
			 display: flex;
			 justify-content: center;
			 max-width: 800px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <%String contactsent1 = grabText.getTextById(31).getText();%>
                                    <h1 style="text-align: center; color:#fff4e9;"><%=contactsent1%></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" style=" min-width: 15vw; position: relative; width: 100%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; background-color: #f8c892">
                        <div class="row">
                            <div class="col-md-12" style="border: transparent 10vh solid;">
                                <%String contactsent2 = grabText.getTextById(32).getText();%>
                                <h4 style="text-align: center; line-height: 25pt; font-size: 200%"><%=contactsent2%></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="block text-center">
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                    <a href="questions.jsp" class="btn btn-main mt-20" >Submit Another</a>
                </div>
                <div class="col-md-3">
                    <a href="shop.jsp" class="btn btn-main mt-20">More Events</a>
                </div>
                <div class="col-md-3">
                </div>
            </div>
        </div>
    </div>
    </div>
</section><!-- /.page-warpper -->

<%@include file="footer.jsp"%>



</body>
</html>