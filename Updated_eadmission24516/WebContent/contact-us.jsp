<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<style>
	#gmap_canvas img{max-width:none!important;background:none!important}
	.modal-backdrop{
		background: rgba(255,255,255,0.90) !important;
	}
	.fa-refresh{
		font-size: 10em;
	}
</style>
<script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>
</head>
<body data-ng-app="easyAdmission" id="contact">
<header class="header-section">
    <div class="container">
        <div class="row">
			<div class="col-xs-12 text-right">
				<a class="navbar-brand" href="#">
       				<img alt="Easyadmission.guru Logo" title="Easyadmission.guru" src="/img/easyadmission-logo.png">
     				</a>
            </div>
        </div>
    </div>
</header>
	<section>
		<div class="container">
			<div class="row row-gap-huge"></div>
			<div class="row">
				<div class="col-md-12">
					<h1>Contact Us</h1>
					<div class="row">
						<div class="col-md-7 col-sm-7 col-xs-12">
							<p><strong>Address -</strong></p>
							<p>First Floor, Plot No-97, Sector-44, Gurgaon Haryana - 122002.
							</p>
							<div style="height:400px;width:523px;;border:1px solid #000;border:1px solid #ddd;">
							
								<div style='overflow:hidden;height:400px;width:520px;'><div id='gmap_canvas' style='height:400px;width:520px;'></div>
								</div> <a href='https://www.add-map.net/'>add bing map to website</a> <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=038019715d8693d7efdf2f104d8cb5aba66960fc'></script><script type='text/javascript'>function init_map(){var myOptions = {zoom:12,center:new google.maps.LatLng(28.4677344,77.01279509999995),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(28.4677344,77.01279509999995)});infowindow = new google.maps.InfoWindow({content:'<strong>Company Address</strong><br>First Floor, Plot No-97, Sector-44, Gurgaon Haryana - 122002. <br>122003 Gurgaon<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>
							</div>
						</div>
						<div class=" col-md-5 col-sm-5 col-xs-12" style=" border-left: 1px solid rgb(220, 220, 220);">
							<div class="row">
								<div class="col-lg-10 col-md-10 col-md-offset-1 " style="border:1px solid #ddd;padding:25px">
									<h3 class="text-center">Contact Us</h3>
									<form class="form-horizontal" name="contactForm" data-ng-controller="contactForm" id="contactForm" novalidate data-ng-submit="submitForm()">
										<fieldset data-ng-disabled="contactDisabled" id=contact-Disabled>
											<div class="form-group">
												<label for="name">Name</label>
												<input type="text" class="form-control" id="name" name="name" placeholder="Full Name *" data-ng-model="name" required>
												<span style="color:red" data-ng-show="contactForm.name.$dirty && contactForm.name.$invalid || contactForm.name.$touched ">
		  												<span data-ng-show="contactForm.name.$error.required">Name is required.</span>
												</span>
											</div>
											<div class="form-group">
												<label for="email">Email address</label>
												<input type="email" class="form-control" name="email" placeholder="Email Id *" data-ng-model="email" id="email" required data-ng-pattern="emailValidation">
												<span style="color:red" data-ng-show="contactForm.email.$dirty && contactForm.email.$invalid || contactForm.email.$touched">
		                                                <span data-ng-show="contactForm.email.$error.required">Email is required.</span>
		                                                <span data-ng-show="contactForm.email.$error.email || contactForm.email.$error.pattern">Invalid email address.</span>
		                                             </span>
											</div>
											<div class="form-group">
												<label for="phone">Phone Number</label>
												<input type="tel" class="form-control" name="phone" id="phone" placeholder="Phone Number" data-ng-model="phone" data-phone-validate="phone" required>
												<span style="color:red" data-ng-show="contactForm.phone.$dirty && contactForm.phone.$invalid || contactForm.phone.$touched || contactForm.phone.$error.phoneInvalidate">
		  												<span data-ng-show="contactForm.phone.$error.required && !invalidPhone">Phone Number is required.</span>
		  												<span data-ng-show="contactForm.phone.$error.phoneInvalidate">Invalid Phone Number.</span>
		                                      		</span>
											</div>
											<div class="form-group">
												<label for="questions">Question / Feedback</label>
												<textarea class="form-control" id="questions" placeholder="Enter you questions" name="questions"></textarea>
											</div>
											<div class="form-group text-center">
												<input class="btn btn-warning text-center h3" type="submit" data-ng-disabled="contactForm.name.$dirty && contactForm.name.$invalid || contactForm.phone.$dirty && contactForm.phone.$invalid || contactForm.email.$dirty && contactForm.email.$invalid || contactForm.phone.$dirty.phoneInvalidate || contactForm.course.$dirty && contactForm.course.$invalid || contactForm.$invalid" data-ng-model="submit" value="Submit" style="width:100%;height:40px;font-size:20px">
												<input type="hidden" name="jEventName" value="contact">
											
											</div>
										</fieldset>													
									</form>
									<div id="contactSubmit">
										<p>Your Request has been recorded. Our support team will contact you soon...</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
   	</section>
	<footer>
		<jsp:include page="footer.jsp" ></jsp:include>
		<div class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog text-center" style="top: 30%">
				<i aria-hidden="true" class="fa fa-refresh fa-spin fa-5x fa-fw"></i>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</footer>

	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/angular.min.js"></script>
<script>
$(".modal").modal({
	"backdrop":'static',
});
var app = angular.module('easyAdmission', []);
app.directive('phoneValidate', [function () {
    return {
      require: 'ngModel',
      link: function (scope, elem, attrs, ctrl) {
        var phoneNumber = '#' + attrs.phoneValidate;
        elem.add(phoneNumber).on('keyup', function () {
          scope.$apply(function () {
            var v = !isNaN(elem.val());
            ctrl.$setValidity('phoneInvalidate', v);
          });
        });
      }
    }
}]);
app.controller('contactForm', function($scope) {
	$("#contactSubmit").hide();
	$(".modal").modal("hide");
		$scope.emailValidation=/^([a-zA-Z0-9_\.\-~!#$%\^&*`])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		$scope.invalidPhone=false;
		$scope.contactDisabled=false;
	      $scope.submitForm = function() {
	    		$(".modal").modal({
	    			"backdrop":'static',
	    		});
   		   	$("#records_table").addClass("ihh");
   		 var x=$('#contactForm').serialize();
	 		$scope.contactDisabled=true;
	  		$.post("ContactUs",x,
		        function(data){
	  			$(".modal").modal("hide");
	   		   	$("#records_table").removeClass("ihh");
	   		 	$("#contactForm").hide();
	   		 	$("#contactSubmit").show();
			});
	      };
		});
</script>
</body>
</html>