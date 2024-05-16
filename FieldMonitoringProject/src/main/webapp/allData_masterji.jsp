<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>


<%

	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%> 

<%@page errorPage="error_page.jsp"%>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Masterji FR Calling</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />


<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
	
	
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />


<style>


#main, #second {
	border-collapse: collapse;
}

#main th, #main td {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}

#main, #second {
	margin-top: 20px;
}
</style>


<style>
.bg-violet {
	background-color: #E6E6FA;
}
</style>

<style>
table {
    border-collapse: collapse;     
     width: 105%;
}

th, td {
	border: 1px solid black;
	text-align: center;
	padding: 8px;
	width: 200px;
}

th {
	background-color: purple;
	color: white;
	
}

tr:hover {
	background-color: #f5f5f5;
}

#mainTab {
	padding: 20px;
}

#second {
	font-size: 12px;
}

#frName {
	display: flex;
	justify-content: center;
}

#prjName {
	display: flex;
	justify-content: center;
}

.button-container {
	display: flex;
	justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
	height: 10vh; /* Adjust the height as needed */
}

/* Style for the hyperlink that looks like a button */
.button-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: purple; /* Button background color */
	color: #fff; /* Button text color */
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-weight: bold;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

/* Hover effect */
.button-link:hover {
	background-color: #0056b3; /* Darker background color on hover */
	transform: scale(1.05); /* Slightly scale up the button on hover */
}

center {
	padding-bottom: 20px;
}

.hr-table {
	padding-bottom: 20px;
}

#axislogo {
	width: 300px;
	height: auto;
	margin :10px;
	margin-left:25%;
	
}


#topic-header {
	font-size: 30px; /* Increase the font size */
	color: purple; /* Change the text color to orange */
	text-shadow: 2px 2px 4px rgba(0, 0, 10, 0.3);
	/*
}



        #box{
	    position:absolute;
	    top:5;
	    right:5;
	    border: solid;
	    display: inline-block;
	}
	  .color-box {
	    width: 20px;
	    height: 20px;
	    display: inline-block;
	    margin: 10px;
	  }
	  .color-text {
	    font-family: Arial, sans-serif;
	    font-size: 16px;
	    vertical-align: top;
	    display: inline-block;
	    margin: 10px;
	  }
	          
        
        
</style>


<style>
body {
  margin: 0;
  font-family: Verdana;
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
  background-color: #1E6446 ;
  color: white;
}

.topnav a.active {
  float: left;
  font-weight:bold;  
  color: white;
  margin-left:5%;
  
}

.topnav a.active:hover{
	color: white;
}

#rightNavBar{
	margin-right:3%;
}

#user{
 font-weight:bold; 
}


.hr-table{
	width: 80%;

}



.container-img{
	display: flex;
	justify-content: center;
	background-color:#eee1ff;
	padding: 20px 20px;
}

    .main-box {
            display: inline-block;
            padding: 8px;
            margin-right:30px;
            margin-top: 7%;
            border: solid;
            float: right;
         
        }
    .boxx {
        width: 20px; 
        height: 20px;     
        display: inline-block;
        vertical-align: top;
    }
    .red {
        background-color: red;
    }
    .blue {
        background-color: blue;
    }
    
    .properties {       
        font-size: 14px;
        color: black;
        display: inline-block; 
        vertical-align: top;
        margin-left: 10px;
    }


</style>

</head>

<body >


	
	
	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">Recruitment Monitoring Portal</a>
	  <div id="rightNavBar">
	   <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
	</div>
	
	
			

			
			<center>
				<div class="hr-table">

					<%
					String state=request.getParameter("state");
					String webPage=request.getParameter("webPage");
					webPage=webPage+"/"+state;
					int gdt=0;
					response.setContentType("text/html");
					out.println("<table id='main'>");

		

					Connection con = null;
					PreparedStatement ps = null;
					ResultSet rs = null;
					

					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						 con=DriverManager.getConnection("jdbc:mysql://192.168.0.212:3306/checklistdb?useSSL=false","root","axis@123");	
						String query = "SELECT RespondentName,Phone_Number,age,Master_Ji_or_not,Recruiter_or_not,Surveyor_or_not,Feedback,Remarks from Masterji_DB where State LIKE ?";

						ps = con.prepareStatement(query);
						ps.setString(1,state);			
				
						rs = ps.executeQuery();

						int iz=1;
						out.println(
						"<tr><th>SlNo</th><th>Respondent Name </th><th>Phone Number</th><th>Age</th><th>Masterji</th><th>Recruiter</th><th>Surveyor</th><th>Feedback</th><th>Remarks</th><th>Action</th></tr>");
						while (rs.next()) {
							String RespondentName = rs.getString("RespondentName");
							String Phone_Number = rs.getString("Phone_Number");
							String age = rs.getString("age");
							String Master_Ji_or_not = rs.getString("Master_Ji_or_not");							
							String Recruiter_or_not = rs.getString("Recruiter_or_not");
							String Surveyor_or_not = rs.getString("Surveyor_or_not");
							String Feedback = rs.getString("Feedback");
							String Remarks = rs.getString("Remarks");						
							
											
						
							out.println("<tr><td >" + iz + "</td><td>" + RespondentName + "</td><td>" + Phone_Number + "</td><td>" + age + "</td><td>" + Master_Ji_or_not + "</td><td>" + Recruiter_or_not
							+ "</td><td>" + Surveyor_or_not + "</td><td>" + Feedback + "</td><td>" +Remarks
							+ "</td><td><a href='edit_Masterji.jsp?name="+RespondentName+"&phone="+Phone_Number+"&state="+state+"' >Edit</a></td></tr>");
							iz++;
						}
						
						rs.close();
						out.println("</table>");
						con.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
					<div>
			</center>




</body>
</html>