<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<!DOCTYPE html>

<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Redeem</title>

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
                                    <%String redeem1 = grabText.getTextById(34).getText();%>
                                    <h1 style="text-align: center; color:#f6eee3;"><%=redeem1%></h1>
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
                                <%String redeem2 = grabText.getTextById(35).getText();%>
                                <h4 style="text-align: center; line-height: 25pt; font-size: 200%"><%=redeem2%></h4>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
                <br>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form class="text-left clearfix" action="redeem" method="post" target="openzoom">
                        <div class="form-group">
                            <input style="font-size: 150%" type="email" class="form-control" id="email-for-pass" name="email" placeholder="Email Address" required>
                        </div>
                        <div class="form-group">
                            <input style="font-size: 150%" type="text" class="form-control" id="otp" name="otp" pattern="\d*" maxlength="6" placeholder="One-Time Password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-main text-center">Redeem Event</button>
                        </div>
                    </form>
                    <br>
                        <iframe name="openzoom" src="" id="openzoom" style="width: 100%; height: 500px;"></iframe>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>




</body>
</html>


