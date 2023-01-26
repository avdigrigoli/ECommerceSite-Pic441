<section class="top-header" style="background-color: #fdf4eb">
    <div class="container">
        <div class="row">
            <%
                adminUser user2 = (adminUser) session.getAttribute("user2");
                if(user2 != null)
                {
            %>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <div class="contact-number">
                    <i class="tf-ion-ios-locked" style="color: #122558"></i>
                    <span style="color: #122558"><a href="logout">Logout</a></span>
                </div>
            </div>
            <%}
                else
                {

                %>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <div class="contact-number">
                    <span style="color: #122558">917- 123-1234</span>
                </div>
            </div>
            <%}%>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Site Logo -->
                <div class="logo text-center">
                    <a href="index.jsp">
                        <!-- replace logo here -->
                        <img src="images/biglogo1.jpg" width="100%">
                    </a>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- cartModel -->
                <ul class="top-menu text-right list-inline">
                    <li class="dropdown cart-nav dropdown-slide">
                        <a href="cart.jsp" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" style="color: #122558"><i
                                class="tf-ion-android-cart" style="color: #122558"></i>Cart</a>
                        <div class="dropdown-menu cart-dropdown">

                            <ul class="text-center cart-buttons">
                                <li><a href="cart.jsp" style="background-color: #1F0D40" class="btn btn-small">View Cart</a></li>
                                <li><a href="checkout.jsp" style="border-color: #1F0D40; .hover{background-color: #1F0D40}" class="btn btn-small btn-solid-border">Checkout</a></li>
                            </ul>
                        </div>

                    </li><!-- / cartModel -->

                </ul><!-- / .nav .navbar-nav .navbar-right -->
            </div>
        </div>
    </div>
</section><!-- End Top Header Bar -->


<!-- Main Menu Section -->
<section class="menu" style="background-color: #fdf4eb">
    <nav class="navbar navigation">
        <div class="container">
            <div class="navbar-header">
                <h2 class="menu-title">Main Menu</h2>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div><!-- / .navbar-header -->

            <!-- Navbar Links -->
            <div id="navbar" class="navbar-collapse collapse text-center">
                <ul class="nav navbar-nav">

                    <!-- Home -->
                    <li class="dropdown ">
                        <a href="index.jsp" style="color: #122558">Home</a>
                    </li>
                    <!-- / Home -->

                    <li class="dropdown ">
                        <a href="about.jsp" style="color: #122558">About</a>
                    </li>

                    <li class="dropdown ">
                        <a href="shop.jsp" style="color: #122558">Shop</a>
                    </li>

                    <li class="dropdown ">
                        <a href="redeem.jsp" style="color: #122558">Redeem</a>
                    </li>

                    <!--<li class="dropdown ">
                        <a href="blog.jsp" style="color: #122558">News</a>
                    </li>-->

                    <li class="dropdown ">
                        <a href="contact.jsp" style="color: #122558">Contact</a>
                    </li>



                    <!-- Pages -->
                    <li class="dropdown full-width dropdown-slide">
                        <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
                           role="button" aria-haspopup="true" aria-expanded="false">All Pages(Temporary) <span
                                class="tf-ion-ios-arrow-down"></span></a>
                        <div class="dropdown-menu">
                            <div class="row">

                                <!-- Introduction -->
                                <div class="col-sm-3 col-xs-12">
                                    <ul>
                                        <li class="dropdown-header">Main Pages</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="about.jsp">About Us</a></li>
                                        <li><a href="redeem.jsp">Redeem</a></li>
                                        <li><a href="shop.jsp">Shop</a></li>
                                        <li><a href="cart.jsp">Cart</a></li>
                                        <li><a href="empty-cart.jsp">Empty Cart</a></li>
                                        <li><a href="checkout.jsp">Checkout</a></li>
                                        <li><a href="confirmation.jsp">Confirmation</a></li>
                                        <!--<li><a href="blog.jsp">Newsletter</a></li>-->
                                        <li><a href="contact.jsp">Contact</a></li>
                                    </ul>
                                </div>

                                <!-- Contact -->
                                <div class="col-sm-3 col-xs-12">
                                    <ul>
                                        <li class="dropdown-header">Admin Pages</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="admin_interface.jsp">Admin Interface</a></li>
                                        <li><a href="add_event.jsp">Event Options</a></li>
                                        <li><a href="calendarOptions.jsp">Calendar Options</a></li>
                                        <li><a href="orderBackups.jsp">Orders</a></li>
                                        <li><a href="adminMessages.jsp">Messages</a></li>
                                        <li><a href="sendNews.jsp">Newsletter Options</a></li>
                                        <li><a href="faq.jsp">FAQ</a></li>
                                        <li><a href="privacypolicy.jsp">Privacy Policy</a></li>

                                    </ul>
                                </div>

                                <!-- Utility -->
                                <div class="col-sm-3 col-xs-12">
                                    <ul>
                                        <li class="dropdown-header">Utility Pages</li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="login.jsp">Login Page</a></li>
                                        <li><a href="forgotPassword.jsp">Forgot Password</a></li>
                                        <li><a href="EnterOtp.jsp">Forgot Password 2</a></li>
                                        <li><a href="newPassword.jsp">Forgot Password 3</a></li>
                                        <li><a href="noMatch.jsp">Reset Failed</a></li>
                                        <li><a href="404.jsp">404 Page Not Found</a></li>
                                        <li><a href="index.jsp">Coming Soon</a></li>







                                    </ul>
                                </div>
                            </div><!-- / .row -->
                        </div><!-- / .dropdown-menu -->
                    </li><!-- / Pages -->
                    <!-- / Blog -->
                </ul><!-- / .nav .navbar-nav -->

            </div>
            <!--/.navbar-collapse -->
        </div><!-- / .container -->
    </nav>
</section>