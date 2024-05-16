<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@page errorPage="error_page.jsp"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
	<!-- script for search bar -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<meta charset="ISO-8859-1">
<link href="css/fr_caling.css" rel="stylesheet">
<style >


*{
        margin:3px;
        padding: 0;
        font-family: Verdana;  
        }
       
        table,
        th,
        td {
        border: 1px solid black;
        border-collapse: collapse;
        }
     
        th,
        td {
            padding: 20px;
        }
       
        th{
        background-color: #eee1ff;
         color: #990099;
       
        }  
 
        body{
            height: 75vh;    
            place-items: center;
            width: 100%;        
        }
       
       
        table{
            box-shadow: -1px 12px 12px -6px rgba(0, 0, 0, 0.5);
            width: 100%;    
            justify-content: center;
            text-align: center;        
       
        }
   
        table, td, th{
            padding: 15px;
            border: 1px solid lightgray;
            border-collapse: collapse;
            text-align: center;
       
        }
       
       
        #upperRow{
        color:white;
         background-color: #990099;
        }
 
 
        .topnav {
          overflow: hidden;
          background-color: #990099;
           margin-bottom:50px;
         
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
       

      #searchBar{
			  /* To center the element horizontally */
			  margin: 0 auto;
			  /* To center the element vertically */
			  display: flex;
			  align-items: center;
			  justify-content: center;
			  /* To make the element large */
			  width: 300px;
			  height: 30px;
			  padding:8px;
			  /* To make the element have a circular border */
			  border-radius: 25px;
			   border: 2px solid #eee1ff;
			   outline: none;
			  margin-bottom:-20px;
        }


.blink1 {
  animation-name: blink;
  animation-duration: 1s;
  animation-iteration-count: infinite;
}

@keyframes blink {
  0% {
    opacity: 1;
    color:red;
  }
  50% {
    opacity: 0.5;
    color: red;
  }
  100% {
    opacity: 0;
    /* color: red; */
  }
}




a{
    text-decoration: unset;
}
}
</style>


<title>FR Calling List</title>
</head>
<body>

	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">FR Calling</a>
	  <div id="rightNavBar">
	   <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
	</div>
	

<%
		String prjName=request.getParameter("projectName");		
	%>
	<%
		String frname=request.getParameter("frName");		
	%>
	<%-- <%DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");%> --%>

