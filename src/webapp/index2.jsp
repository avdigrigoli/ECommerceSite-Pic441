<%@page import="com.picturehouse.picturehouse441.Utils"%>
<%@page import="com.picturehouse.picturehouse441.daos.eventDao"%>
<%@page import="com.picturehouse.picturehouse441.models.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
  adminUser auth = (adminUser) request.getSession().getAttribute("auth");
  if (auth != null) {
    request.setAttribute("person", auth);
  }
  eventDao pd = new eventDao(Utils.getConnection());
  List<eventModel> products = pd.getAllProducts();
  ArrayList<cartModel> cart_list = (ArrayList<cartModel>) session.getAttribute("cart-list");
  if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
  }
%>

<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Home</title>

  <%@include file="head.jsp"%>

</head>

<body id="body" style="background-color: #fff4e9">
<script>
  function successnews() {
    alert("Thanks for subscribing!");
  }
</script>
<script>
  function unsub() {
    alert("Successfully Unsubscribed");
  }
</script>


<!-- Start Top Header Bar -->
<%@include file="navbar2.jsp"%>


<section style="background-color: #fff4e9">
  <div class="container-home">
    <div class="lefthome" style=" background:linear-gradient(0deg, rgba(31, 13, 64, 0.87), rgba(31, 13, 64, 0.87)), url('images/IMG_0163 1.png')
    no-repeat center / cover;">
      <div class="content">
        <h1>You Have The Questions. <br> They Have The Answers.</h1>
      </div>
    </div>
    <div class="right">
      <p style="color: #1F0D40; text-align: center; font-size: 200%">At Picturehouse 441, we want to connect audiences more closely and personally with the films they love.
        Through our exclusive live virtual Q&As, film lovers can dig deeper into some of the greatest films of all time with
        the top filmmakers, actors, and artists who created them.</p>
    </div>
  </div>
</section>

<section class="products section bg-gray" style="background-color: #fff4e9; border-bottom: 1px solid #dedede;">

  <h1 style="text-align: center" class="testheader">Upcoming Discussions</h1>
  <h3 style="text-align: center; color: #1F0D40">A taste of what we have in store.</h3>
  <br>

  <div class="container">
    <div class="row">
    </div>
    <div class="row">
      <div class="col-md-4">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/up_poster.jpeg" width="336px" height="500px" alt="product-img"/>
          </div>
          <div class="product-content">
            <h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px">Pete Docter and Jonas Rivera on UP</h3>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/meantime_poster.jpg" width="336px" height="500px" alt="product-img"/>
          </div>
          <div class="product-content">
            <h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px">Mike Leigh on MEANTIME</h3>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/the-last-picture-show.jpg" width="336px" height="500px" alt="product-img"/>
          </div>
          <div class="product-content" style="margin-top: -4px">
            <h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px; text-align: center">Cybill Shepherd on THE LAST PICTURE SHOW</h3>
          </div>
        </div>
      </div>

      <div class="col-md-2"></div>

      <div class="col-md-4">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/goodbyegirl.jpg" width="336px" height="500px" alt="product-img"/>
          </div>
          <div class="product-content">
            <h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px">Marsha Mason on THE GOODBYE GIRL</h3>
          </div>
        </div>
      </div>

      <div class="col-md-4">
        <div class="product-item">
          <div class="product-thumb">
            <img class="img-responsive" src="images/taxidriver.jpg" width="336px" height="500px" alt="product-img"/>
          </div>
          <div class="product-content" style="margin-top: -4px">
            <h3 style="background-color: #1F0D40; color: #fff1de; padding: 5px; text-align: center">Michael Phillips on TAXI DRIVER</h3>
          </div>
        </div>
      </div>

      <div class="col-md-2"></div>

    </div>
  </div>
  <div id="cf-submit" style="align-items: center; justify-content: center; display: flex; width: 100%">
    <a href="about.jsp" class="btn btn-main mt-20" >Learn More</a>
  </div>


  <section class="call-to-action bg-gray section" style="background-color: #fff4e9; color: #1F0D40; ">
    <div class="container" style="">
      <div class="row">
        <div class="col-md-12 text-center">
          <div class="col-lg-6 col-md-offset-3">
          <!--RECOLOR-->  <h1 style="text-align: center; background-color: #1F0D40; color:#fff4e9;">Be the first to hear about even more exclusive events!</h1>
            <form class="input-group subscription-form" action="subscribe" style="border: #1F0D40 1px solid">
              <input type="email" class="form-control" style="font-size: large" placeholder="Enter Your Email Address" name="email" id="email" required>
              <span class="input-group-btn">
				        <button class="btn btn-main" href="index.jsp">Subscribe Now!</button>
				      </span>
            </form><!-- /input-group -->
          </div><!-- /.col-lg-6 -->

        </div>
      </div> 		<!-- End row -->
    </div>   	<!-- End container -->
  </section>
</section>



<%@include file="footer.jsp"%>




</body>
</html>
