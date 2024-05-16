<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.w3c.dom.Node"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*, java.net.*"%>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList"%>

<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%> 

<%@page errorPage="error_page.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fill Form</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	outline: none;
	font-family: sans-serif;
}

body {
	height: 100vh;
	width: 100%;
}

h3 {
	padding: 5px;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 30%;
	height: auto;
	border: 2px solid purple;
	padding: 50px;
	border-radius: 5px;
	background-color: linear-gradient(115deg, white 20%, purple 80%);
}

button {
	background-color: purple; /* Green */
	border: none;
	color: white;
	margin-top: 50px;
	border-radius: 5px;
	padding: 10px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

textarea {
	width: 100%;
	height: 150px;
	padding: 10px 10px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	font-size: 16px;
	resize: none;
}

select {
	appearance: none;
	outline: 0;
	font-size: 15px;
	padding: 8px; background-image : none;
	width: 100%;
	height: 100%;
	color: black;
	cursor: pointer;
	border: 1px solid grey;
	border-radius: 3px;
	background-image: none;
}

.select {
	position: relative;
	display: block;
	width: 15em;
	height: 2em;
	line-height: 3;
	overflow: hidden;
	border-radius: .25em;
	padding-bottom: 12px;
}

.topnav {
	overflow: hidden;
	background-color: #990099;
}

.topnav a {
	float: right;
	color: #f2f2f2;
	text-align: center;
	padding: 10px 16px;
	text-decoration: none;
	font-size: 20px;
}

.topnav a:hover {
	background-color: #1E6446;
	color: white;
}

.topnav a.active {
	float: left;
	font-weight: bold;
	color: white;
	margin-left: 5%;
}

.topnav a.active:hover {
	color: white;
}

#rightNavBar {
	margin-right: 3%;
}
</style>


</head>
<body>





	<!-- Navigation-->
	<div class="topnav">
		<a class="active" href="#home">Recruitment Monitoring Portal</a>
		<div id="rightNavBar">
			<a href="logout">Welcome,&nbsp;<%=session.getAttribute("name")%>!
			</a> <a href="logout">Logout</a> <a href="modulePage.jsp">Home</a>
		</div>
	</div>





	<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String state = request.getParameter("state");
	/* System.out.println(name);
	System.out.println(phone);
	System.out.println(state); */

	String age = "-";
	String Master_Ji_or_not = "-";
	String Recruiter_or_not = "-";
	String Surveyor_or_not = "-";
	String Remarks = "-";

	int gdt = 0;
	response.setContentType("text/html");
	out.println("<table id='main'>");

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://192.168.0.212:3306/checklistdb?useSSL=false", "root", "axis@123");
		String query = "SELECT age,Master_Ji_or_not,Recruiter_or_not,Surveyor_or_not,Remarks from Masterji_DB where State = ? AND RespondentName = ? AND Phone_Number =?";

		ps = con.prepareStatement(query);
		ps.setString(1, state);
		ps.setString(2, name);
		ps.setString(3, phone);
		rs = ps.executeQuery();

		while (rs.next()) {
			age = rs.getString("age");
			Master_Ji_or_not = rs.getString("Master_Ji_or_not");
			Recruiter_or_not = rs.getString("Recruiter_or_not");
			Surveyor_or_not = rs.getString("Surveyor_or_not");
			Remarks = rs.getString("Remarks");
		}

		rs.close();
		con.close();

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>



	<div class="container">
		<form action="masterjiDataSubmit" method="post">

			<h3>
				State :
				<%=state%></h3>
			<h3>
				Name :
				<%=name%></h3>
			<h3>
				Phone no :
				<%=phone%></h3>
			<h3>
				Age :
				<%=age%></h3>
			<h3>
				MasterJi :
				<%=Master_Ji_or_not%></h3>
			<h3>
				Recruiter :
				<%=Recruiter_or_not%></h3>
			<h3>
				Surveyor :
				<%=Surveyor_or_not%></h3>

			<h3>
				Feedback :
				<div class="select" style="width: 200px;">
					<select id="feedback" name="feedback">
						<option value="Ringing">Ringing</option>
						<option value="No Answer">No Answer</option>
						<option value="Switch Off">Switch Off</option>
						<option value="Busy">Busy</option>
						<option value="Wrong Number">Wrong Number</option>
					</select>
				</div>
			</h3>
			<h3>
				Remarks :
				<textarea type="text" name="remark" *> <%=Remarks%></textarea>
			</h3>
			<input type="hidden" value="<%=state%>" name="state" /> <input
				type="hidden" value="<%=name%>" name="name" /> <input type="hidden"
				value="<%=phone%>" name="phone" /> <input type="hidden"
				value="<%=age%>" name="age" /> <input type="hidden"
				value="<%=Master_Ji_or_not%>" name="maseterji" /> <input
				type="hidden" value="<%=Recruiter_or_not%>" name="recruiter" /> <input
				type="hidden" value="<%=Surveyor_or_not%>" name="surveyor" />

			<button type="submit">Submit</button>

		</form>
	</div>

</body>
</html>