<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>L S M S</title>
	</head>
	
	<body>
			
	<div class="jumbotron">
<div class="container">
  <div class="row">
    <div class="span8">
      <div class="hero-content">
        <h1>Laundry Service</h1>
        <p>Management System.</p>
        	<br></br>
		
        <div class="actions">
		
          <a class="btn btn-primary btn-large" href="http://localhost:8080/laundry/Customer/create"
			<i class=""></i>
            Accept <br>Transaction</a>
			
		<a class="btn btn-large btn-github" href="http://localhost:8080/laundry/CustomPackage"
			<i class=""></i>
            Laundry Service <br>Package</a>
		
		<!-- <a class="btn btn-primary btn-large" href="http://localhost:8080/laundry/Service"
            <i class="icon-pushpin"></i>
            All-time<br>Services</a> -->
			
		</div>
		   <div class="shameless-self-promotion">
          &copy; L S M S
        </div>
      </div>
    </div>   
			
    <div class="span4">
      <div id="iconCarousel" class="carousel slide">
        <!-- Carousel items -->
		
        <div class="carousel-inner">
          <div class="active item"><div><img src="img/fold.png" alt="" /></div></div>
		  <div class="item"><div><img src="img/wash.png" alt="" /></div></div>
          <div class="item"><div><img src="img/dry.png" alt="" /></div></div>
		  <div class="item"><div><img src="img/washfoldpress.png" alt="" /></div></div>
		  <div class="item"><div><img src="img/washfolddry.png" alt="" /></div></div>
        </div>
		
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#iconCarousel" data-slide="prev"
           onClick="_gaq.push(['_trackEvent', 'iconCarousel', 'Prev']);">
          <i class="icon-arrow-left"></i></a>
        <a class="carousel-control right" href="#iconCarousel" data-slide="next"
           onClick="_gaq.push(['_trackEvent', 'iconCarousel', 'Next']);">
          <i class="icon-arrow-right"></i></a>
      </div>
    </div>
  </div>

</div>
</div>

<br></br>

<div class ="container">
<div class="row-fluid">
            <ul class="thumbnails">
              <li class="span4">
			  
                <div class="thumbnail">
                  <img src="img/laundrywash.png" alt="">
                  <div class="caption">
                    <h3>Wash</h3>
                    <!-- <p><b>Price:</b> 30 php per Kl.</p> -->
                    <a href="http://localhost:8080/laundry/customPackage/show/8" class="btn btn-primary">Details &raquo;</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
			  
                <div class="thumbnail">
                  <img src="img/laundryfold.png" alt="">
                  <div class="caption">
                    <h3>Wash Fold Dry</h3>
                    <!-- <p><b>Price:</b> 50 php per Kl.</p> -->
                    <a href="http://localhost:8080/laundry/customPackage/show/5" class="btn btn-primary">Details &raquo;</a></p>
                  </div>
                </div>
              </li>
              <li class="span4">
			  
                <div class="thumbnail">
                  <img src="img/laundrypress.png" alt="">
                  <div class="caption">
                    <h3>Wash Press Dry</h3>
                     <!-- <p><b>Price:</b> 50 php per Kl.</p> -->
                    <a href="http://localhost:8080/laundry/customPackage/show/6" class="btn btn-primary">Details &raquo;</a></p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
		 </div>
		  
<!-- js for carousel -->

<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/underscore.min.js"></script>
<script src="js/backbone.min.js"></script>
<script src="js/prettify.min.js"></script>
<script src="js/bootstrap-222.min.js"></script>
<script src="js/index/index.js"></script>
 
	</body>
</html>