<div style="margin: 20px;">
        <div class="text-center" style="padding-top: 10px; padding-bottom: 10px;">
        <img src="Image/Picture1.jpg" width="350" height="80" class="center" alt="Responsive image">
    </div>
    
    
    
    
    
    	<!-- Fetching password and username from xml-->
		<%
		String fileName = "/config/config.xml";
		InputStream ins = application.getResourceAsStream(fileName);
		 String username="";
		 String password="";
		try {
		    if (ins == null) {
		        response.setStatus(response.SC_NOT_FOUND);
		    } else {
		        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		        DocumentBuilder builder = factory.newDocumentBuilder();
		        Document document = builder.parse(ins);
		
		        NodeList itemList = document.getElementsByTagName("userDetail");
		        for (int i = 0; i < itemList.getLength(); i++) {
		            Element item = (Element) itemList.item(i);
		            Element nameElement = (Element) item.getElementsByTagName("name").item(0);
		            Element passElement = (Element) item.getElementsByTagName("pass").item(0);	
		            username = nameElement.getTextContent();
		            password=passElement.getTextContent();  
		        }    
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		%>	
		
		
		
		
		
		
		     
     <!-- to track user log -->
     <%     
     
     try {		 
				
    	 	String date=(String)session.getAttribute("date");
    	 	String name=(String)session.getAttribute("name");
    	 	String dept=(String)session.getAttribute("dept");
    	 	String logInTime=(String)session.getAttribute("logInTime");
    	 	String webPage="FR Calling";
    	 	
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey_monitor?useSSL=false", username, password);	
    	 	
			 
				//data base connection to fetch surveyor id 
				PreparedStatement ps1 =con2.prepareStatement("insert into sm_login_logs(date,name,dept,webPage,logInTime,logOutTime,duration) values (?,?,?,?,?,'-','-')");
				ps1.setString(1,date);
				ps1.setString(2,name);
				ps1.setString(3,dept);
				ps1.setString(4,webPage);
				ps1.setString(5,logInTime);		
				int rs1=ps1.executeUpdate();
				
				if(rs1>0){
					//System.out.println("Succesfully Working");
				}else {
					System.out.println("Not Working");
				}
				
				
	 			ps1.close();				
	            con2.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     %>
		
	
    
	<%
	String driverName = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/survey_monitor";
	String user = username;
	String pass = password;

	Class.forName("com.mysql.cj.jdbc.Driver");
    long id2;
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>
	
	
    <input id="searchBar" type="text" placeholder=" Search here..." >
	
	

	<center>
		<div style="margin: 50px;">

			<div class="container">

				<form id="myform" method="POST" action="">
					<div class="btn btn-hover">
						<a href="SelectProjectFRCalling.jsp"><button type="button" class="btn btn-hover"
								style="background-color: #990099; color: white;">Add Fr Report</button></a>
								
								<a href="frselectProject_FPBP.jsp"><button type="button" class="btn btn-hover"
								style="background-color: #990099; color: white;">Add Fr
								Report FP+BP</button></a>
							
					</div>
					<table class="table table-hover table-bordered" id="main">
						<thead>
							<th colspan="5" id="upperRow" class="text-center" style="background-color: #990099; color: white;">FR Calling
								List</th>
							
						</thead>

						<thead>
							<tr>
								<th>Project Name</th>
								<th >FR Name</th>
								<th>Summary</th>
								<th>Action Required</th>
								<th>Date</th>
							</tr>
						</thead>

                        <tbody id='latlatData'>
                        
						<%
						try {

							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "SELECT* FROM fr_register ORDER BY ID DESC";
							resultSet = statement.executeQuery(sql);
							while (resultSet.next())
							{
                                 String rev=resultSet.getString("review");
							    /* System.out.println(rev); */
							
						%>
						<tr >
							<td><%=resultSet.getString("Project_Name")%></td>
							<%-- <%System.out.println(resultSet.getString("Project_Name")); %> --%>
							<%if(rev.contains("Action")){ %>
							 
							<td><a href="frviewFRCalling.jsp?action=answer&ID=<%=resultSet.getLong("id")%>" ><span class="blink1"><%=resultSet.getString("fr_name")%></span></a></td>
							<%-- <td><a  href="frviewFRCalling.jsp?action=answer&ID=<%=resultSet.getLong("id")%>"><%=resultSet.getString("fr_name")%></td> --%>
							<%}else{ %> 
							   <td class='text-nowrap'><a href="frviewFRCalling.jsp?action=answer&ID=<%=resultSet.getLong("id")%>"><%=resultSet.getString("fr_name")%></a></td>
							 <%} %> 
							<td><%=resultSet.getString("col_19").replace("\n","<br>")%></td>  
							<td><%=resultSet.getString("review")%></td>
							 <%
                                 String date = resultSet.getString("dates");
                            %>  
							<td class='text-nowrap'><%= resultSet.getString("dates")%></td>
						</tr>
						<%
							}

						    } catch (Exception e) {
						      e.printStackTrace();
						    }
						%>
						</tbody>
					</table>
				</form> 
			</div>
		</div>
	</center>
	
<script src="jquery.js"></script>
	
<!-- searching Filter for FR wise  -->
 <script type="text/javascript">
  $(document).ready(function() {
      $("#searchBar").on("keyup", function() {
           var value = $(this).val().toLowerCase();
           
          $("#latlatData tr").filter(function() {
              $(this).toggle($(this).text()
              .toLowerCase().indexOf(value) > -1)
          }); 
      });
});
</script>  €ƒ
</body>
</html>