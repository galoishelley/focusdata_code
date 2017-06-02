<?php
include_once 'classes/Language/language.common.php';
?>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>forgot password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your keywords">
    <meta name="author" content="Your name">
    <meta name="format-detection" content="telephone=no" />
    <!--CSS-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- dialog -->
    <link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="fonts/font-awesome.css">
    <!--User CSS-->
    <link rel="stylesheet" href="css/user.css">
    <link rel="stylesheet" href="css/focusdata.css">
    <!--JS-->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/jquery.mobilemenu.js"></script>
    <script src="js/jquery.equalheights.js"></script>
    <script src="js/jquery.ui.totop.js"></script>

  </head>

  <body>
    <!--header-->
    <div class="container bars"><div></div></div>
    <?php
include_once 'classes/Menu/menu.php';
?>
      <header>

        <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
      </header>

      <!--content-->
      <div class="content forgotpwd">
        <div class="stellar-section">
          <div class="thumb-box9" data-stellar-background-ratio="0.1">
            <div class="container">
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <h2 class="wow fadeInRight">
                    <!-- Forgot Password-->
                    <?php echo $lang['Lang0183']; ?>
                  </h2>
                  <form class="form-horizontal wow fadeInRight" data-wow-delay="0.5s" role="form">
                    <fieldset>

                      <div class="form-group">
                        <label for="EMAIL" class="col-sm-2 control-label"><!-- E-mail--><?php echo $lang['Lang0189']; ?><span class="span-red">*</span></label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="EMAIL" name="EMAIL">
                        </div>
                      </div>
                      





                      <div class="row">
                        <div class="form-group pull-right send_email">
                          <button type="submit" class="btn btn-lg btn-primary btn-block" id="send_email"><!-- 发送密码到邮箱--><?php echo $lang['Lang0190']; ?></button>
                        </div>
                      </div>

                      <div class="row">
                        <div class="form-group pull-right">
                          <a href="sign_in.php"><strong><!-- sign in--><?php echo $lang['Lang0191']; ?></strong></a>
                          <!-- <div class="pull-right">sign in</div> -->
                        </div>
                      </div>
                    </fieldset>
                  </form>
                </div>
              </div>
            </div>
            <!-- container -->
          </div>
        </div>
      </div>
      <!--footer-->
      <?php
include_once 'classes/Footer/Footer.php';
?>
        <?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>
          <script src="js/bootstrap.min.js"></script>
          <!-- dialog -->
          <script src="js/bootstrap-dialog.min.js"></script>
          <script src="js/tm-scripts.js"></script>
          <script src="js/jquery.cookie.js"></script>
          <script src="js/main/pub.js"></script>
          <script src="js/main/forgotpwd.js"></script>

  </html>