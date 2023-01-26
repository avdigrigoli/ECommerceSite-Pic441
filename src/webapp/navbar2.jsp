<%@ page import="com.picturehouse.picturehouse441.models.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.picturehouse.picturehouse441.daos.*" %>
<%@ page import="com.picturehouse.picturehouse441.Utils" %>
<%
  DecimalFormat dcf2 = new DecimalFormat("#.##");
  request.setAttribute("dcf", dcf2);
  ArrayList<cartModel> cart_list2 = (ArrayList<cartModel>) session.getAttribute("cart-list");
  List<cartModel> cartProduct2 = null;
  if (cart_list2 != null) {
    eventDao pDao = new eventDao(Utils.getConnection());
    cartProduct2 = pDao.getCartProducts(cart_list2);
    double total = pDao.getTotalCartPrice(cart_list2);
    if(!String.valueOf(request.getSession().getAttribute("promo")).equals("NYUSTU")) {
      request.setAttribute("subtotal", total);
      request.setAttribute("deduction", "");
      request.setAttribute("total", total);
    }
    else {
      request.setAttribute("subtotal", total);
      request.setAttribute("deduction", cart_list2.size()*2);
      request.setAttribute("total", cart_list2.size() * 4);
    }
    request.setAttribute("cart_list2", cart_list2);
  }
%>
<section class="top-header" style="background-color: #fff4e9">

  <div class="container">
    <div class="row">
      <%
        adminUser user2 = (adminUser) session.getAttribute("user2");
        if(user2 != null)
        {
      %>
      <div class="col-md-2 col-xs-12 col-sm-3">
        <div class="contact-number">
          <span style="color: #1F0D40; font-size: 3vh"><a href="logout">Logout</a></span>
        </div>
      </div>
      <%}
      else
      {

      %>
      <div class="col-md-2 col-xs-12 col-sm-3">
        <div class="contact-number">
          <span style="color: #1F0D40; font-size: 3vh"><a href="contact.jsp">Contact Us</a></span>
        </div>
      </div>
      <%}%>
      <div class="col-md-8 col-xs-12 col-sm-6">
        <!-- Site Logo -->
        <div class="logo text-center">
          <a href="index.jsp">
            <!-- replace logo here -->
            <img src="images/PH441_Full_Logo_Final.jpeg" width="100%">
          </a>
        </div>
      </div>
      <div class="col-md-2 col-xs-12 col-sm-3">
        <!-- cartModel -->
        <ul class="top-menu text-center list-inline">
          <li class="dropdown cart-nav dropdown-slide">
            <a href="checkout.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" style="color: #1F0D40; font-size: 3vh">Cart</a>
            <div class="dropdown-menu cart-dropdown" style="text-align: center; align-items: center; justify-content: center">
              <a href="checkout.jsp" style="text-align:center; border-color: #1F0D40; .hover{background-color: #1F0D40};" class="btn btn-small btn-solid-border">Checkout</a>
              <br>
              <br>
              <%
                if (cart_list2 != null) {
                  for (cartModel c : cartProduct2) {
              %>
              <ul class="summary-prices" style="background-color: white; border: lightgray 1px solid">
                <br>
                <div class="media product-card">
                  <img style="margin-left: auto; margin-right: auto" class="media-object" src="create_event_image.jsp?id=<%=c.getId()%>" alt="<%=c.getId()%>" />
                  <div class="media-body">
                    <h4 class="media-heading" style="padding-top: 10px; text-align: center"><a><%=c.getName()%></a></h4>
                    <p class="price" style="text-align: center">$<%=dcf2.format(c.getPrice())%></p>
                  </div>
                </div>
              </ul>
              <%}}%>
            </div>

          </li>
<!-- / cartModel -->

        </ul><!-- / .nav .navbar-nav .navbar-right -->
      </div>

    </div>
  </div>
</section><!-- End Top Header Bar -->


<!-- Main Menu Section -->
<section class="menu" style="background-color: #fff4e9">
  <nav class="navbar navigation">
    <div class="container">
      <div class="navbar-header" style="text-align: right; justify-content: right">
        <h1 class="menu-title" style="color: #1F0D40">Main Menu</h1>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar" style="color: #1F0D40"></span>
          <span class="icon-bar" style="color: #1F0D40"></span>
          <span class="icon-bar" style="color: #1F0D40"></span>
        </button>

      </div><!-- / .navbar-header -->

      <!-- Navbar Links -->
      <div id="navbar" class="navbar-collapse collapse text-center">
        <ul class="nav navbar-nav">


          <!-- Home -->
          <li class="dropdown ">
            <a href="index.jsp" style="color: #1F0D40; font-size: 3vh">Home</a>
          </li>
          <!-- / Home -->

          <li class="dropdown ">
            <a href="about.jsp" style="color: #1F0D40; font-size: 3vh">About Us</a>
          </li>

          <li class="dropdown ">
            <a href="memberships.jsp" style="color: #1F0D40; font-size: 3vh">Memberships</a>
          </li>

          <li class="dropdown dropdown-slide">
            <a style="color: #1F0D40; font-size: 3vh" href="shop.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
               role="button" aria-haspopup="true" aria-expanded="false">Events</a>
            <ul class="dropdown-menu" style="z-index: 999;">
              <li><a href="shop.jsp" style="font-size: 3vh">Events</a></li>
              <li><a href="schedule.jsp" style="font-size: 3vh">Calendar</a></li>
            </ul>
          </li>


          <li class="dropdown dropdown-slide">
            <a style="color: #1F0D40; font-size: 3vh" href="redeem.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
               role="button" aria-haspopup="true" aria-expanded="false">Redeem</a>
            <ul class="dropdown-menu" style="z-index: 999;">
              <li><a href="redeem.jsp" style="font-size: 3vh">Join an Event</a></li>
              <li><a href="questions.jsp" style="font-size: 3vh">Ask A Question</a></li>
            </ul>
          </li>

          <li class="dropdown ">
            <a href="faq.jsp" style="color: #1F0D40; font-size: 3vh">FAQ</a>
          </li>

          <!-- / Blog -->
        </ul><!-- / .nav .navbar-nav -->

      </div>
      <!--/.navbar-collapse -->
    </div><!-- / .container -->
  </nav>
</section>

<style>
  h4{
    color: #1F0D40;
  }

  .btn-main{
    text-align: center; color: #1F0D40; background-color: #fc9160; font-size: 3vh;
    font-family: "acumin-pro-condensed", sans-serif;
    font-weight: 600;
  }

  .btn-main:hover{
    text-align: center; color: #f6eee3; background-color: #415696; font-size: 3vh;
    font-family: "acumin-pro-condensed", sans-serif;
    font-weight: 600;

  }
</style>

