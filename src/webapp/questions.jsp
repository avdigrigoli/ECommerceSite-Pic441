<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%@ page import="com.picturehouse.picturehouse441.daos.textEditDao" %>
<%	textEditDao grabText = new textEditDao();%>
<%String question1 = grabText.getTextById(28).getText();%>

<!DOCTYPE html>


<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Enter Questions</title>

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
<%
    if(session.getAttribute("eventpassword") != null)
    {

%>

<section class="page-wrapper success-msg">
    <div class="container">
        <div class="block text-center">
            <i class="tf-ion-ios-email" style="background-color: #1F0D40" ></i>
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
                                    <h1 style="text-align: center; color:#f6eee3;"><%=question1%></h1>
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
                                <%String question2 = grabText.getTextById(30).getText();%>
                                <h4 style="text-align: center; line-height: 25pt; font-size: 200%"><%=question2%></h4>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
                <br>
                <div class="col-md-3"></div>
                <div class="col-md-6">

                    <form class="text-left clearfix" action="askquestion" method="post">
                        <div class="form-group">
                            <input style="font-size: 150%" type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <textarea style="font-size: 150%" type="text" class="form-control" id="question" name="question" placeholder="Question" required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-main text-center">Submit</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</section>

<%
}
else
{


%>
<section class="page-wrapper success-msg">
    <div class="container">
        <div class="block text-center">
            <i class="tf-ion-ios-email" style="background-color: #1F0D40" ></i>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 800px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <h1 style="text-align: center; color:#f6eee3;"><%=question1%></h1>
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
                                <%String question3 = grabText.getTextById(29).getText();%>
                                <h4 style="text-align: center; line-height: 25pt; font-size: 200%"><%=question3%></h4>
                            </div>
                            <br>
                        </div>
                    </div>
                </div>
                <br>
                <div class="col-md-3"></div>
                <div class="col-md-6">

                <form class="text-left clearfix" action="askquestion" method="get">
                    <div class="form-group">
                        <input style="font-size: 150%" type="text" class="form-control" id="otp" name="otp" pattern="\d*" maxlength="6" placeholder="One Time Password" required>
                    </div>
                    <p style="text-align: center">${error}</p>
                    <div class="text-center">
                        <button type="submit" class="btn btn-main text-center">Access Form</button>
                    </div>
                </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
</section>

<%
    }
%>
<%@include file="footer.jsp"%>



</body>
</html>