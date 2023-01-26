<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>PH441 | Login</title>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="images/smalllogo2.jpg" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Animate css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick/slick-theme.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">

</head>

<body id="body" style="background-color: #fdf4eb">

<section class="signin-page account" style="background-color: #fdf3e7; color: #fdf3e7">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3" style="color: #0f1a3a">
        <div class="block text-center" style="background-color: #fdf3e7">
          <a class="logo" href="index.jsp">
            <img src="images/PH441_Full_Logo_Final.jpeg" width="100%" alt="">
          </a>
          <h2 class="text-center">Welcome Back</h2>
          <form class="text-left clearfix" action="adminUser_servlet" method="post" >
            <div class="form-group">
              <input type="text" class="form-control" name="uname" placeholder="Username">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" name="upwd" placeholder="Password">
            </div>
            <p style="text-align: center">${invalidlogin}</p>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center" style="background-color: #122558">Login</button>
            </div>
          </form>
            <br>
            <p><a href="forgotPassword.jsp"> Forgot your password?</a></p>

        </div>
      </div>
    </div>
  </div>
</section>



  </body>
<script type="text/javascript">

    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                uname: {
                    required: true,
                    uname: true
                },

                upwd: "required",
            },

            messages: {
                uname: {
                    required: "Please enter username",
                    uname: "Please enter a valid username"
                },

                upwd: "Please enter password"
            }
        });

    });
</script>
  </html>