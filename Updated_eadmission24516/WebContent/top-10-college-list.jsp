<%@page import="com.mongodb.DBCursor,com.mongodb.BasicDBObject"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="getData.CollegeList"%>
<%@page import="getData.Action"%>
<%
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
	String[] filterownership=null;
	if(request.getParameterValues("ownership")!=null)
	{
		filterownership=request.getParameterValues("ownership");
	}
    int currentPageNumber=0;
    Action ac=new Action();
    List<CollegeList> list= new ArrayList<CollegeList>();
    if(pageCount==null)
   	 list=ac.getCollegeList(currentPageNumber,"btech",filterFacility,filterStream,filterCourse,filterState,filterownership);
   else{
       list=ac.getCollegeList(Integer.parseInt(pageCount)*10,"btech",filterFacility,filterStream,filterCourse,filterState,filterownership);
       currentPageNumber=Integer.parseInt(pageCount);
   }
    currentPageNumber++;
    List<String> state=list.get(0).getStates();
    List<String> owner=list.get(0).getOwnership();
//     List<String> stream=list.get(0).getStream();
     List<String> courses=list.get(0).getCourse();
//     List<String> facilities=list.get(0).getFeatures();
    String compCollege=list.get(0).getCollegeList().trim();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="style.css">
<link rel="shortcut icon"  type="image/x-icon" href="img/favicon.ico">

<style type="text/css">
.modal-backdrop{
	background: transparent !important;
}
.fa-refresh{
	font-size: 10em;
}
.tt-menu{
	background-color: #fff;
	padding: 10px;
}
.tt-menu .tt-suggestion{
	padding-top: 10px;
	padding-bottom: 10px;
	width: 100%;
}
</style>
</head>
<body>
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
<!-- 	    <div class="row row-gap-md b-tech-header"> -->
<!-- 	        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12"> -->
<!-- 	        	<div class="row" style="color:#fff;padding:10px"><span class="h1">Search Engineering Colleges</span></div> -->
<!-- 	        	<div class="form-group row-gap-xs searchInputBox collegeSearchBox text-left input-group-lg"> -->
<!-- 					<input type="text" id="searchBox" name="searchBox"  placeholder="Search..." class="form-control input-lg"> -->
<!-- 	        	</div> -->
<!-- 				<div class="row-gap-md"></div> -->
<!-- 			</div> -->
<!-- 	    </div> -->
	</header>
	<section class="small-section">
	    <div class="container">
	    	<div class="row row-gap-sm">
		       	<div class="col-xs-3">
		       		<h4><span>Refine Results</span><small style="float: right;"><a href="/courses/b-tech/colleges" class="text-danger">(reset all filters)</a></small></h4>
			       	<form id="searchForms" name="searchForms">
		            		<%if(!state.isEmpty()){ %>
						<div class="col-xs-12 blockBox">
							<p class="filter-name"><strong>STATE</strong></p>
		                 	<div class="col-xs-12 internal-box mCustomScrollbar">
		                 		<%for(int i=0;i<state.size();i++){if(!state.get(i).trim().equals("")){%>
		                  		<div class="checkbox">
		                  			<%if(filterState!=null){if(Arrays.asList(filterState).contains(state.get(i))){ %>
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
						<%}if(!owner.isEmpty()){ %>
						<div class="col-xs-12 blockBox ">
							<p class="filter-name"><strong>OWNERSHIP</strong></p>
							<div class="col-xs-12 internal-box mCustomScrollbar">
								<% for(int i=0;i<owner.size();i++){if(!state.get(i).trim().equals("")){%>
								<div class="checkbox">
									<%if(filterownership!=null){if(Arrays.asList(filterownership).contains(owner.get(i))){ %>
			                    		<label><input type="checkbox" name="ownership" value="<%=owner.get(i) %>" checked="checked"><%=owner.get(i) %></label>
			                    	<%}else{%>
			                    		<label><input type="checkbox" name="ownership" value="<%=owner.get(i) %>"><%=owner.get(i) %></label>
			                    	<%}}else{ %>
			                    		<label><input type="checkbox" name="ownership" value="<%=owner.get(i) %>"><%=owner.get(i) %></label>
			                    	<%} %>
								</div>
							<%} }%>
		           			</div>
		     			</div>
							<%} %>
					</form>
				</div>
	   			<div class="col-xs-9">
    				<div class="col-xs-12 text-center border-bottom"><h3>List of Top 10 Colleges</h3></div>
    				<div class="col-xs-12 border-bottom">
<!--     					<div class="col-xs-6 col-xs-offset-3"> -->
<!--     			 			<nav role="navigation" id="college-navbar" class="navbar-collapse collapse text-center-xs"> -->
<!-- 								<ul class="nav nav-tabs nav-justified text-center new-tabs"> -->
<!-- 									<li class="activated"><a href="">Alphabetically</a></li> -->
<!-- 									<li><a href="">Popularity</a></li>							 -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<!--     					</div> -->
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
	       	<div class="row row-gap-md"></div>
	       	<div class="row row-gap-sm text-center">
	       		<div class=" col-xs-12 text-center">
	            	<p id="pagination"> </p>
	       		</div>
	       	</div>
	    </div>
	</section>
	<footer>
	    <jsp:include page="footer.jsp"></jsp:include>
	    <form action="" method="post" id="myForm">
	    	<input type="hidden" name="pageNumber" id="pageNumber" value="<%=currentPageNumber%>">
	    </form>
	    
		<div class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog text-center" style="top: 30%">
				<i aria-hidden="true" class="fa fa-refresh fa-spin fa-5x fa-fw"></i>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</footer>
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/bootstrap.min.js" defer="defer"></script>
<script src="js/jquery.bootpag.min.js" defer="defer"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js" defer="defer"></script>
<script src="js/typeahead.bundle.min.js"></script>

<script type="text/javascript">
	var totalCount="<%=list.get(0).getTotalCount()%>";
	var current="<%=currentPageNumber%>";
	var collegeName=<%=compCollege%>;
	var formSubmit=function(search){
		var search_url=(((search).toLowerCase()).replace(/\s/g,"-")).split(",",1);
		location.href="/college/"+search_url[0];
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
			$("#pageNumber").val(e-1);
		    $("#myForm").submit();
		});
		
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
	$("#college-navbar .nav a").on("click", function(){
	   $(".nav").find(".activated").removeClass("activated");
	   $(this).parent().addClass("activated");
	});
	$("input[type='checkbox']").click(function(){
		$(".modal").modal({
			"backdrop":'static',
			'top':'50%'
		});
		location.href=location.pathname+"?"+$("#searchForms").serialize();
	});
</script>
</body>
</html>