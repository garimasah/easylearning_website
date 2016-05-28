<%@page import="com.mongodb.DBCursor,com.mongodb.BasicDBObject"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="getData.CollegeList"%>
<%@page import="getData.Action"%>
<%
	String requestedURL=request.getRequestURI();
	String sorting=request.getParameter("filterType");
	if(sorting==null){
		sorting="alpha";
	}
	if(requestedURL.substring(requestedURL.lastIndexOf("/")+1).contains("list-of-top")){
		requestedURL=requestedURL.replace("list-of-top", "list-of").trim();
		sorting="pop";
	}
	if(requestedURL.contains("*") ||requestedURL.length()==(requestedURL.lastIndexOf("/")+1)){
		response.sendRedirect("list-of-colleges");
	}
	else{
		String lastUrl=requestedURL.substring(requestedURL.lastIndexOf("/")+1).trim();
		String stateUrl=null;
		String streamUrl=null;
		String ownershipUrl=null;
		if(!lastUrl.equals("list-of-colleges"))
	    {
			String subString=lastUrl.replace("list-of", "").trim();
	    	subString=subString.replace("-colleges", "").trim();
	    	if(subString.contains("-in-"))
	    	{
	    		String[] multiSearch=subString.split("-in-");
	    		stateUrl=multiSearch[1].replace("-"," ").trim();
	    		subString=multiSearch[0].replace("-"," ").trim();
	    	}
	    	else
	    		subString=subString.replace("-", " ").trim();
// 	    	Public Private Partnership
			if(subString.contains("public private partnership"))
			{
				subString=subString.replace("public private partnership", "").trim();
				ownershipUrl="Public Private Partnership";
			}
			else if(subString.contains("public"))
			{
				subString=subString.replace("public", "").trim();
				ownershipUrl="Public";
			}
	    	else if(subString.contains("private"))
	    	{
	    		subString=subString.replace("private", "").trim();
	    		ownershipUrl="Private";
	    	}
	 		else
	 			streamUrl=subString;
			if(streamUrl==null && !subString.trim().equals("")){
				streamUrl=subString;
			}
				
	    }
	    String pageCount=request.getParameter("pageNumber");
		String[] filterFacility=null;
		if(request.getParameterValues("facilities")!=null)
		{
			filterFacility=request.getParameterValues("facilities");
		}
		String[] filterStream=null;
		if(request.getParameterValues("streamList")!=null)
		{
			filterStream=request.getParameterValues("streamList");
		}
		String[] filterCourse=null;
		if(request.getParameterValues("coursesList")!=null)
		{
			filterCourse=request.getParameterValues("coursesList");
		}
		String[] filterState=null;
		if(request.getParameterValues("stateList")!=null)
		{
			filterState=request.getParameterValues("stateList");
		}
		String[] filterOwnership=null;
		if(request.getParameterValues("ownershipList")!=null)
		{
			filterOwnership=request.getParameterValues("ownershipList");
		}
		
	    int currentPageNumber=0;
	    Action ac=new Action();
	    List<CollegeList> list= new ArrayList<CollegeList>();
	    if(pageCount==null)
	    	 list=ac.getCollegeList(currentPageNumber,"btech",filterFacility,filterStream,filterCourse,filterState,filterOwnership,sorting,requestedURL.trim());
	    else{
	        list=ac.getCollegeList(Integer.parseInt(pageCount)*10,"btech",filterFacility,filterStream,filterCourse,filterOwnership,filterState,sorting,requestedURL.trim());
	        currentPageNumber=Integer.parseInt(pageCount);
	    }
	    currentPageNumber++;
	    List<String> state=list.get(0).getStates();
	    List<String> stream=list.get(0).getStream();
	    List<String> courses=list.get(0).getCourse();
	    List<String> facilities=list.get(0).getFeatures();
	    List<String> ownership=list.get(0).getOwnership();
	    String compCollege=list.get(0).getCollegeList().trim();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/font-awesome.min.css">
<link rel="stylesheet" href="../../css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="../../style.css">
<link rel="shortcut icon"  type="image/x-icon" href="../../img/favicon.ico">

<style type="text/css">
.modal-backdrop{
	background: rgba(255,255,255,0.90) !important;
}
.fa-refresh{
	font-size: 10em;
}
.tt-menu{
	background-color: #fff;
	padding: 10px;
	width: 100%;
}
.tt-menu .tt-suggestion{
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
<script src="../../js/jquery-2.2.3.min.js"></script>
</head>
<body>
	<header class="header-section b-tech-header">
	    <div class="container">
	        <div class="row">
				<div class="col-xs-12 text-right">
					<a class="navbar-brand" href="#">
	       				<img alt="Easyadmission.guru Logo" title="Easyadmission.guru" src="../../img/easyadmission-logo-home.png">
	     			</a>
	            </div>
	        </div>
	    </div>
	    <div class="row ">
	        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 row-gap-lg text-center">
	        	<div class="row" style="color:#fff;padding:10px"><span class="h1 text-center">Search Engineering Colleges</span></div>
	        	<div class="form-group row-gap-xs searchInputBox collegeSearchBox text-left input-group-lg">
					<input type="text" id="searchBox" name="searchBox"  placeholder="Search..." class="form-control input-lg">
	        	</div>
				<div class="row-gap-lg"></div>
			</div>
	    </div>
	</header>
	<section class="small-section">
	    <div class="container">
	    	<div class="row row-gap-sm">
	    		<div class="col-xs-12 course-des">
			    	<h2 style="margin-top: 0"> About Engineering</h2>
			    	<p>The individuals who are driven by science, innovation, advancement, and have the skill to make something, can take a gander at seeking after Engineering, which in itself is an awesome career choice. Here are some of the best engineering colleges/universities in India that offer B.Tech and M.Tech courses.</p>
		    	</div>
	    	</div>
	    	<div class="row row-gap-sm">
		       	<div class="col-xs-3">
		       		<h4><span>Refine Results</span><small style="float: right;"><a href="/courses/b-tech/list-of-colleges" class="text-danger">(reset all filters)</a></small></h4>
			       	<form id="searchForms" name="searchForms">
			       			<%if(!stream.isEmpty()){ %>
						<div class="col-xs-12 blockBox">
							<p class="filter-name"><strong>STREAMS</strong></p>
		                 	<div class="col-xs-12 internal-box content mCustomScrollbar">
			                 	<% for(int i=0;i<stream.size();i++){if(!stream.get(i).trim().equals("")){%>
			                  	<div class="checkbox">
			                  		<%if(streamUrl!=null){if(streamUrl.equalsIgnoreCase(stream.get(i).trim())){ %>
			                    			<label><input type="checkbox" name="streamList" value="<%=stream.get(i) %>" checked="checked"><%=stream.get(i) %></label>
			                    		<%}else{%>
			                    			<label><input type="checkbox" name="streamList" value="<%=stream.get(i) %>"><%=stream.get(i) %></label>
			                    	<%}}else if(filterStream!=null){if(Arrays.asList(filterStream).contains(stream.get(i))){ %>
				                    		<label><input type="checkbox" name="streamList" value="<%=stream.get(i) %>" checked="checked"><%=stream.get(i) %></label>
				                    	<%}else{%>
				                    		<label><input type="checkbox" name="streamList" value="<%=stream.get(i) %>"><%=stream.get(i) %></label>
				                    <%}}else{ %>
			                    		<label><input type="checkbox" name="streamList" value="<%=stream.get(i) %>"><%=stream.get(i) %></label>
			                    	<%} %>
								</div>
								<%}}%>
							</div>
						</div>
						<%}if(!courses.isEmpty()){ %>
						<div class="col-xs-12 blockBox row-gap-xs">
							<p class="filter-name"><strong>FACILITIES</strong></p>
							<div class="col-xs-12 internal-box content mCustomScrollbar">
				                  	<% for(int i=0;i<facilities.size();i++){if(!facilities.get(i).trim().equals("")){%>
		                  		<div class="checkbox">
		                  			<%if(filterFacility!=null){if(Arrays.asList(filterFacility).contains(facilities.get(i))){ %>
			                    		<label><input type="checkbox" name="facilities" value="<%=facilities.get(i) %>" checked="checked"><%=facilities.get(i) %></label>
			                    	<%}else{%>
			                    		<label><input type="checkbox" name="facilities" value="<%=facilities.get(i) %>"><%=facilities.get(i) %></label>
			                    	<%}}else{ %>
			                    		<label><input type="checkbox" name="facilities" value="<%=facilities.get(i) %>"><%=facilities.get(i) %></label>
			                    	<%} %>
								</div>
								<%}} %>
							</div>
						</div> 
		            		<%}if(!state.isEmpty()){ %>
						<div class="col-xs-12 blockBox row-gap-xs">
							<p class="filter-name"><strong>STATE</strong></p>
		                 	<div class="col-xs-12 internal-box content mCustomScrollbar">
		                 		<%for(int i=0;i<state.size();i++){if(!state.get(i).trim().equals("")){%>
		                  		<div class="checkbox">
		                  			<%if(stateUrl!=null){if(stateUrl.equalsIgnoreCase(state.get(i).trim())){ %>
			                    			<label><input type="checkbox" name="stateList" value="<%=state.get(i) %>" checked="checked"><%=state.get(i) %></label>
			                    		<%}else{%>
			                    			<label><input type="checkbox" name="stateList" value="<%=state.get(i) %>"><%=state.get(i) %></label>
			                    	<%}}else if(filterState!=null){if(Arrays.asList(filterState).contains(state.get(i))){ %>
			                    			<label><input type="checkbox" name="stateList" value="<%=state.get(i) %>" checked="checked"><%=state.get(i) %></label>
			                    		<%}else{%>
				                    		<label><input type="checkbox" name="stateList" value="<%=state.get(i) %>"><%=state.get(i) %></label>
			                    	<%}}else{ %>
			                    	<label><input type="checkbox" name="stateList" value="<%=state.get(i) %>"><%=state.get(i) %></label>
			                    	<%} %>
		                        </div>
		                        <%}}%>
							</div>
						</div>
						
							<%}if(!ownership.isEmpty()){ %>
						<div class="col-xs-12 blockBox row-gap-xs ">
							<p class="filter-name"><strong>OWNERSHIP</strong></p>
							<div class="col-xs-12 internal-box content mCustomScrollbar">
								<% for(int i=0;i<ownership.size();i++){if(!ownership.get(i).trim().equals("")){
								%>
								<div class="checkbox">
									<%if(ownershipUrl!=null){if(ownershipUrl.equalsIgnoreCase(ownership.get(i).trim())){ %>
			                    			<label><input type="checkbox" name="ownershipList" value="<%=ownership.get(i) %>" checked="checked"><%=ownership.get(i) %></label>
			                    		<%}else{%>
			                    			<label><input type="checkbox" name="ownershipList" value="<%=ownership.get(i) %>"><%=ownership.get(i) %></label>
			                    	<%}}else if(filterOwnership!=null){if(Arrays.asList(filterOwnership).contains(ownership.get(i))){ %>
			                    		<label><input type="checkbox" name="ownershipList" value="<%=ownership.get(i) %>" checked="checked"><%=ownership.get(i) %></label>
			                    	<%}else{%>
			                    		<label><input type="checkbox" name="ownershipList" value="<%=ownership.get(i) %>"><%=ownership.get(i) %></label>
			                    	<%}}else{ %>
			                    		<label><input type="checkbox" name="ownershipList" value="<%=ownership.get(i) %>"><%=ownership.get(i) %></label>
			                    	<%} %>
								</div>
							<%}} %>
		           			</div>
		     			</div>
							<%}if(!courses.isEmpty()){ %>
						<div class="col-xs-12 blockBox row-gap-xs">
							<p class="filter-name"><strong>COURSE LEVEL</strong></p>
							<div class="col-xs-12 internal-box content mCustomScrollbar">
								<% for(int i=0;i<courses.size();i++){
								%>
								<div class="checkbox">
									<%if(filterCourse!=null){if(Arrays.asList(filterCourse).contains(courses.get(i))){ %>
			                    		<label><input type="checkbox" name="coursesList" value="<%=courses.get(i) %>" checked="checked"><%=courses.get(i) %></label>
			                    	<%}else{%>
			                    		<label><input type="checkbox" name="coursesList" value="<%=courses.get(i) %>"><%=courses.get(i) %></label>
			                    	<%}}else{ %>
			                    		<label><input type="checkbox" name="coursesList" value="<%=courses.get(i) %>"><%=courses.get(i) %></label>
			                    	<%} %>
								</div>
							<%} %>
		           			</div>
		     			</div>
							<%} %>
					</form>
				</div>
	   			<div class="col-xs-9">
    				<div class="col-xs-12 text-center border-bottom"><h3>List of All Colleges</h3></div>
    				<div class="col-xs-12 border-bottom">
    					<div class="col-xs-6 col-xs-offset-3">
    			 			<nav role="navigation" id="college-navbar" class="navbar-collapse collapse text-center-xs">
								<ul class="nav nav-tabs nav-justified text-center new-tabs">
									<%if(sorting.equals("alpha")){%>
										<li class="activated"><a href="javascript:firterSort('alpha')">Alphabetically</a></li>
										<li><a href="javascript:firterSort('pop')">Popularity</a></li>
									<%}else{ %>
										<li><a href="javascript:firterSort('alpha')">Alphabetically</a></li>
										<li class="activated"><a href="javascript:firterSort('pop')">Popularity</a></li>
									<%} %>							
								</ul>
							</nav>
    					</div>
    				</div>
	         		<%
	         			DBCursor cu=list.get(0).getCursor();
	         			while(cu.hasNext()){
	         				BasicDBObject db=(BasicDBObject)cu.next();%>
					<div class="col-xs-12 row-gap-sm border-doted">
						<div class="col-xs-3">
		                    <a href="../../college/<%=db.getString("college_URL")%>"><img src="<%=db.getString("collegeLogo")%>" class="img-center img-responsive college-img" alt="<%=db.getString("collegeName")%> Logo" title="<%=db.getString("collegeName")%>"></a>
	                	</div>
	                	<div class="col-xs-9">
		                    <p class="h3 collegeName"><a href="../../college/<%=db.getString("college_URL")%>"><%=db.getString("collegeName")%></a></p>
	                    	<ul class="course-list-ul">
	                     			<%if(db.getString("collegeAddress")!=null && !(db.getString("collegeAddress")).equals("")) {%>
								<li><%=db.getString("collegeAddress") %></li>
		                     		<%}if(db.getString("Estd")!=null && !(db.getString("Estd")).equals("")){%>
								<li><strong>Estd: </strong><%=db.getString("Estd") %></li>
									<%}if(db.getString("Affilated_to")!=null && !(db.getString("Affilated_to")).equals("")){%>
								<li><strong>Affilated To: </strong><%=db.getString("Affilated_to").substring(db.getString("Affilated_to").indexOf(":")+1).trim()%></li>
									<%}if(db.getString("ApprovedBy")!=null && !(db.getString("ApprovedBy")).equals("")){ %>
                				<li><strong>Approved By: </strong><%=db.getString("ApprovedBy") %></li>
	                				<%}else{%>
                				<li><strong>Approved By: </strong> All India Council for Technical Education</li>
		                        	<%}%>
	                    	</ul>
	                	</div>
					</div>
				<%}%> 
				</div>
			</div>
	       	<div class="row row-gap-sm text-center">
	       		<div class=" col-xs-12 text-center">
	            	<p id="pagination"> </p>
	       		</div>
	       	</div>
	       	<div class="row row-gap-md"></div>
	    </div>
	</section>
	<footer>
	    <jsp:include page="/footer.jsp"></jsp:include>
	    <form action="" method="post" id="myForm">
	    	<input type="hidden" name="pageNumber" id="pageNumber" value="<%=currentPageNumber%>">
	    </form>
	    
		<div class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog text-center" style="top: 50%">
				<i aria-hidden="true" class="fa fa-refresh fa-spin fa-5x fa-fw"></i>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</footer>
<script src="../../js/bootstrap.min.js" defer="defer"></script>
<script src="../../js/jquery.bootpag.min.js" defer="defer"></script>
<script src="../../js/jquery.mCustomScrollbar.concat.min.js" defer="defer"></script>
<script src="../../js/typeahead.bundle.min.js"></script>
<script type="text/javascript">
	var totalCount="<%=list.get(0).getTotalCount()%>";
	var current="<%=currentPageNumber%>";
	var collegeName=<%=compCollege%>;
	var formSubmit=function(search){
		$(".modal").modal({
			"backdrop":'static',
		});
		var search_url=(((search).toLowerCase()).replace(/\s/g,"-"));
 		var searchURL=(((search_url).toLowerCase()).replace(/,/g,"")).trim();
		location.href="/college/"+searchURL;
		//location.href="http://localhost:8086/Updated_eadmission24516/college/"+searchURL;
	}
	$("#searchBox").keypress(function(e){
		if(e.keyCode==13){
			var searchBox=$("#searchBox").val();
			if(collegeName.indexOf(searchBox)!=-1)
				formSubmit(searchBox.trim());
				
		}
	})

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

	$(document).ready(function(){
		$("#pagination").bootpag({
		    paginationClass: "pagination pagination-sm",
		    next: '<i class="fa fa-angle-right"></i>',
		    prev: '<i class="fa fa-angle-left"></i>',
		    total: parseInt(totalCount),
		    page: parseInt(current),
		    maxVisible: 10
		}).on("page", function(a, e) {
			$(".modal").modal({
				"backdrop":'static',
			});
			$("#pageNumber").val(e-1);
		    $("#myForm").submit();
		});
		
		$('#searchBox').typeahead({
			  hint: false,
			  highlight: true,
			  minLength: 1
			},
			{
			  name: 'collegeName',
			  source: substringMatcher(collegeName)
			});
	});
	$("#college-navbar .nav a").on("click", function(){
	   $(".nav").find(".activated").removeClass("activated");
	   $(this).parent().addClass("activated");
	});
	$("input[type='checkbox']").click(function(){
		var sortingType="<%=sorting%>";
		$(".modal").modal({
			"backdrop":'static',
		});
		var redirectedUrl=location.pathname;
		var redirect=0,one=false,two=false,three=false;
		var newUrl="/courses/b-tech/list of";
		if(sortingType!="alpha")
			newUrl=newUrl+" top";
		redirect=redirect+$('input[name="ownershipList"]:checked, input[name="streamList"]:checked, input[name="stateList"]:checked').length;
		if($('input[name="ownershipList"]:checked').length==1){
			three=true;
			var value=$('input[name="ownershipList"]:checked').val().trim();
			newUrl=newUrl+" "+value;
		}
		if($('input[name="streamList"]:checked').length==1){
			one=true;
			var value=$('input[name="streamList"]:checked').val().trim();
			newUrl=newUrl+" "+value
		}
		if($('input[name="stateList"]:checked').length==1){
			two=true;
			var value=$('input[name="stateList"]:checked').val().trim();
			newUrl=newUrl+" colleges in "+value;
		}
		if(!two)
			newUrl=newUrl+" colleges";
		
		var urlParam=$("#searchForms").serialize();
		if(redirect==0||urlParam==""){
			if(sortingType!="alpha")
				redirectedUrl="/courses/b-tech/list-of-top-colleges";
			else
				redirectedUrl="/courses/b-tech/list-of-colleges";
			$(this).removeAttr("checked");
			location.href=redirectedUrl;
		}else if(redirect>0 && (redirect<3 || (redirect==3 && ((one && two) || (one && three) ||(two && three)||(one && two || three))))){
			redirectedUrl=newUrl.replace(/\s/g, "-").toLowerCase().trim();
			$(this).removeAttr("checked");
			location.href=redirectedUrl;
		}
		else{
			redirectedUrl="/courses/b-tech/list-of-colleges?";
			if(sortingType!="alpha")
				redirectedUrl=redirectedUrl+"filterType="+sortingType+"&";
			$(this).removeAttr("checked");
			location.href=redirectedUrl+urlParam;
		}
	});
	var firterSort=function(filterType){
		$(".modal").modal({
			"backdrop":'static',
		});
		var redirectedUrl=location.pathname;
		var redirect=0,one=false,two=false,three=false;
		var newUrl="/courses/b-tech/list of";
		if(filterType!="alpha")
			newUrl=newUrl+" top";
		redirect=redirect+$('input[name="ownershipList"]:checked, input[name="streamList"]:checked, input[name="stateList"]:checked').length;
		if($('input[name="ownershipList"]:checked').length==1){
			three=true;
			var value=$('input[name="ownershipList"]:checked').val().trim();
			newUrl=newUrl+" "+value;
		}
		if($('input[name="streamList"]:checked').length==1){
			one=true;
			var value=$('input[name="streamList"]:checked').val().trim();
			newUrl=newUrl+" "+value
		}
		if($('input[name="stateList"]:checked').length==1){
			two=true;
			var value=$('input[name="stateList"]:checked').val().trim();
			newUrl=newUrl+" colleges in "+value;
		}
		if(!two)
			newUrl=newUrl+" colleges";
		
		var urlParam=$("#searchForms").serialize();

		if(redirect==0||urlParam==""){
			if(filterType!="alpha")
				redirectedUrl="/courses/b-tech/list-of-top-colleges";
			else
				redirectedUrl="/courses/b-tech/list-of-colleges";
			location.href=redirectedUrl;
		}else if(redirect>0 && (redirect<3 || (redirect==3 && ((one && two) || (one && three) ||(two && three)||(one && two || three))))){
			redirectedUrl=newUrl.replace(/\s/g, "-").toLowerCase().trim();
			location.href=redirectedUrl;
		}
		else{
			redirectedUrl="/courses/b-tech/list-of-colleges";
			location.href=redirectedUrl+"?filterType="+filterType+"&"+urlParam;
		}
	}
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
<%}%>