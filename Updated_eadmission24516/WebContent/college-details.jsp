<%@page import="getData.CollegeList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="getData.Action"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Action ac=new Action();
    String url=request.getRequestURI();
    String referer="/courses/b-tech/list-of-colleges";
    if(request.getHeader("Referer")==null)
    	referer="/courses/b-tech/list-of-colleges";
    else if(request.getHeader("Referer").contains("/m-tech/"))
    	referer="/courses/m-tech/list-of-colleges";
    else if(request.getHeader("Referer").contains("/b-tech/"))
    	referer="/courses/b-tech/list-of-colleges";
    else
    	referer="/courses/b-tech/list-of-colleges";
    
    if((url.lastIndexOf("/")+1)==url.length())
        response.sendRedirect("/colleges");
    else if(url.contains("*"))
        response.sendRedirect("/colleges");
    else{
        List<CollegeList> list= new ArrayList<CollegeList>();
        List<String> facilities=new ArrayList<String>();
        list=ac.getCollegeDetails(url.substring(url.lastIndexOf("/")+1));
        if(!list.isEmpty()){
	       	List<CollegeList> ugCourse=new ArrayList<CollegeList>();
	       	List<CollegeList> pgCourse=new ArrayList<CollegeList>();
	       	ugCourse=list.get(0).getCourseNameUG(); 
	       	pgCourse=list.get(0).getCourseNamePG();
	       	facilities=list.get(0).getFacilities();
			//System.out.println(list.get(0).getFeatures());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=list.get(0).getMetaTitle()%></title>
        <meta name="description" content="<%=list.get(0).getMetaDescriptions()%>">
        <meta name="keywords" content="<%=list.get(0).getMetaKeywords()%>">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/font-awesome.min.css">
        <link rel="stylesheet" href="../style.css">
        <style>
   			
        </style>
     </head>
     <body>
     <header class="header-section">
		<div class="container">
        	<div class="row">
				<div class="col-xs-12 text-right">
					<a class="navbar-brand" href="#">
        				<img alt="Easyadmission.guru Logo" title="Easyadmission.guru" src="../img/easyadmission-logo.png">
      				</a>
	            </div>
	        </div>
		</div>
     </header>
     <section class="college-details">     	
             <div class="container">
	             <div class="row row-gap-xs">
	             <div class="col-xs-12">
	             	<small class="navigate"><a href="/">Home</a> <span>/</span><a href="<%=referer%>">Colleges</a> <span>/</span><a href="javascript:"><%=list.get(0).getCollegeName()%></a></small>
	             </div>
		             <!-- <ul>
		             	<li style="float:left"><a href="">Colleges</a> <span>/</span></li>
		             	<li><a href="#"><%=list.get(0).getCollegeName()%></a></li>
		             </ul> -->
		             
	     		</div>
                <div class="row">
                       <div class="col-xs-12">
                       <h1 class="h2"><%=list.get(0).getCollegeName()%></h1>
	                       <div class="col-md-8 col-sm-8 col-xs-12">
	                               <table class="table">
	                                   <thead>
	                                        <tr>
	                                            <th></th>
	                                        </tr>
	                                   </thead>
	                                   <tbody>
	                                       <tr>	                                     
	                                         <td>
	                                         	<%if(list.get(0).getApprovedBy()!=null || !list.get(0).getApprovedBy().trim().equals("")){ %>
	                                             	<p class="text-muted"><strong>Approved by: </strong><%= list.get(0).getApprovedBy()%></p>
	                                            <%}if(list.get(0).getAffilatedTo()!=null || !list.get(0).getAffilatedTo().trim().equals("")){ %>
	                                                <p><strong><span class="text-muted">Affiliated to: </span><%= list.get(0).getAffilatedTo()%></strong></p>
	                                             <%}if(list.get(0).getWebsiteUrl()!=null || !list.get(0).getWebsiteUrl().trim().equals("")){ %>
	                                                <p><strong><span class="text-muted">Website: </span><a href="<%=list.get(0).getWebsiteUrl()%>" target="_blank" rel="noindex,nofollow"><%=list.get(0).getWebsiteUrl()%></a></strong></p>
	                                        	<%} %>	
	                                         </td>
	                                       </tr>	                                       
	                                    </tbody>
	                              </table>
	                              <table class="table">	                                   
	                                   <tbody>
	                                      <tr>
	                                         <td width="40%"><%if(list.get(0).getCollegeAddress()!=null && !list.get(0).getCollegeAddress().trim().equals("")){%>
	                                               <p class="text-muted"><strong>Contact Details</strong></p>
	                                               <p><%=list.get(0).getCollegeAddress()%></p>
	                                               <%}if(list.get(0).getContact()!=null && !list.get(0).getContact().trim().equals("")){%><p><strong>Contact:</strong> <%=list.get(0).getContact()%></p><%}%>
												   
	                                         </td>
	                                         <td>
	                                         	 <p class="text-muted"><strong>Facilities:</strong></p>
	                                         	 
	                                         	 <%if(facilities.size()!=0){ %>
	                                         	 <ul class="facilities">
	                                         	 	<%for(int i=0;i<facilities.size();i++){ %>
	                                         	 		
							                    		<li>
							                    		<%if(facilities.get(i).equals("Boys Hostel")){ %>
							                    			<i class="fa fa-home" aria-hidden="true"></i>
							                    			<%}else if(facilities.get(i).equals("Girls Hostel")){%>
							                    			<i class="fa fa-home" aria-hidden="true"></i>
							                    			<%}else if(facilities.get(i).equals("Cafeteria")){%>
							                    			<i class="fa fa-coffee" aria-hidden="true"></i>	
							                    			<%}else if(facilities.get(i).equals("Medical")){%>
							                    			<i class="fa fa-medkit" aria-hidden="true"></i>	
							                    			<%}else if(facilities.get(i).equals("Library")){%>
							                    			<i class="fa fa-book" aria-hidden="true"></i>
							                    			<%}else if(facilities.get(i).equals("IT Infrastructure")){%>
							                    			<i class="fa fa-industry" aria-hidden="true"></i>	
							                    			<%}else if(facilities.get(i).equals("Auditorium")){%>
							                    			<i class="fa fa-building" aria-hidden="true"></i>	
							                    			<%}else if(facilities.get(i).equals("Gym")){%>
							                    			<i class="fa fa-male" aria-hidden="true"></i>
							                    			<%}else if(facilities.get(i).equals("Hospital")){%>
							                    			<i class="fa fa-hospital-o" aria-hidden="true"></i>		
							                    			<%}else if(facilities.get(i).equals("Transport")){%>
							                    			<i class="fa fa-bus" aria-hidden="true"></i> 
							                    			<%}else if(facilities.get(i).equals("WiFi")){%>
							                    			<i class="fa fa-wifi" aria-hidden="true"></i>
							                    			<%}else if(facilities.get(i).equals("Sports")){%>
							                    			<i class="fa fa-futbol-o" aria-hidden="true"></i>                      			
							                    			<%}%>
							                    			
							                    			
							                    			
							                    			
							                    		<%=facilities.get(i) %></li>
							                    	<%} %>
								                 </ul>
								                 <%} %>
	                                         	 
	                                         	
	                                         </td>
	                                       </tr>	                                       
	                                    </tbody>
	                              </table>
	                              
	                          </div>
	                           <div class="col-md-4 col-sm-4 col-xs-12 ">
	                           		<div class="row-gap-sm"></div>	                           		
	                                   <img alt="<%=list.get(0).getCollegeName()%> Logo" src="<%=list.get(0).getCollegeLogo()%>" title="<%=list.get(0).getCollegeName()%>" class="img-responsive img-center ">
	                           </div>                           
                      	</div>
                      	<div class="col-xs-12 justify">
                      		<h3 class="text-muted">About College</h3>
                      		<div class="aboutsection">
                      			<p><%=list.get(0).getH2()%></p>
                      		</div>
                      	</div>
                      	<div class="col-xs-12 justify">
                      		<h3 class="text-muted">Infrastructure Information</h3>
                      		<div class="aboutsection">
                      			<p><%=list.get(0).getMetaInfrastructure()%></p>
                      		</div>
                      	</div>
                   </div>
            </div>
    </section>
    <section>
		<div class="container">
        	<div class="row">
            	<div class="col-xs-12">
            	
               
                	<h3 class="text-muted">Courses Offered</h3>
                	<div class="row">
                		<div class="col-md-6 col-sm-6">
	                		
                	<%if(list.get(0).getCourseNameUG().size()!=0){ %>
                	
	                		<div class="row btech offered offer">
	                			<div class="col-xs-10">
			                		<h4>B.Tech <span>[<%=list.get(0).getCourseNameUG().size() %>]</span></h4>
			                	</div>
			                	<div class="col-xs-2">	
			                		<a href="javascript:void(0)"><i class="fa fa-angle-down arrow-offer" id="arrow"></i></a>
			                	</div>
	                		</div>
	                		
	                		<hr class="line_start">
	                			<div class="menu offered show-menu" style="display: none;"> 
	                				<ul class="course-list row-gap-xs list-offered">
					                    <%for(int i=0;i<ugCourse.size();i++){%>
					                   <li>
					                   <div class="row">
					                   		<div class="col-xs-9"><%=ugCourse.get(i).getNameOfCourse()%></div>
						                   
						                  <div class="col-xs-3"> <a href="javascript:void(0)" data-toggle="modal" data-target="#modalbtech<%=i%>">View Details</a></div>
					                   </div>
					                     <div id="modalbtech<%=i%>" class="modal fade" role="dialog">
											  <div class="modal-dialog" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											        <h3 class="modal-title text-center" id="courseName"><%=ugCourse.get(i).getNameOfCourse()%></h3>
											      </div>
											      <div class="modal-body modal-body-offered">
											      	<%if(ugCourse.get(i).getCourseDescription()!=null || !ugCourse.get(i).getCourseDescription().trim().equals("")) {%>
												        <div style="font-size:16px;"><strong>About Course :</strong>
												      <%=ugCourse.get(i).getCourseDescription()%></div>
												        
											        
											        <%}if(ugCourse.get(i).getDuration()!=null || !ugCourse.get(i).getDuration().trim().equals("")){ %>
												       <div style="font-size:16px;"><strong>Duration :</strong>
												      <%=ugCourse.get(i).getDuration()%></div>
												        
											        
											        <%}if(ugCourse.get(i).getEligibility()!=null || !ugCourse.get(i).getEligibility().trim().equals("")) {%>
												       <div style="font-size:16px;"><strong>Eligibility :</strong>
												      <%=ugCourse.get(i).getEligibility()%></div>
												        
											        <%}if(ugCourse.get(i).getStudyMode()!=null || !ugCourse.get(i).getStudyMode().trim().equals("")){ %>
													       <div style="font-size:16px;"><strong>Study Mode :</strong>
													       <%=ugCourse.get(i).getStudyMode()%></div>
											        <%} %>

											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											      </div>
											    </div>
											 </div>
										</div>
										<hr class="list-line">
					                   </li>
					                    <%}%>
			                    	</ul>
			                   		
								</div>
							</div>
					
                		<%} %>
                		<%if(list.get(0).getCourseNamePG().size()!=0){ %>
                       
                       <div class="col-md-6 col-sm-6">
                		<div class="row mtech offered offer">
	               			<div class="col-xs-10">
		                		<h4>M.Tech<span> [<%=list.get(0).getCourseNamePG().size() %>]</span></h4>
		                	</div>
		                	<div class="col-xs-2">	
		                		<a href="javascript:void(0)"><i class="fa fa-angle-down arrow-offer" id="arrow1"></i></a>
		                	</div>
	                	</div>
                		
                		<hr class="line_start">
                		<div class="menu1 offered show-menu" style="display: none;">
                			 <ul class="course-list row-gap-xs list-offered">
			                    <%for(int i=0;i<pgCourse.size();i++){%>
			                    <li>
			                    <div class="row">
			                   		<div class="col-xs-9"><%=pgCourse.get(i).getNameOfCourse()%></div>
				                  	<div class="col-xs-3"> <a href="javascript:void(0)" data-toggle="modal" data-target="#modalmtech<%=i%>">View Details</a></div>
			                   </div>
			                      <div id="modalmtech<%=i%>" class="modal fade" role="dialog">
											  <div class="modal-dialog" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											        <h3 class="modal-title text-center" id="courseName"><%=pgCourse.get(i).getNameOfCourse()%></h3>
											      </div>
											      <div class="modal-body modal-body-offered ">
											       <%if(pgCourse.get(i).getCourseDescription()!=null || !pgCourse.get(i).getCourseDescription().trim().equals("")) {%>
												        <div style="font-size:16px;"><strong>About Course :</strong>
												      <%=pgCourse.get(i).getCourseDescription()%></div>
												        
											        
											        <%}if(pgCourse.get(i).getDuration()!=null || !pgCourse.get(i).getDuration().trim().equals("")){ %>
												       <div style="font-size:16px;"><strong>Duration :</strong>
												      <%=pgCourse.get(i).getDuration()%></div>
												        
											        
											        <%}if(pgCourse.get(i).getEligibility()!=null || !pgCourse.get(i).getEligibility().trim().equals("")) {%>
												       <div style="font-size:16px;"><strong>Eligibility :</strong>
												      <%=pgCourse.get(i).getEligibility()%></div>
												        
											        <%}if(pgCourse.get(i).getStudyMode()!=null || !pgCourse.get(i).getStudyMode().trim().equals("")){ %>
													       <div style="font-size:16px;"><strong>Study Mode :</strong>
													       <%=pgCourse.get(i).getStudyMode()%></div>
											        <%} %>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											      </div>
											    </div>
											 </div>
										</div>
										  <hr class="list-line">
			                    </li>
			                    <%}%>
		                   	 </ul>
						</div>
					</div>
				</div>
        	 <%}%>
        	</div>
		</div>
	</div>
</section>
   <jsp:include page="/footer.jsp" ></jsp:include>

    <script src="../js/jquery-2.2.3.min.js" ></script>
    <script src="../js/bootstrap.min.js"></script>
 <script>

        $('.btech').click(function() {
        	
          if( $("#arrow").hasClass("fa fa-angle-up")){
        	  $("#arrow").removeClass("fa fa-angle-up");
        	  $("#arrow").addClass("fa fa-angle-down");
           }
          else {
        	  
        	  $("#arrow").removeClass("fa fa-angle-down");
        	  $("#arrow").addClass("fa fa-angle-up");
          	 
           }
            $(".menu").slideToggle();
        });
   
        // Hide menu once we know its width
        $('.mtech').click(function() {
        	if( $("#arrow1").hasClass("fa fa-angle-up")){
          	  $("#arrow1").removeClass("fa fa-angle-up");
          	  $("#arrow1").addClass("fa fa-angle-down");
             }
            else {
           $("#arrow1").removeClass("fa fa-angle-down");
          	  $("#arrow1").addClass("fa fa-angle-up");
          	 
             }
        	 $(".menu1").slideToggle();
        });

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
<%}
else
	response.sendRedirect("/");
}%>