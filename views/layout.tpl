%from bottle import request

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{{'Home' if not defined('title') else title}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="John Curran">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->    
    <link href="/static/bootstrap/themes/cerulean.bootstrap.min.css" rel="stylesheet">
    <link href="/static/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="/static/bootstrap/css/bootswatch.css" rel="stylesheet">
    <link href="/static/main.css" rel="stylesheet">

  </head>

  <body id="top" data-spy="scroll" data-target=".subnav" data-offset="10">
      <!-- Navbar
        ================================================== -->
     <div class="navbar navbar-fixed-top">
       <div class="navbar-inner">
         <div class="container">
           <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
           </a>
           <a class="brand" href="/">Home</a>
           <div class="nav-collapse collapse" id="main-menu">
            <ul class="nav" id="main-menu-left">
              <!-- <li><a href='/about'>How It Works</a></li>
              <li><a id="swatch-link" href="/contact">Contact Us</a></li> -->
            </ul>
           </div>

         </div>
       </div>
     </div>

<div style="clear:both"></div>
<br />
<div class="container">

    %if request.path == "/home":
      <!-- Masthead-->
      <header class="jumbotron subhead content" id="overview">
        <div class="row">
          <div class="span6">
            <h1><strong>Website Home</strong></h1>
            <p class="lead">Subtitle</p>
          </div>
        </div>
      </header>
    %end

    <div class="content">
      %include
    </div>


    <!-- Footer -->
    <div style="clear:both"></div>
    <br /><br /><br /><br /><br />
    <hr>
    <footer id="footer">
      <a class="pull-left" href="/disclaimer">Disclaimer</a>
      <p class="pull-right"><a href="#top">Back to top</a></p>       
    </footer>


</div><!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/jquery/js/jquery-1.10.2.min.js"></script>
    <script src="/static/jquery/js/jquery.form.min.js"></script>
    <script src="/static/jquery/js/jquery.smooth-scroll.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/bootstrap/js/bootswatch.js"></script>

    %if defined('scripts'):
     %scripts()
    %end

  </body>
</html>
