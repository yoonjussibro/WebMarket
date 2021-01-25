<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.Date" %> --%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<%!
	String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to Web Market!";
	%>

	<!-- <nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class = "container">
			<div class = "navbar-header">
				<a class = "navbar-brand" href="./welcome.jsp">Home</a>
			</div>
		</div>
	
	</nav> -->
	
	
	<%@ include file="Menu.jsp" %>
	
	<div class = "jumbotron">
		<div class = "container text-center">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>
	
	<main role = "main">
	<div class = "container">
		<div class = "text-center">
			<h3>
				<%= tagline %>
				<%
				response.setIntHeader("Refresh", 5);
				
				String am_pm;
				
				/* Date 클래스 대신 Calendar 클래스를 사용 */
				/* Date day = new Date();
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds(); */

				Calendar time = Calendar.getInstance();
				int hour = time.get(Calendar.HOUR_OF_DAY);
				int minute = time.get(Calendar.MINUTE);
				int second = time.get(Calendar.SECOND);
				
				
				if (hour / 12 == 0) {
					am_pm = "AM";
				}
				else {
					am_pm = "PM";
					hour = hour - 12;
				}
				
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				
				out.println("\n" + "현재 접속 시각 : " + CT + "\n");
				%>
			</h3>
		</div>
	</div>
	</main>
	
	<%@ include file="footer.jsp" %>
	
	<!-- <footer class = "container">
		<P>&copy; WebMarket</P>
	</footer> -->
	
	<%-- <h1><%=greeting %></h1>
	<h3><%=tagline %></h3> --%>
</body>
</html>