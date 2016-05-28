<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>Courses |Easyadmission.guru</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="style.css">
	<link rel="shortcut icon"  type="image/x-icon" href="img/favicon.ico">
</head>
<body>
<header class="header-section">
    <div class="container">
        <div class="row">
			<div class="col-xs-12 text-right">
				<a class="navbar-brand" href="#">
       				<img alt="Easyadmission.guru Logo" title="Easyadmission.guru" src="/img/easyadmission-logo.png">
     				</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-menu" aria-expanded="false"><i class="fa fa-bars"></i></button>
                <nav class="navbar custom-header-menu">
                    <div class="collapse navbar-collapse" id="header-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/courses">All Course</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<section class="section college-page text-center">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="college-names">
                    <div class="col-xs-12 col-sm-6 col-md-4 col-md-offset-2 row-gap-xs college">
                        <div class="college-list col-xs-12" id="college-type">
                            <a href="javascript:" data-toggle="modal" data-target="#college-type-modal">
                               <img alt="Engineering Colleges" src="img/engineering.png" title="Engineering Colleges" class="img-responsive img-center">
                                <p class="h3">Engineering</p>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 row-gap-xs college">
                        <div class="college-list col-xs-12">
                            <a href="courses/management/colleges">
                                <img alt="Management Colleges" src="img/management.png" title="Management Colleges" class="img-responsive img-center">
                                <p class="h3">Management</p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>		
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <div class="row">
            <nav class="navbar navbar-fixed-bottom" style="min-height: auto;">
                <div class="col-xs-12">
                    <p class="text-muted">&copy; Easy Admission. All right Reserved</p>
                </div>
            </nav>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" id="college-type-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <table class="table">
                    	<thead>
                    		<tr class="text-right">
                    			<td align="right" colspan="2">
                    				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    			</td>
                    		</tr>
                    	</thead>
                    	<tbody class="modal-body">
	                    	<tr>
								<td style="border: 1px solid #ddd;margin: 10px;padding:15px">
									<a href="courses/b-tech/colleges">
			                           	<img alt="B.Tech Colleges" src="img/b-tech.png" title="B.Tech Colleges" class="img-responsive img-center">
			                       	</a>
								</td>
								<td style="border: 1px solid #ddd;margin: 10px;padding:15px">
									<a href="courses/m-tech/colleges">
				                    	<img alt="M.Tech Colleges" src="img/m-tech.png" title="M.Tech Colleges" class="img-responsive img-center">
									</a>
								</td>
							</tr>
                    	</tbody>
					</table>
				</div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</footer>
<script src="js/jquery-2.2.3.min.js" type="text/javascript" ></script>
<script src="js/bootstrap.min.js" type="text/javascript" defer="defer"></script>
</body>
</html>