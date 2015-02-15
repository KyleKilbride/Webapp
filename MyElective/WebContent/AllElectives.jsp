<%@page import="com.myelective.controllers.RatingController"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.myelective.controllers.*, java.util.ArrayList, beans.*"%>

<!DOCTYPE html>

<!-- PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" -->
<!-- Authors: Kyle Usherwood, Kyle Kilbride -->
<%
	String s = request.getParameter("newsession");

	if (s != null) {
		try {

			response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
			response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
			response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
			response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
			session.setAttribute("userName", null);
			System.out.println("I got in here s!=null");
			//request.getSession().invalidate(); //session.invalidate(); //do not think this is necessary -- Kyle K
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
		}
	} else {
		System.out.println("Here tooooooo");
		request.getSession(false);
		User user = (User) session.getAttribute("user");

		ElectiveController electiveController = new ElectiveController();
		RatingController ratingController = new RatingController();
		ArrayList ratingArrLst = ratingController.getRecentRating(4);

		session.setAttribute("allElectives",
				electiveController.getElectiveNames());

		session.setAttribute("featuredElective",
				electiveController.getFeaturedElective());

		session.setAttribute("recentRatingBean1",
				(Rating) ratingArrLst.get(1));

		if (user != null) {
			session.setAttribute("userName", user.getFirstName());
		}
	}
%>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyElective</title>
</head>
<body>
	<div class="container-fluid">
		<!-- navbar row -->
		<div class="row-fluid" id="navBarRow">
			<div class="col-md-6">
				<nav class="navbar navbar-inverse navbar-fixed-top">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="index.jsp"> MyElective </a>
							<button class="navbar-toggle" data-toggle="collapse"
								data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="AllElectives.jsp">All Electives</a></li>
							</ul>
							<form class="navbar-form navbar-right" role="search">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Search">
									<button type="submit" class="btn btn-default">Submit</button>
								</div>
							</form>
							<div id="loginSignupText">
								<p class="navbar-text navbar-right">
									<%
										if (session.getAttribute("userName") == null) {
											System.out.println("gets in if "
													+ session.getAttribute("userName"));
									%>
									<a href="SplashPage.jsp" class="navbar-link" id="loginText">Log
										In/Sign Up</a>
									<%
										} else if (session.getAttribute("userName") != null) {
											System.out.println("gets in else "
													+ session.getAttribute("userName"));
									%>
									${sessionScope.user.getFirstName()} <a
										href="index.jsp?newsession" class="navbar-link"
										id="logoutText">Logout</a>
									<%
										}
									%>
								</p>
							</div>
						</div>
					</div>
					<!-- /.container-fluid -->
				</nav>
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row-fluid -->
		<div>

			<h2 id="allElectivesHeader">All Electives</h2>
			<div>
			<!--this script wont execute
				<script type="text/javascript" id="electives">
					var electiveArray = $
					{
						sessionScope.allElectives
					};
					var table = "<table><tr>";
					var j = 0;
					for (var i = 0; i < electiveArray.length; i++) {
						if (j==3) {
							table += "</tr><tr>";
							j=0;
						}
						table += "<td>";
						table += "<a href="#">";
						table += "${sessionScope.allElectives[i].getName()}";
						table += "</a>";
						table += "</td>";
						j++;
					}
					table += "</tr></table>";
					document.write(table);
				</script>-->
<!-- candycrusher22 code -->				<table border="1"><col width="33%"><col width="33%"><col width="33%">
					<tr><td><a href="#">${sessionScope.allElectives[0].getName()}</a></td><td><a href="#">${sessionScope.allElectives[1].getName()}</a></td><td><a href="#">${sessionScope.allElectives[2].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[3].getName()}</a></td><td><a href="#">${sessionScope.allElectives[4].getName()}</a></td><td><a href="#">${sessionScope.allElectives[5].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[6].getName()}</a></td><td><a href="#">${sessionScope.allElectives[7].getName()}</a></td><td><a href="#">${sessionScope.allElectives[8].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[9].getName()}</a></td><td><a href="#">${sessionScope.allElectives[10].getName()}</a></td><td><a href="#">${sessionScope.allElectives[11].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[12].getName()}</a></td><td><a href="#">${sessionScope.allElectives[13].getName()}</a></td><td><a href="#">${sessionScope.allElectives[14].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[15].getName()}</a></td><td><a href="#">${sessionScope.allElectives[16].getName()}</a></td><td><a href="#">${sessionScope.allElectives[17].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[18].getName()}</a></td><td><a href="#">${sessionScope.allElectives[19].getName()}</a></td><td><a href="#">${sessionScope.allElectives[20].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[21].getName()}</a></td><td><a href="#">${sessionScope.allElectives[22].getName()}</a></td><td><a href="#">${sessionScope.allElectives[23].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[24].getName()}</a></td><td><a href="#">${sessionScope.allElectives[25].getName()}</a></td><td><a href="#">${sessionScope.allElectives[26].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[27].getName()}</a></td><td><a href="#">${sessionScope.allElectives[28].getName()}</a></td><td><a href="#">${sessionScope.allElectives[29].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[30].getName()}</a></td><td><a href="#">${sessionScope.allElectives[31].getName()}</a></td><td><a href="#">${sessionScope.allElectives[32].getName()}</a></td></tr>
					<tr><td><a href="#">${sessionScope.allElectives[33].getName()}</a></td><td><a href="#">${sessionScope.allElectives[34].getName()}</a></td>
				</table>
			</div>
		</div>
		</div>
		<!-- /.container fluid -->
</body>
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>
