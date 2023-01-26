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

<section class="signin-page account" style="background-color: #fdf4eb">
  <div class="container" style="background-color: #fdf4eb">
    <div class="row" style="background-color: #fdf4eb">
      <div class="col-md-6 col-md-offset-3" style="background-color: #fdf4eb">
        <div class="block text-center" style="background-color: #fdf4eb">
          <a class="logo" href="index.jsp">
            <img src="images/biglogo1.jpg" width="100%" alt="">
          </a>
          <h2 class="text-center">Reset Password</h2>
          <form class="text-left clearfix" action="newPassword" method="post">
            <div class="form-group">
              <input type="password" class="form-control" name="password" placeholder="New Password" required>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" name="confPassword" placeholder="Confirm Password" required>
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