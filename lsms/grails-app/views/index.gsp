<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>L S M S</title>
	</head>
	<body>
	
	<div class="container">

      <!--  Carousel -->
      <!--  consult Bootstrap docs at 
            http://twitter.github.com/bootstrap/javascript.html#carousel -->
      <div id="this-carousel-id" class="carousel slide">
        <div class="carousel-inner">
          <div class="item active">
           <img src="img/custom1.png" alt="" />
            <div class="carousel-caption">
              <p>Laundry Service Management System</p>
              <p><a href="http://localhost:8080/lsms/#">Home &raquo;</a></p>
            </div>
          </div>
          <div class="item">
              <img src="img/custom2.png" alt="" />
            <div class="carousel-caption">
              <p>Wash</p>
              <p><a href="">Laundry Services &raquo;</a></p>
            </div>
          </div>
          <div class="item">
              <img src="img/custom3.png" alt="" />
            <div class="carousel-caption">
              <p>Dry</p>
              <p><a href="">Dry Cleaning Services &raquo;</a></p>
            </div>
          </div>
          <div class="item">
              <img src="img/custom4.png" alt="" />
            <div class="carousel-caption">
              <p>Fold</p>
              <p><a href="">Fold Services &raquo;</a></p>
            </div>
          </div>
        </div><!-- .carousel-inner -->
        <!--  next and previous controls here
              href values must reference the id for this carousel -->
          <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
          <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
      </div><!-- .carousel -->
      <!-- end carousel -->

      <!-- Example row of columns -->
      <!-- <div class="row">
        <div class="span4">
          <h2>Sales Management</h2>
           <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn" href="http://localhost:8080/lsms/sales">View details &raquo;</a></p>
        </div>
        <div class="span4">
          <h2>Inventory Management</h2>
           <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn" href="http://localhost:8080/lsms/inventory">View details &raquo;</a></p>
       </div>
        <div class="span4">
          <h2>Customer Management</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn" href="http://localhost:8080/lsms/customer">View details &raquo;</a></p>
        </div>
      </div> -->

      <hr>

      <footer>
        <p>&copy; LSMS</a></p>
      </footer>

<!-- Javascript -->

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.7.2.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js"></script>

<script>
  $(document).ready(function(){
    $('.carousel').carousel({
      interval: 3000
    });
  });
</script>
	
 
	</body>
</html>
