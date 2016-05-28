<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="getData.Action"%>
<%
String data=new Action().getAllColleges();
// String ipaddress = request.getHeader("X-FORWARDED-FOR");   // proxy
// if(ipaddress==null)
// {
//     ipaddress = request.getRemoteAddr();
// }
// String cookieId=(String)session.getAttribute("cookieId");
// if(cookieId==null){
// 	Cookie[] cookies = request.getCookies();
// 	if (cookies != null) {
// 		for (Cookie cookie : cookies) {
// 			cookie.setPath("/");
//  			if (cookie.getName().equals("Easyadmission")) {
//  				cookieId=cookie.getValue();
// 				session.setAttribute("cookieId",cookieId);
// 			}
// 		}
// 	}
// 	if(cookieId==null)
// 	{
// 		int cookie_id=new Action().setCookie(ipaddress, request.getRequestURI());
// 		String cookievalue="Easyadmission"+cookie_id;
// 		session.setAttribute("cookieId", cookievalue);
// 		Cookie cc=new Cookie("Easyadmission",cookievalue);
//  	    cc.setMaxAge(30*24*60*60);
//  		cc.setPath("/");
// 	}
// }else
// {
// 	new Action().updateCookie(ipaddress, cookieId, request.getRequestURI());
// }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Easyadmission.guru</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/typehead.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="shortcut icon"  type="image/x-icon" href="img/favicon.ico">
</head>
<body style="background: url('img/easy_header.jpg')no-repeat fixed;">
<video autoplay  poster="img/video-img.jpg" id="bgvid" loop>
  <!-- WCAG general accessibility recommendation is that media such as background video play through only once. Loop turned on for the purposes of illustration; if removed, the end of the video will fade in the same way created by pressing the "Pause" button  -->
<source src="" type="video/webm">
<source src="img/edmin_video.mp4" type="video/mp4">
</video>
<section class="section searchpage">
	<div class="container">
        <div class="row row-gap-xs">
	        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 text-center">
	        	<div class="row-gap-sm">
	        		<img class="img-center img-responsive" src="img/easyadmission-logo.png" alt="Easyadmission.guru Logo" title="Easyadmission.guru">
	        	</div>
	        	<div class="input-group row-gap-xs searchInputBox text-left input-group-lg">
					<input type="text" id="searchBox" name="searchBox"  placeholder="Search..." class="form-control input-lg">
					<span class="input-group-addon btn btn-danger btn-search">
                    	<strong>Submit</strong>
					</span>
	        	</div>
	        	<div class="row text-center" style="padding:12px;">
	        		<h3>Search from our <strong>4000+</strong> colleges</h3>
	        	</div>
			</div>
	    </div>
	    
	</div>
</section>
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 text-center row-gap-lg">
				<div class="row-gap-lg row text-center">
	        		<h1> Explore your fields</h1>
	        		<i class="fa fa-angle-double-down fa-4x collegeanimation wow fadeInDown" data-wow-iteration="infinite" aria-hidden="true" style="cursor: pointer;"></i>
	        	</div>	        	
			</div>
			
		</div>
	</div>
	<div class="container row-gap-lg "  id="explore">
		<div class="row-gap-lg row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-6 col-md-offset-3 col-sm-7 col-sm-offset-3 sol-xs-12 row-gap-lg row-gap-bottom">
					<div class="col-md-6 text-center wow bounceInLeft ">
						<div class="col-md-12 text-center background-light" style="padding: 15px; border: 1px solid #ddd;">
							<a href="courses/b-tech/list-of-colleges" target="_blank"><img src="img/b-tech.png" alt="B.Tech" width="100%"><hr> <h3>B.Tech</h3></a>
						</div>						
					</div>	
					<div class="col-md-6 text-center wow bounceInRight"  data-wow-delay="1s" >
						<div class="col-md-12 text-center background-light" style="padding: 15px; border: 1px solid #ddd;">
							<a href="courses/m-tech/list-of-colleges" target="_blank"><img src="img/m-tech.png" alt="M.Tech" width="100%"><hr> <h3>M.Tech</h3></a>
						</div>					
					</div>													
				</div>	
	       	</div>  	
		</div>       	   
	</div>
</section>
   <jsp:include page="footer.jsp"></jsp:include>
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/bootstrap.min.js" defer="defer"></script>
<script src="js/typeahead.bundle.min.js"></script>
<script src="js/wow.js"></script>
<script type="text/javascript">
var collegeName=<%=data%>;
var formSubmit=function(search){
	var search_url=(((search).toLowerCase()).replace(/\s/g,"-"));
	var searchURL=(((search_url).toLowerCase()).replace(/,/g,"")).trim();
	location.href="/college/"+searchURL;
}
$(document).keypress(function(e){
	if(e.keyCode==13){
		var searchBox=$("#searchBox").val();
		if(collegeName.indexOf(searchBox)!=-1)
			formSubmit(searchBox.trim());
			
	}
})
$(".btn-search").click(function(){
	var searchBox=$("#searchBox").val();
	if(collegeName.indexOf(searchBox)!=-1)
		formSubmit(searchBox.trim());
})
$(document).ready(function(){
	var totalHeight=($(window).height()/2)-($(".searchpage").height());
	$(".searchpage").css("margin-top",totalHeight);
	
	//animation script
	  $('.collegeanimation').on('click',function(){
          $('html, body').animate({scrollTop: $("#explore").offset().top}, 1000);
         
          //wow.init();
      });
	  
	var substringMatcher = function(strs) {
		  return function findMatches(q, cb) {
		    var matches, substringRegex;
		    matches = [];
		    substrRegex = new RegExp("^"+q, 'i');
		    $.each(strs, function(i, str) {
		      if (substrRegex.test(str)) {
		        matches.push(str);
		      }
		    });
		    cb(matches);
		  };
		};

		$('#searchBox').typeahead({
		  hint: true,
		  highlight: true,
		  minLength: 1
		},
		{
		  name: 'collegeName',
		  source: substringMatcher(collegeName)
		});
	});
	$("#searchBox").keypress(function(e){
		if(e.keyCode==13){
			var searchBox=$("#searchBox").val();
			if(collegeName.indexOf(searchBox)!=-1)
				formSubmit(searchBox.trim());
				
		}
	})
	
	//use wow animation
	wow = new WOW({
		boxClass: 'wow',
		animateClass:'animated'
	});	
	wow.init();
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-78075347-1', 'auto', {'allowLinker': true});
  ga('require', 'linker');
  ga('linker:autoLink', ['easyadmission.guru', 'engineering.easyadmission.guru'] ); 
  ga('send', 'pageview');

</script>
</body>
</html>