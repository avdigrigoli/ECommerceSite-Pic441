<%@ page import="com.picturehouse.picturehouse441.models.adminUser" %>
<%	textEditDao grabText = new textEditDao();%>

<!DOCTYPE html>

<html lang="en">
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title>PH441 | Memberships</title>

    <%@include file="head.jsp"%>

</head>
<style>
    h4{
        font-family: "acumin-pro-condensed", sans-serif;
        font-weight: 500;
    }
</style>

<body id="body" style="background-color: #fff4e9">


<%@include file="navbar2.jsp"%>
<!-- Page Wrapper -->
<br>

<section class="page-wrapper success-msg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 700px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <%String mem1 = grabText.getTextById(67).getText();%>
                                    <h1 style="text-align: center; color:#fff4e9;"><%=mem1%></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" style="position: relative; width: 75%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
                        <div class="row">

                            <div class="col-md-12" style="">
                                <%String mem2 = grabText.getTextById(68).getText();%>
                                <h4 style="text-align: center; font-size: 175%"><%=mem2%></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <br>
    <br>


    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 700px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <%String mem3 = grabText.getTextById(69).getText();%>
                                    <h1 style="text-align: center; color:#fff4e9;"><%=mem3%></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" style="position: relative; width: 75%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
                        <div class="row">

                            <div class="col-md-12" style="">
                                <%String mem4 = grabText.getTextById(70).getText();%>
                                <h4 style="text-align: center; font-size: 175%"><%=mem4%></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="text-align: center; justify-content: center; align-items: center;">
                        <form action="subscription-payment" method="POST" id="sixmonthsub" name="sixmonthsub">
                            <input type="hidden" name="subscriptionType" value="sixmonth" />
                            <script
                                    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="pk_live_51LfOoICkxKOFJaMRsyLYQ3CLe028v3N0vcpN3bNUwwHzzXe3NU5nIzFQEpOTBUAY3jrwXdl03JCmwHvDesdv7Gfi00HROmQdcO"
                                    data-amount="15000"
                                    data-name="Picturehouse 441"
                                    data-description="6 Month Subscription"
                                    data-image="images/smalllogo2.jpg"
                                    data-locale="auto"
                                    data-billing-address="true"
                                    data-currency="usd">
                            </script>
                            <script>
                                document.getElementsByClassName("stripe-button-el")[0].style.display = 'none';
                            </script>
                            <button type="submit" class="btn btn-main mt-20">Buy now</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <br>
    <br>


    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="container" style=" z-index: 100;position: relative; background-color: #1F0D40; width: 60%;
			 display: flex;
			 justify-content: center;
			 max-width: 700px;
			text-align: center;
			margin-right: auto; margin-left: auto;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <%String mem5 = grabText.getTextById(71).getText();%>
                                    <h1 style="text-align: center; color:#fff4e9;"><%=mem5%></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" style="position: relative; width: 75%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
                        <div class="row">

                            <div class="col-md-12" style="">
                                <%String mem6 = grabText.getTextById(72).getText();%>
                                <h4 style="text-align: center; font-size: 175%"><%=mem6%></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="text-align: center; justify-content: center; align-items: center;">

                        <form action="subscription-payment" method="POST" id="yearsub" name="yearsub">
                            <input type="hidden" name="subscriptionType" value="oneyear" />
                            <script
                                    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="pk_live_51LfOoICkxKOFJaMRsyLYQ3CLe028v3N0vcpN3bNUwwHzzXe3NU5nIzFQEpOTBUAY3jrwXdl03JCmwHvDesdv7Gfi00HROmQdcO"
                                    data-amount="25000"
                                    data-name="Picturehouse 441"
                                    data-description="One Year Subscription"
                                    data-image="images/smalllogo2.jpg"
                                    data-locale="auto"
                                    data-billing-address="true"
                                    data-currency="usd">
                            </script>
                            <script>
                                document.getElementsByClassName("stripe-button-el")[1].style.display = 'none';
                            </script>
                            <button type="submit" class="btn btn-main mt-20">Buy now</button>
                        </form>
                    </div>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </div>

    <br>
    <div class="container">
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
                                    <%String mem7 = grabText.getTextById(73).getText();%>
                                    <h1 style="text-align: center; color:#fff4e9;"><%=mem7%></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" style="position: relative; width: 75%;
			 display: flex;
			 justify-content: center;
			text-align: center;
			margin-right: auto; margin-left: auto; padding: 1.5vh; background-color: #f8c892;">
                        <div class="row">

                            <div class="col-md-12" style="">
                                <%String mem8 = grabText.getTextById(74).getText();%>
                                <h4 style="text-align: center; font-size: 175%"><%=mem8%> </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="block text-center">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                        <a href="schedule.jsp" class="btn btn-main mt-20" >Events Schedule</a>
                    </div>
                    <div class="col-md-3">
                        <a href="contact.jsp" class="btn btn-main mt-20" >Contact Us</a>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>


</body>
</html>