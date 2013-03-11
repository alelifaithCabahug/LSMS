<div class="navbar navbar-inverse">
	<div class="navbar-inner">
	
    	<div class="container" >
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
        	<a class="brand" href="${createLink(uri: '/')}">L S M S</a>
        	<div class="nav-collapse">
          		<ul class="nav">
            		<li class="active"><a href="${createLink(uri: '/')}">Home</a></li>
					
					<li class="dropdown">
	              	  	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Add Person <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${createLink(action: 'create', controller: 'crew' )}">Crew</a></li>
							<li class="divider"></li>
							<li><a href="${createLink(action: 'create', controller: 'customer' )}">Customer</a></li>
						</ul>
            		</li>
					
            		<li class="dropdown">
	              	  	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Sales Reports <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${createLink(action: 'list', controller: 'sales' )}">Daily</a></li>
							<li class="divider"></li>
							<li><a href="${createLink(action: 'list', controller: 'sales' )}">Weekly</a></li>
							<li class="divider"></li>
							<li><a href="${createLink(action: 'list', controller: 'sales' )}">Monthly</a></li>
						</ul>
            		</li>
					<li class="active"><a href="http://localhost:8080/lsms/resources/list">Inventory</a></li>
					<li class="active"><a href="http://localhost:8080/lsms/crew/list">Crew</a></li>
					<li class="active"><a href="http://localhost:8080/lsms/customer/list">Customer</a></li>
					<li class="active"><a href="http://localhost:8080/lsms/CustomPackage/list">Custom Package</a></li>
					
					<!---MODAL--->
					
					<!-- <li><a data-toggle="modal" href="#my-customer-modal" >Customer</a></li> -->
					<!-- <li><a data-toggle="modal" href="#my-modal" >Add Crew</a></li> -->
					
				</ul>
				<form class="navbar-search pull-right" action="">
					<span class="add-on"><i class="icon-search"></i></span>
					<input type="text" class="search-query span2" placeholder="Search">
				</form>
			</div><!-- /.nav-collapse -->
		</div>
	</div><!-- /navbar-inner -->
</div>
