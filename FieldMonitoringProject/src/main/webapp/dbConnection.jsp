<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.w3c.dom.Node" %>

<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>


<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.

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
<title>HOURLY REPORT</title>
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


           #preloader{           
            background-image: url('pl1.gif');
            background-repeat: no-repeat;
            background-position: center center;
            background-size: 30%;
            height: 100vh;
            width: 100%;
            position: fixed;
            z-index: 100;
            opacity: 0.8;           
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



	<div id="preloader"></div>
	
	
	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">HOURLY REPORT</a>
	  <div id="rightNavBar">
	   <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
	</div>
	
	
	
	
		<!-- Masthead-->

		<div class="container-img">

			<div class="divider">
				<!--<img id="axislogo" src="AxisLogo.jpg" alt="AxisMyIndia_logo">-->
			 	<img id="axislogo" src="images/AxisLogo.png" alt="Axis logo image">
				
			<p class="subheading"
				id="topic-header">FIELD MONITORING OF FR AND SURVEYORS</p>
			</div>

		</div>
		
		
		
		
		<!-- legends -->
		<div class="main-box">
            <div class="boxx red"></div>
            <div class="properties">
            <p>Less than < <span id ="conditionOfRed">2</span></p> <!-- changed from 100px to 50px -->
            </div>
            <br>
            <div class="boxx blue"></div>
            <div class="properties">
            <p>Greater than > <span id ="conditionOfBlue">4</p> <!-- changed from 100px to 50px -->
            </div>
        </div>
	
	


	<!-- Time Hour-->

	<section class="page-section portfolio" id="portfolio">
		<div class="container">
		
		
		
		
		<!-- for fetching less than and greater than data from server  -->
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
		
		



			<%
			String projectName = request.getParameter("projectName");
			String frName = request.getParameter("frName");
			%>
			<h2 id="prjName"><%=projectName%></h2>



			<p>
				Grand Total : <span id="GDTotal">0</span>
			</p>
			
			<p>
				TODAY'S DATE: <span id="todaysDate">02-Aug-23</span>
			</p>
			<p>
				CURRENT TIME: <span id="currentTime">11:00 AM</span>
			</p>

			<p style="font-weight: bold" id="frName">
				FR :
				<%=name(frName)%>
				<span id="frStatus"></span>
			</p>
			
			
		
		
		
		
  <!--Fetching VidhanSabha Name -->			
	<%	
	//System.out.println(prjName);
	Connection con_sg=null;
	PreparedStatement ps_sg=null;
	ResultSet rs_sg=null;
	String vidhanSabhaName="";
	Connection con_capi=null;
	PreparedStatement ps_capi=null;
	ResultSet rs_capi=null;
	String min_value = request.getParameter("min_value");
	String vidhansabhaId="";
	
	
		try{
			
			
			
			
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");	
			String date_capi = java.time.LocalDate.now().toString();
			date_capi="%"+date_capi+"%";
			//System.out.println(date_capi);
	            ps_capi=con_capi.prepareStatement("SELECT *  FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ? LIMIT 1");
		        ps_capi.setString(1,projectName);
	           rs_capi=ps_capi.executeQuery();
	            String chklistId="";
				while(rs_capi.next()) {
					chklistId=rs_capi.getString("CHECKLIST_ID");		
				}				
				//System.out.println("id1 "+id1);    		
		        rs_capi.close();
		        ps_capi.close();
		        
		        
		
		       
				con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
				//System.out.println("connected");
				ps_sg =con_sg.prepareStatement("SELECT *  FROM `mainapp_project` WHERE `capi_checklist_id` LIKE ?");
				ps_sg.setString(1,chklistId);			
				rs_sg=ps_sg.executeQuery();
				
				
				String projectId="";
				while(rs_sg.next()) {
					projectId=rs_sg.getString("id");		
				}
				
				rs_sg.close();
				ps_sg.close();
				con_sg.close();
			
			
			
			
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
			//System.out.println("connected");
			ps_sg =con_sg.prepareStatement("SELECT checkpointid FROM `mainapp_vidhansabhacheckpoint` where project_id LIKE ?");
			ps_sg.setString(1, projectId);			
			rs_sg=ps_sg.executeQuery();
			
			while(rs_sg.next()) {
				vidhansabhaId=rs_sg.getString("checkpointid");		
			}
			
			rs_sg.close();
			ps_sg.close();
			con_sg.close();
			
			
	     	Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");	
			//String date_capi = java.time.LocalDate.now().toString();
			date_capi="%"+date_capi+"%";
			//System.out.println(date_capi);
	            ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME` LIKE ? ORDER BY `DATETIME` DESC LIMIT 1");
		        ps_capi.setString(1,min_value);
		        ps_capi.setString(2,frName);
		      ps_capi.setString(3,date_capi);
	           rs_capi=ps_capi.executeQuery();
	            String id1="";
				while(rs_capi.next()) {
					id1=rs_capi.getString("id1");		
				}				
				//System.out.println("id1 "+id1);    		
		        rs_capi.close();
		        ps_capi.close();
		        
		        
		        ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `id1` = ?");
		        ps_capi.setString(1,vidhansabhaId);
		        ps_capi.setString(2,id1);
	            rs_capi=ps_capi.executeQuery();
	           
				while(rs_capi.next()) {
					vidhanSabhaName=rs_capi.getString("value");		
				}
				//System.out.println("vidhanSabhaName "+vidhanSabhaName); 
			
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{			
			
			try{
				rs_sg.close();
				ps_sg.close();
				con_sg.close();
				
				rs_capi.close();
				ps_capi.close();
				con_capi.close();
				
				
			}catch(Exception e){
				System.out.println(e);
			}		
			
		}
	%>	
	
			<p style="font-weight: bold" id="frName">
				VS :
				<%=vidhanSabhaName%>				
			</p>
	
	
		
			

			<%@ page import="java.sql.*"%>
			<center>
				<div class="hr-table">

					<%
					int gdt=0;
					response.setContentType("text/html");
					out.println("<table id='main'>");

		

					Connection con = null;
					PreparedStatement ps = null;
					ResultSet rs = null;
					String GD = "$";

					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false", "root", "axis@123");
						String query = "SELECT a.EMP_ID, " + "b.EMP_NAME, "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '07:00:00' AND TIME(a.DATETIME) < '08:00:00' THEN 1 ELSE 0 END) AS '7-8', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '08:00:00' AND TIME(a.DATETIME) < '09:00:00' THEN 1 ELSE 0 END) AS '8-9', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '09:00:00' AND TIME(a.DATETIME) < '10:00:00' THEN 1 ELSE 0 END) AS '9-10', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '10:00:00' AND TIME(a.DATETIME) < '11:00:00' THEN 1 ELSE 0 END) AS '10-11', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '11:00:00' AND TIME(a.DATETIME) < '12:00:00' THEN 1 ELSE 0 END) AS '11-12', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '12:00:00' AND TIME(a.DATETIME) < '13:00:00' THEN 1 ELSE 0 END) AS '12-13', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '13:00:00' AND TIME(a.DATETIME) < '14:00:00' THEN 1 ELSE 0 END) AS '13-14', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '14:00:00' AND TIME(a.DATETIME) < '15:00:00' THEN 1 ELSE 0 END) AS '14-15', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '15:00:00' AND TIME(a.DATETIME) < '16:00:00' THEN 1 ELSE 0 END) AS '15-16', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '16:00:00' AND TIME(a.DATETIME) < '17:00:00' THEN 1 ELSE 0 END) AS '16-17', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '17:00:00' AND TIME(a.DATETIME) < '18:00:00' THEN 1 ELSE 0 END) AS '17-18', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '18:00:00' AND TIME(a.DATETIME) < '19:00:00' THEN 1 ELSE 0 END) AS '18-19', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '19:00:00' AND TIME(a.DATETIME) < '20:00:00' THEN 1 ELSE 0 END) AS '19-20', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '20:00:00' AND TIME(a.DATETIME) < '21:00:00' THEN 1 ELSE 0 END) AS '20-21', "
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '21:00:00' AND TIME(a.DATETIME) < '22:00:00' THEN 1 ELSE 0 END) AS '21-22',"
						+ "SUM(CASE WHEN TIME(a.DATETIME) >= '07:00:00' AND TIME(a.DATETIME) < '22:00:00' THEN 1 ELSE 0 END) AS '8-22' "
						+ "FROM `SAVE_SURVEY` a " + "JOIN EMP_MASTER b ON a.EMP_ID = b.EMP_ID "
						+ "WHERE a.`CHECKPOINT_ID` = ? AND a.`VALUE` = ? " + "AND a.DATETIME > ? AND a.DATETIME <= ? "
						+ "GROUP BY a.EMP_ID, b.EMP_NAME";

						ps = con.prepareStatement(query);
						ps.setString(1, min_value);
						ps.setString(2, frName);
						String date = java.time.LocalDate.now().toString();						
						ps.setString(3, date + " 00:00:00");
						ps.setString(4, date + " 22:00:00");
						rs = ps.executeQuery();

						//System.out.println(String.valueOf(k));

						int iz=1;
						out.println(
						"<tr><th>Name</th><th>7 to 8</th><th>8 to 9</th><th>9 to 10</th><th>10 to 11</th><th>11 to 12</th><th>12 to 1</th><th>1 to 2</th><th>2 to 3</th><th>3 to 4</th><th>4 to 5</th><th>5 to 6</th><th>6 to 7</th><th>7 to 8</th><th>8 to 9</th><th>9 to 10</th><th>Grand Total</th></tr>");
						while (rs.next()) {
							String name = rs.getString("EMP_NAME");
							String sd0 = rs.getString("7-8");
							String sd1 = rs.getString("8-9");
							String sd2 = rs.getString("9-10");
							String sd3 = rs.getString("10-11");
							String sd4 = rs.getString("11-12");
							String sd5 = rs.getString("12-13");
							String sd6 = rs.getString("13-14");
							String sd7 = rs.getString("14-15");
							String sd8 = rs.getString("15-16");
							String sd9 = rs.getString("16-17");
							String sd10 = rs.getString("17-18");
							String sd11 = rs.getString("18-19");
							String sd12 = rs.getString("19-20");
							String sd13 = rs.getString("20-21");
							String sd14 = rs.getString("21-22");
							GD = rs.getString("8-22");
						
							
							//System.out.println(name + " " + sd1 + " " + sd2 + " " + sd3 + " " + sd4 + " " + sd5 + " " + sd6 + " " + sd7
							//+ " " + sd8 + " " + sd9 + " " + sd10 + " " + sd11 + " " + GD);
							
							name=iz+") "+name;
							out.println("<tr><td >" + name + "</td><td>" + sd0 + "</td><td>" + sd1 + "</td><td>" + sd2 + "</td><td>" + sd3 + "</td><td>" + sd4
							+ "</td><td>" + sd5 + "</td><td>" + sd6 + "</td><td>" + sd7 + "</td><td>" + sd8 + "</td><td>" + sd9
							+ "</td><td>" + sd10 + "</td><td>" + sd11 + "</td><td>" + sd12 + "</td><td>" + sd13 + "</td><td>" + sd14
							+ "</td><td>" + GD + "</td></tr>");

							iz++;
						}
						out.println(
						"<tr><td>Total Count</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>");
						
						
						out.println("</table>");
						con.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
					<div>
			</center>




			<!--to show count in table -->
			<script>
		        function  countSurvey() {
		            var table = document.getElementById("main");
		            var rows = table.getElementsByTagName("tr");
			            for(let c=1;c<17;c++){
			            	let adCount=0;
							for(let r=1;r<rows.length-1;r++){
										var intValue = parseInt(rows[r].cells[c].textContent, 10);
										adCount+=intValue;
								}
							rows[rows.length-1].cells[c].textContent=adCount;
							}           
		   
		        }
		        
		        countSurvey();        
		        
		    </script>





			<!--showing activity status and color  -->
			<script>
    
		    function showActiveStatus(){
				var status=document.getElementById('frStatus');
				 status.textContent='(<%=activity(GD)%>)';
				  status.style.color ='<%=color(GD)%>';
		    }
		    
		    showActiveStatus();
		    
			</script>





			<!-- to bold the fr name   -->
			<script>
		    function FrNameBold() {
		        var table = document.getElementById("main");
		        var rows = table.getElementsByTagName("tr");
		        
		        var fr = '<%=name(frName)%>';
		        fr = fr.toUpperCase(); // Use toUpperCase() to convert to uppercase
		        
		        for (let r = 1; r < rows.length - 1; r++) {
		            if (rows[r].cells[0].textContent.toUpperCase() === fr) {
		                //rows[r].cells[0].style.color = "blue"; 
		                rows[r].cells[0].style.fontWeight = "bold"; 
		            }
		        }
		    }
		    
		    FrNameBold();
		</script>






			<div id="timestamp"></div>

			<br> <br> <br>
			<!--<h2>TEAMS MESSAGE STATUS AND ACTIONABLES:</h2>-->

	


			<!-- Java code to eliminate the number from fr name , and to show active or not , and coloring of fr status   -->
			<%!String name(String text) {
				if (!text.equals("Other"))
					return text.substring(2);
				else
					return text;
		
			}
		
			String activity(String gd) {
		
				if (gd.equals("$")) {
					return "Inactive";
				} else
					return "Active";
			}
		
			String color(String gd) {
				if (gd.equals("$"))
					return "Red";
				else
					return "Green";
			}%>




			<table id="second" width="1300">
				<tr>
					<th width="100">NAME\TIME</th>
					<th width="100">7-8</th>

					<th width="100">8-9</th>

					<th width="100">9-10</th>

					<th width="100">10-11</th>

					<th width="100">11-12</th>

					<th width="100">12-1</th>

					<th width="100">1-2</th>

					<th width="100">2-3</th>

					<th width="100">3-4</th>

					<th width="100">4-5</th>

					<th width="100">5-6</th>

					<th width="100">6-7</th>

					<th width="100">7-8</th>

					<th width="100">8-9</th>

					<th width="100">9-10</th>

				</tr>


				<tr>

					<td width="100">FR NAME</td>
					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>
					<td width="100"></td>
					<td width="100"></td>

					<!-- Add more data for each cell -->

				</tr>

				<tr>

					<td width="100">OPS MANAGER</td>
					
					<td width="100"></td>
					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>

					<td width="100"></td>
					<td width="100"></td>
				</tr>

			</table>


		</div>

<%
	String dept=(String)session.getAttribute("dept");
	String name=String.valueOf(session.getAttribute("name"));
	if(name.contains("Anchal") || name.contains("Soumyasree")){
%>
	    <div class="button-container">
 			 <a href="condi.jsp" class="button-link">Change Condition</a>
		</div>
	
		
	<%	
			}
	%>

	</section>



	<!-- for fetching less than and greater than data from server  -->
	<%
	String lessThan = "0";
	String greaterThan = "10";

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/new?useSSL=false", username, password);

		PreparedStatement ps2 = con2.prepareStatement("select * from conditionTable");
		ResultSet rs2 = ps2.executeQuery();

		while (rs2.next()) {
			lessThan = rs2.getString("lessThan");
			greaterThan = rs2.getString("greaterThan");

		}

		con2.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>




	<!-- to color the cell  -->

	<script>
        function highlightCells() {
            var table = document.getElementById("main");
            var rows = table.getElementsByTagName("tr");
            let name="";           
           
            const table2 = document.getElementById("second");
            
            <!-- to hide the second table  -->
            table2.style.display="none";
		    const rows2 = table2.getElementsByTagName("tr");
            let lessthan='<%=lessThan%>';
      		let greaterthan='<%=greaterThan%>';
      		
      		
      		
      		const cob=document.getElementById("conditionOfBlue");
      		const cor=document.getElementById("conditionOfRed");      		
      		cob.textContent=greaterthan;
      		cor.textContent=lessthan;
      		

			for (let r = 1; r < rows.length - 1; r++) {
				const now = new Date();
				const hour = now.getHours();
				let upto = hour - 8 + 2;
				console.log(hour);
				for (let c = 1; c < upto && c < 16; c++) {
					
					if (rows[r].cells[c].textContent < lessthan) {
						//rows[r].cells[c].style.backgroundColor="Red";
						rows[r].cells[c].style.color = "Red";
						rows[r].cells[c].style.fontWeight = "bold";
						name = rows[r].cells[0].textContent;
						// rows2[1].cells[c].style.backgroundColor="Green";
						rows2[1].cells[c].textContent = rows2[1].cells[c].textContent
								+ " Msg sent about " + name + ",";
						rows2[1].cells[c].style.color = "Green";
						// rows2[2].cells[c].style.backgroundColor="Green";
						rows2[2].cells[c].textContent = rows2[2].cells[c].textContent
								+ " Msg sent about " + name + ",";
						rows2[2].cells[c].style.color = "Green";
					}

					if (rows[r].cells[c].textContent > greaterthan) {
						//rows[r].cells[c].style.backgroundColor="Blue";
						rows[r].cells[c].style.color = "Blue";
						rows[r].cells[c].style.fontWeight = "bold";
						name = rows[r].cells[0].textContent;
						// rows2[1].cells[c].style.backgroundColor="Green";
						rows2[1].cells[c].textContent = rows2[1].cells[c].textContent
								+ " Msg sent about " + name + ",";
						rows2[1].cells[c].style.color = "Green";
						//rows2[2].cells[c].style.backgroundColor="Green";
						rows2[2].cells[c].textContent = rows2[2].cells[c].textContent
								+ " Msg sent about " + name + ",";
						rows2[2].cells[c].style.color = "Green";
					}
				}
			}
			

		}

		highlightCells();
	</script>





	<!--to show date and time  -->
	<script>
		function updateCurrentTime() {
			const currentDate = new Date();
			const formattedTime = currentDate.toLocaleTimeString([], {
				hour : '2-digit',
				minute : '2-digit',
				second : "2-digit"
			}); // Format the time as "hh:mm AM/PM"
			const currentTimeElement = document.getElementById('currentTime');
			currentTimeElement.textContent = formattedTime;
		}
		function updateTimestamp() {
			const currentDate = new Date();
			var formattedDate = currentDate.toISOString().slice(0, 10); // Format the date as "YYYY-MM-DD"			
			const todaysDateElement = document.getElementById('todaysDate');
			formattedDate=formattedDate.slice(8,10)+"-"+formattedDate.slice(5,7)+"-"+formattedDate.slice(0,4);
			todaysDateElement.textContent = formattedDate;
		}

		// Initial call to update the timestamp and current time
		updateTimestamp();
		updateCurrentTime();

		// Update the timestamp every hour (3600000 milliseconds)
		setInterval(updateTimestamp, 3600000);
		// Update the current time every second (1000 milliseconds)
		setInterval(updateCurrentTime, 1000);
	</script>




<% 
	
	if(!dept.equals("sm_02")){
%>




	<!--to export data in csv file -->
	<script>
		let csv = [];
		let table = document.getElementById("main");
		let tr = table.querySelectorAll("tr");

		let prjName = document.getElementById("prjName").textContent;

		var currentdate = new Date();
		let datetime = "Last Sync: " + currentdate.getDate() + "-"
				+ (currentdate.getMonth() + 1) + "-"
				+ currentdate.getFullYear() + " @ " + currentdate.getHours()
				+ ":" + currentdate.getMinutes() + ":"
				+ currentdate.getSeconds();

		let frName = document.getElementById("frName").textContent;
		csv.push(prjName);
		csv.push(datetime);
		csv.push(frName);

		for (let i = 0; i < tr.length; i++) {
			let cols = tr[i].querySelectorAll("th,td");
			let csvRow = [];
			for (let j = 0; j < cols.length; j++) {
				csvRow.push(cols[j].innerHTML)
			}
			csv.push(csvRow.join(","))
		}
	//	console.log(csv.join("\n"));

		let blob = new Blob([ csv.join("\n") ], {
			type : "text/csv"
		});
		let ce = document.createElement("a");
		ce.innerHTML = "Export Data";
		ce.download = "HourlyReport.csv"; // Added file extension
		ce.href = URL.createObjectURL(blob);

		ce.style.marginBottom = "10px"
		ce.style.color = "white";
		ce.style.backgroundColor = "purple";
		ce.style.padding = "10px 100px";
		ce.style.textDecoration = "none";
		ce.style.display = "inline-block";
		ce.style.justifyContent = "center";
		ce.style.position = "relative";
		ce.style.marginLeft = "42.5%";
		ce.style.borderRadius = "5px";

		document.body.appendChild(ce);
	</script>
	
	<% 	
	}
	%>

	<!-- Footer-->
    <footer style="background-color: black;">
        <div class="container" style="margin-top:20px">
          <div class="row">
            <div >
              <p style="color: white; text-align: center; padding-top: 10px;">Copyright &copy; 2023 Axis My India Ltd  </p>
            </div>
          </div>
        </div>
      </footer>


	
	
	
	    <script>
        var loader=document.getElementById("preloader");
        window.addEventListener('load',()=>{
                loader.style.display="block";
        })
    </script>

</body>
</html>