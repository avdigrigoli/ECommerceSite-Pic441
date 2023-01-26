<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Forgot Password</title>

    <%@include file="head.jsp"%>

</head>

<body id="body" style="background-color: #fdf4eb">

<section class="forget-password-page account" style="background-color: #fdf4eb">
  <div class="container" style="background-color: #fdf4eb">
    <div class="row" style="background-color: #fdf4eb">
      <div class="col-md-6 col-md-offset-3" style="background-color: #fdf4eb">
        <div class="block text-center" style="background-color: #fdf4eb">
          <a class="logo" href="index.jsp">
            <img src="images/biglogo1.jpg" width="100%" alt="">
          </a>
          <h2 class="text-center" style="color: #1F0D40">Enter One Time Password</h2>
          <form class="text-left clearfix" id="register-form" action="ValidateOtp" role="form" autocomplete="off" method="post">
            <p style="text-align: center; color: #1F0D40">Please enter your one time password to be redirected to reset your password.</p>
            <div class="form-group">
              <input type="text" class="form-control" id="otp" name="otp" pattern="\d*" maxlength="6" placeholder="Enter One Time Password" required>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center" style="background-color: #1F0D40">Reset Password</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>


  </body>
  </html>