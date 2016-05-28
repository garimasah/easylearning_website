<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/typehead.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="shortcut icon"  type="image/x-icon" href="img/favicon.ico">
<title>Insert title here</title>
<style>
	.error-404 {
    font-size: 166px;
    line-height: 400px;
  
}
.ohh{
 font-size: 32px;
    line-height: 49px;
}
.standout{
 font-size: 21px;
}
a.more {
    background: transparent url("img/more.png") no-repeat scroll center top;
    color: #ebdccc !important;
    display: block;
    font-size: 9px;
    height: 16px;
    margin-left: auto;
    margin-right: auto;
    padding: 21px 0 23px;
    position: relative;
    text-decoration: none;
    text-transform: uppercase;
    top: 21px;
    width: 114px;
}
.searchfor{
    background: #CCCCCC none repeat scroll 0 0;
    border-radius: 100%;
    height: 108px;
     padding-top: 45px;
    text-align: center;
    width: 108px;
     margin-left: auto;
    margin-right: auto;
    color:#8D8D8D;
}
@media only screen and (min-width: 700px) {

   .border-big{
border-left: 9px solid #ddd;
    border-radius: 61px;
}
}

</style>
</head>
	<body>
		<div class="row " style="background-color: #076B90;" >
			<div class="container text-center">
			  <div class="row row-gap-lg"></div>
				<div class="row color-white searchpage">
					<div class=" col-md-6">
						<div class="error">
							<p class="error-404" >4<span><img src="img/error.png" alt="" width="158px"></span>4</p>	
							<p class="ohh">The requested page cannot be found</p>
							<p class="standout"> Return to <a href="/">Easyadmission.guru </a> homepage</p>			
						</div>
					</div>
					<div class="col-md-6">			
						<div class="row border-big color-white" >
							<div class="col-md-5 col-md-offset-5 col-sm-5 col-sm-offset-5 col-xs-12 ">
								<div><p style="font-size: 27px;">You can also try</p></div>
								<div class="row">
									<a class="more" href=""></a>
									<div class="row row-gap-lg"></div>
									<div class="searchfor">Engineering</div>
									<div class="row row-gap-sm"></div>
									<div class="searchfor">Management</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
				 <div class="row row-gap-lg"></div>
			</div>
		</div>
		<div class="row">
		  <div class="row row-gap-sm"></div>
			<div style="border-top:1px solid #ddd;">
				  <jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
		
		
		<script src="js/jquery-2.2.3.min.js"></script>
		<script src="js/bootstrap.min.js" defer="defer"></script>
		<script src="js/typeahead.bundle.min.js"></script>
		<script src="js/wow.js"></script>
		<script>
		var totalHeight=(($(window).height())-($(".searchpage").height()))/2-72;
		$(".searchpage").css("padding-top",totalHeight);
		</script>
	</body>
</html>