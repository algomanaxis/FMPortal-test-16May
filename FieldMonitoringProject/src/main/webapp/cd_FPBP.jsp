<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@ page import="java.time.LocalDate" %>    
<%@ page import="java.net.URI" %>
<%@ page import="java.net.http.HttpClient" %>
<%@ page import="java.net.http.HttpRequest" %>
<%@ page import="java.net.http.HttpResponse" %>
<% 
/* response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0. */
	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>HOURLY REPORT</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Date Wise Report</title>



<style>
.bg-violet {
	background-color: #E6E6FA;
}
</style>



<style>
#main {
	border-collapse: collapse;
}

#main th, #main td {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}

#main, #second {
	margin-bottom: 100px;
	padding-bottom: 200px;
}

.main-tab {
	margin-bottom: 100px;
	padding-bottom: 200px;
}

#project-header {
	display: flex;
	justify-content: center; /* Center horizontally */
	text-align: center;
	margin-top: 80px;
	margin-bottom: 40px;
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
</style>



<style>
table {
	border-collapse: collapse;
	width: 80%;
}

th, td {
	border: 1px solid black;
	text-align: center;
	padding: 8px;
}

th {
	background-color: purple;
	color: white;
	width: 200px;
}

tr:hover {
	background-color: #f5f5f5;
}

#mainTab {
	padding-bottom: 20px;
}

#second {
	font-size: 12px;
}
#date1{
	margin-left:20vh;
	font-size: 20px;
	
}
#todaysDate{
	font-size: 25px;
	font-weight:bold;
}
#time1{
	margin-left:20vh;
	font-size: 20px;
}
        #frName{
	        display: flex;
	         justify-content: center;
        }
        
         #prjName{
         	 display: flex;
	         justify-content: center;
	         margin-top: 80px;
			margin-bottom: 40px;
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
		
		#titleP{
			display: flex;
	justify-content: center;
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
    
    
    		#headerfR{
			 margin-bottom:-24px;
		}

		
		
		#details{
			margin-top:30px;
			margin-bottom:10px;
			
		}
		
		
		
		#latlongdiv{
			
			
		}
		
</style>


</head>
<body>

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
	
	
	
	
	
	<!-- to fetch username and password from xml-->	
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
	
	


	<!-- for fetching less than and greater than data from server  -->
	<%
        String lessThan ="2";
        String greaterThan="4";

        
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







	<%String projectName=request.getParameter("projectName"); %>
	
	<%String date=java.time.LocalDate.now().toString(); 
		//System.out.println(date);
		String min_value=request.getParameter("min_value");
		min_value = "'" + min_value.replace(",", "','") + "'";
	
	%>

	<h1 id="prjName"><%=projectName%> FP+BP</h1>
	<p id ="date1">
		DATE: <span id="todaysDate"><%=date%></span>
	</p>
	
	
	
	
	
	
	
	
	
			<!-- for fetching FR name from server  -->	   
     <%
		 Connection conFrName=null;		
		 
	     ArrayList<String> fRnameListnew=new ArrayList<>();
	     String temp_tlcheckpointnew="";
	     HashSet<String> set1=new HashSet<>();
	     ArrayList <String> newbothFrName=new ArrayList<>();
	   
	     
	     try {
	      	Class.forName("com.mysql.cj.jdbc.Driver");
	 			 conFrName=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");
	 			 
	 				PreparedStatement ps1 =conFrName.prepareStatement("SELECT tlcheckpoint FROM `algo_survey` WHERE project=? ");
	 				ps1.setString(1, projectName);
	 				ResultSet rs1=ps1.executeQuery();			
	 				  
	 				while(rs1.next()) {
	 					temp_tlcheckpointnew = rs1.getString("tlcheckpoint");	 					
	 				}
	 			
	 			    //System.out.println(temp_tlcheckpoint);
	 				
	 	 			rs1.close();
	 	 			ps1.close();
	 	            conFrName.close();
	 			
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		}
	     
	     
	     
	     try {
	      	Class.forName("com.mysql.cj.jdbc.Driver");
	 			 conFrName=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");		 
	 				//data base connection to fetch surveyor id
	 				PreparedStatement ps1 =conFrName.prepareStatement("SELECT VALUE FROM `CHECKPOINT` WHERE `CHECKPOINT_ID` IN"+"("+temp_tlcheckpointnew+")");                                  
	 				/* ps1.setString(1, temp_tlcheckpoint); */	 				
	 				//System.out.println(temp_tlcheckpoint);
	 				ResultSet rs1=ps1.executeQuery();
	 				
	 				while(rs1.next()) {
	 					//System.out.println('1');
	 					String tempFrList=rs1.getString("VALUE");
	 					fRnameListnew.add(tempFrList);
	 				}
	 				
	 				for(int i=0;i<fRnameListnew.size();i++){
		 					String allfrName[]=fRnameListnew.get(i).split(",");
		 					for(String str: allfrName){
		 						set1.add(str);
		 					}
	 				}
	 				
	 				for(String str: set1)newbothFrName.add(str);	 				
	 				// System.out.println(set1);
	 				
	 				
	 				//code that we need to write here down 
	 				//for(int i=0;i<bothFrName.size();i++)
	 					
	 			
	 				
	 				
	 				//System.out.println(temp_tlcheckpoint);	 					
	/*  		       arr=Arrays.stream(str.split(","))
	 		              .map(String::trim).collect(Collectors.toList()); */   
	 		                 
	 		    
	 		       rs1.close();
	 		       ps1.close();
	 	           conFrName.close();
	 	           
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		}  
	     %>
	

	<%
	int femaleTable=1111;
	//	List<String> myList= (List<String>)session.getAttribute("myList");
	
	List<String> myList=newbothFrName;
	//
	  	  for (int i=0;i<myList.size();i++ ) {	  		  
	  		String frName=myList.get(i);
	  		String constFrName=frName;
	  		if(frName.contains("99-TEST"))continue;	  		
	%>
	
	
	
	<%
	 Connection con=null;
     String prj_checkList="";
     try {
      	Class.forName("com.mysql.cj.jdbc.Driver");
 			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");
 			 
 				PreparedStatement ps1 =con.prepareStatement("SELECT checklistID FROM `algo_survey` WHERE project=? ");
 				ps1.setString(1, projectName);
 				ResultSet rs1=ps1.executeQuery();			
 				  
 				while(rs1.next()) {
 					prj_checkList = rs1.getString("checklistID");	 					
 				}
 			
 			    //System.out.println(prj_checkList);
 				
 	 			rs1.close();
 	 			ps1.close();
 	            con.close();
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
	%>
	
	
		
	  	 
  	 
  	 
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
	//String min_value = request.getParameter("min_value");
	String vidhansabhaId="";	
		try{
			
			String date_capi = java.time.LocalDate.now().toString();
				con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
				//System.out.println("connected");
				ps_sg =con_sg.prepareStatement("SELECT *  FROM `mainapp_project` WHERE `capi_checklist_id` IN"+"("+prj_checkList+")");
				//ps_sg.setString(1,chklistId);			
				rs_sg=ps_sg.executeQuery();
				
				
				String projectId="";
				while(rs_sg.next()) {
					projectId+=rs_sg.getString("id")+",";		
				}
				
				
				projectId=projectId.substring(0,projectId.length()-1);
				//System.out.println("came upto this"+projectId);
				
				rs_sg.close();
				ps_sg.close();
				
		
			ps_sg =con_sg.prepareStatement("SELECT checkpointid FROM `mainapp_vidhansabhacheckpoint` where project_id IN"+"("+projectId+")");		
			rs_sg=ps_sg.executeQuery();
			
			while(rs_sg.next()) {
				vidhansabhaId+=rs_sg.getString("checkpointid")+",";		
			}			
			vidhansabhaId=vidhansabhaId.substring(0,vidhansabhaId.length()-1);
			rs_sg.close();
			ps_sg.close();
			con_sg.close();
			
			
	     	Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");	
			date_capi = java.time.LocalDate.now().toString();
			date_capi="%"+date+"%";
			
			frName="%"+frName+"%";
				
	
	            ps_capi=con_capi.prepareStatement("SELECT *  FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN "+"("+min_value+")"+" AND `VALUE` LIKE ? AND `DATETIME` LIKE ? ORDER BY `DATETIME` DESC LIMIT 1");
	            
		        ps_capi.setString(1,frName);
		     	 ps_capi.setString(2,date_capi);
	          	 rs_capi=ps_capi.executeQuery();
	            String id1="";
				while(rs_capi.next()) {
					id1=rs_capi.getString("id1");
				}	
		        rs_capi.close();
		        ps_capi.close();
		        
		        
		        ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN "+"("+vidhansabhaId+")"+" AND `id1` = ?");

		        ps_capi.setString(1,id1);
	            rs_capi=ps_capi.executeQuery();
	           
				while(rs_capi.next()) {
					vidhanSabhaName+=rs_capi.getString("value")+",";		
				}
			
			
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




	<%@ page import="java.sql.*"%>
	<center id="frStatus_table<%=i%>">
		<div class="hr-table">

	<% 
    response.setContentType("text/html");
	%>
	
	<p style="font-weight:bold" id="frName" >FR : <%=name(constFrName)%> <span id="frStatus<%=i%>"></span> </p>	
				<p style="font-weight: bold" id="frName">
				 VS :
				<%=vidhanSabhaName%>				
			</p>

			<table class="main-tab" id="main<%=i%>">
				<% 
	
    con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String GD="$";
		
    try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false", "root", "axis@123");
		String query = "SELECT a.EMP_ID, " + "b.EMP_NAME, b.EMP_MOBILE, "
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
		+ "SUM(CASE WHEN TIME(a.DATETIME) >= '07:00:00' AND TIME(a.DATETIME) < '22:00:00' THEN 1 ELSE 0 END) AS '7-22' "
		+ "FROM `SAVE_SURVEY` a " + "JOIN EMP_MASTER b ON a.EMP_ID = b.EMP_ID "
		+ "WHERE a.`CHECKPOINT_ID` IN "+"("+min_value+")"+" AND a.`VALUE` = ? " + "AND a.DATETIME > ? AND a.DATETIME <= ? "
		+ "GROUP BY a.EMP_ID, b.EMP_NAME,b.EMP_MOBILE;";

		ps = con.prepareStatement(query);
		//ps.setString(1, min_value);
		//System.out.println(constFrName+" "+date);
		ps.setString(1, constFrName);						
		ps.setString(2, date + " 00:00:00");
		ps.setString(3, date + " 22:00:00");
		rs = ps.executeQuery();

		out.println(
		"<tr><th>Name</th><th>Emp Id</th><th>Contact No</th><th>7 to 8</th><th>8 to 9</th><th>9 to 10</th><th>10 to 11</th><th>11 to 12</th><th>12 to 1</th><th>1 to 2</th><th>2 to 3</th><th>3 to 4</th><th>4 to 5</th><th>5 to 6</th><th>6 to 7</th><th>7 to 8</th><th>8 to 9</th><th>9 to 10</th><th>Grand Total</th></tr>");
		while (rs.next()) {			
			String name = rs.getString("EMP_NAME");
			String EmpId=rs.getString("EMP_ID");
			String EmpContact=rs.getString("EMP_MOBILE");
			if(EmpContact.length()<2)EmpContact="Not Available";
			
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
			GD = rs.getString("7-22");
			
			
			/* System.out.println(name + " " + sd1 + " " + sd2 + " " + sd3 + " " + sd4 + " " + sd5 + " " + sd6 + " " + sd7
			+ " " + sd8 + " " + sd9 + " " + sd10 + " " + sd11 + " " + GD); */
			
			out.println("<tr><td>" + name + "</td><td style=\"color: green;\">" + EmpId + "</td><td>" + EmpContact + "</td><td>" + sd0 + "</td><td>" + sd1 + "</td><td>" + sd2 + "</td><td>" + sd3 + "</td><td>" + sd4
				    + "</td><td>" + sd5 + "</td><td>" + sd6 + "</td><td>" + sd7 + "</td><td>" + sd8 + "</td><td>" + sd9
				    + "</td><td>" + sd10 + "</td><td>" + sd11 + "</td><td>" + sd12 + "</td><td>" + sd13 + "</td><td>" + sd14
				    + "</td><td>" + GD + "</td></tr>");

		}
		
		
		out.println(
				"<tr><td colspan='3'>Total Count</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>");

				%>
			</table>
			<% 
		con.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	}	
	%>
		
			
	</center>

	<!--to show count in table -->
	<script>
        function  countSurvey(tableId) {
            var table = document.getElementById(tableId);
            var rows = table.getElementsByTagName("tr");
	            for(let c=3;c<19;c++){
	            	let adCount=0;
					for(let r=1;r<rows.length-1;r++){
								var intValue = parseInt(rows[r].cells[c].textContent, 10);
								adCount+=intValue;								
						}
					rows[rows.length-1].cells[c-2].textContent=adCount;
					
				}           
   
        }
        countSurvey("main<%=i%>");        
    </script>




	<!-- to color the cell  -->
	<script>
        function highlightCells(tableId) {
            var table = document.getElementById(tableId);
            var rows = table.getElementsByTagName("tr");                      

            let lessthan='<%=lessThan%>';
      		let greaterthan='<%=greaterThan%>';   		
      		
      		
      		const cob=document.getElementById("conditionOfBlue");
      		const cor=document.getElementById("conditionOfRed");      		
      		cob.textContent=greaterthan;
      		cor.textContent=lessthan;		
		
		for(let r=1;r<rows.length-1;r++){
			const now = new Date();
			const hour = now.getHours();
			let upto=hour-8+2+1;
			
			
			var todayDate = new Date().toISOString().slice(0, 10);
			//console.log(todayDate);
			
			//console.log("TD"+todayDate);
			var givendate='<%=date%>'
		//	console.log("GD"+givendate);
			 
		
						for(let c=3;c<upto && c< 18;c++){			
							if(rows[r].cells[c].textContent<lessthan ){						
								rows[r].cells[c].style.color="Red";
								rows[r].cells[c].style.fontWeight="bold";                 
							}					
							
							if( rows[r].cells[c].textContent>greaterthan ){						
								rows[r].cells[c].style.color="Blue";
								rows[r].cells[c].style.fontWeight="bold";	
							}
							
							if( rows[r].cells[c].textContent.length>1 ){						
								rows[r].cells[c].style.color="Blue";
								rows[r].cells[c].style.fontWeight="bold";	
							}
						}
	
			
			
			}           
   
        }
        
        highlightCells("main<%=i%>"); 
    </script>




	<!-- to bold the fr name   -->
	<script>
	    function FrNameBold(tableId) {
	        var table = document.getElementById(tableId);
	        var rows = table.getElementsByTagName("tr");
	        
	        var fr = '<%=name(frName)%>';
	        fr = fr.toUpperCase(); // Use toUpperCase() to convert to uppercase
	        
	        for (let r = 1; r < rows.length - 1; r++) {
	            if (rows[r].cells[0].textContent.toUpperCase() === fr) {
	                rows[r].cells[0].textContent=rows[r].cells[0].textContent +"(FR)";
	                rows[r].cells[0].style.fontWeight = "bold"; // Use lowercase "bold"
	                
	            }
	        }
	    }
	    
	    FrNameBold("main<%=i%>");
	</script>
	
	
	
	
	  <script>
    
		    function showActiveStatus(frStatus){
				var status=document.getElementById(frStatus);
				 status.textContent='(<%=activity(GD)%>)';
				  status.style.color ='<%=color(GD)%>';
		    }
		    
		    showActiveStatus("frStatus<%=i%>");
    
	</script>
	
	
	<!-- to hide inactive fr's table -->
	<script type="text/javascript">
		function hidingTableInfo(frSt){
			var tableStatus=document.getElementById(frSt);
			var temp='<%=activity(GD)%>';
			if(temp=='Inactive'){
				tableStatus.style.display="none";
			}
		}
	
		hidingTableInfo("frStatus_table<%=i%>");
	
	</script>
	
	
	



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




	<%
	}
	%>
	
	

	
	<!-- change condition button  -->
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
	


<% 
	if(!dept.equals("sm_02")){
%>
	
	<!-- to export the data  -->
	   <script>
        let csv = [];
        let prjName = document.getElementById("prjName").textContent;
        csv.push(prjName);

        var currentdate ='<%=date %>';            
        csv.push(currentdate);        
        
     
        for (let i = 0; i <<%=myList.size()%>; i++) {
            let table = document.getElementById("main" + i);
            let tr = table.querySelectorAll("tr");        

			
            for (let j = 0; j < tr.length; j++) {
                let cols = tr[j].querySelectorAll("th,td");
                let csvRow = [];
                for (let k = 0; k < cols.length; k++) {
                    csvRow.push(cols[k].innerHTML);
                }
                csv.push(csvRow.join(","));
            }
            
            
            csv.push(" ");
            csv.push(" ");
        }

        let blob = new Blob([csv.join("\n")], { type: "text/csv" });
        let ce = document.createElement("a");
        ce.innerHTML = "Export Data";
        ce.download = "HourlyReport.csv"; // Added file extension
        ce.href = URL.createObjectURL(blob);

        ce.style.marginBottom = "10px";
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- ***************************************Sampling Code  Start***************************************************** -->
    
    	 <%
		 class algo_sample{
			private String frName;
			private int scount;
			private int female;
			private int oFemale;
			private int shop;
			private int oShop;
			private int farmer;
			private int oFarmer;
			private int lv;
			private int olv;
			private int ls;
			private int ols;
			private int nv;
			private int onv;
			private String nl;
			private String onl;
			
			
			
			
			
			public algo_sample(String frName){
				this.frName=frName;
			}
			
			
			public String getFrName() {
				return frName;
			}
			public void setFrName(String frName) {
				this.frName = frName;
			}
			public int getScount() {
				return scount;
			}
			public void setScount(int scount) {
				this.scount = scount;
			}
			public int getFemale() {
				return female;
			}
			public void setFemale(int female) {
				this.female = female;
			}
			public int getoFemale() {
				return oFemale;
			}
			public void setoFemale(int oFemale) {
				this.oFemale = oFemale;
			}
			public int getShop() {
				return shop;
			}
			public void setShop(int shop) {
				this.shop = shop;
			}
			public int getoShop() {
				return oShop;
			}
			public void setoShop(int oShop) {
				this.oShop = oShop;
			}
			public int getFarmer() {
				return farmer;
			}
			public void setFarmer(int farmer) {
				this.farmer = farmer;
			}
			public int getoFarmer() {
				return oFarmer;
			}
			public void setoFarmer(int oFarmer) {
				this.oFarmer = oFarmer;
			}
			public int getLv() {
				return lv;
			}
			public void setLv(int lv) {
				this.lv = lv;
			}
			public int getOlv() {
				return olv;
			}
			public void setOlv(int olv) {
				this.olv = olv;
			}
			public int getLs() {
				return ls;
			}
			public void setLs(int ls) {
				this.ls = ls;
			}
			public int getOls() {
				return ols;
			}
			public void setOls(int ols) {
				this.ols = ols;
			}
			public int getNv() {
				return nv;
			}
			public void setNv(int nv) {
				this.nv = nv;
			}
			public int getOnv() {
				return onv;
			}
			public void setOnv(int onv) {
				this.onv = onv;
			}
			public String getNl() {
				return nl;
			}
			public void setNl(String nl) {
				this.nl = nl;
			}
			public String getOnl() {
				return onl;
			}
			public void setOnl(String onl) {
				this.onl = onl;
			}




			@Override
			public String toString() {
				return "[frName=" + frName + ", scount=" + scount + ", female=" + female + ", oFemale=" + oFemale
						+ ", shop=" + shop + ", oShop=" + oShop + ", farmer=" + farmer + ", oFarmer=" + oFarmer + ", lv="
						+ lv + ", olv=" + olv + ", ls=" + ls + ", ols=" + ols + ", nv=" + nv + ", onv=" + onv + ", nl=" + nl
						+ ", onl=" + onl + "]";
			}
			
		 }
	 %>



<%
	String[] prjSuffix=new String[2];
	HashMap<String, Integer> totalInterviewDoneFP =new HashMap<>();
	HashMap<String, Integer> totalInterviewDoneBP =new HashMap<>();	
	ArrayList<algo_sample> algo_fp=new ArrayList<>();
	ArrayList<algo_sample> algo_bp=new ArrayList<>();
	String finalPrjName="Project Name";
	prjSuffix[0]="FP";
	prjSuffix[1]="BP";
	String editedDate="";
	String addX="-";
	String addY="-";
	boolean fl=false;
	 String endDate="";
	for(String sfx: prjSuffix){
%>

<%
        String prjName=request.getParameter("projectName");
		finalPrjName=prjName;
	
		prjName=prjName+" "+sfx;
		//System.out.println(prjName);
		//String date=request.getParameter("inputDate");
		 editedDate=date.substring(8,10)+"-"+date.substring(5,7)+"-"+date.substring(0,4);
%>
	<div id='titleP'><h2><%=prjName%>(<%=editedDate%>)<h2></div>	
<% 

			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			String id ="";	
			String tlcodecheckpoint="";
			String gendercheckpoint="";
			String occupationcheckpoint="";			
			
			//fetching id from survey genius 
			try {
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
				 ps=con.prepareStatement("SELECT * FROM CHECKLIST_MASTER WHERE CHECKLIST_NAME LIKE ? limit 1");//Fetched Check List for the selected Project
				 ps.setString(1, prjName);
				 rs=ps.executeQuery();
				 String newId="";
				 while(rs.next()){					 
					 newId=rs.getString("CHECKLIST_ID");					 
				 }		 
				
				 //int temppo=Integer.parseInt(count);			 
				 //System.out.println(prjName+"**********"+newId);				 
				 rs.close();
				 ps.close();
				 
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");
			//	 ps=con.prepareStatement("SELECT id  FROM `mainapp_project` WHERE `name` LIKE ? ");
				 //ps.setString(1, prjName);
				 ps=con.prepareStatement("SELECT id  FROM `mainapp_project` WHERE `capi_checklist_id` LIKE ? ");
				 ps.setString(1, newId);
				 rs=ps.executeQuery();						 
				 while(rs.next()){
					 id=rs.getString("id");	 
					// System.out.println(id);
				 }
				 rs.close();
				 ps.close();
						
				 
				//fetching fr,gender,occupation from survey genius 
				 ps=con.prepareStatement("SELECT *  FROM `mainapp_projectspecificcheckpoints` WHERE `project_id`=? ORDER BY `id` DESC");
				 ps.setString(1, id);
				 rs=ps.executeQuery();

				 while(rs.next()){
					 tlcodecheckpoint=rs.getString("tlcodecheckpoint");
					 gendercheckpoint=rs.getString("gendercheckpoint");
					 occupationcheckpoint=rs.getString("occupationcheckpoint");
				 }				 
				 rs.close();
				 ps.close();		  
				
				 
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
				try {
					rs.close();
					ps.close();
					con.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}				
			}
			
			
			//System.out.println(id);
		//	System.out.println(prjName+"#############"+tlcodecheckpoint);
			//System.out.println(gendercheckpoint);
			//System.out.println(occupationcheckpoint);
			
			
			
		     String dontKnowId="";
		     String count="";
			 ArrayList<String> specificInterviewId=new ArrayList<>();
			 ArrayList<String> frNameList=new ArrayList<>();
			 ArrayList<Integer> interviewCount=new ArrayList<>();//interview count fr wise
			 ArrayList<String> allInterviewId=new ArrayList<>(); //all interview id fr wise
			 ArrayList<Integer> femalepercent=new ArrayList<>();
			 ArrayList<Integer> allFarmerPercent=new ArrayList<>();
			 ArrayList<Integer> shopPercentArray=new ArrayList<>();
			 ArrayList<Integer> overAllShopPercentArray=new ArrayList<>();
			 ArrayList<ArrayList<Integer>> dontknowFrWise=new ArrayList<>();
			 ArrayList<ArrayList<Integer>> overAllDontknowFrWise=new ArrayList<>();
			 ArrayList<Integer> femaleOverAllPercent=new ArrayList<>();
			 ArrayList<Integer> famerOverAllPercent=new ArrayList<>();
			
			 
			 // SELECT COUNT(CHK_ID) FROM CHECKLIST_MASTER WHERE CHECKLIST_NAME LIKE "prjName"
			 // FOR COUNT OF CHK_ID
			 // IF COUNT = 8 SELECT CHECKPOINT_ID FROM `CHECKLIST_MASTER` WHERE CHK_ID = (SELECT MAX(CHK_ID)-1 FROM `CHECKLIST_MASTER` WHERE CHECKLIST_name =?)");
			 // IF COUNT = 9 SELECT CHECKPOINT_ID FROM `CHECKLIST_MASTER` WHERE CHK_ID = (SELECT MAX(CHK_ID)-2 FROM `CHECKLIST_MASTER` WHERE CHECKLIST_name =?)");
			
			
			try {
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
				 ps=con.prepareStatement("SELECT COUNT(CHK_ID) FROM CHECKLIST_MASTER WHERE CHECKLIST_NAME LIKE ?");
				 ps.setString(1, prjName);
				 rs=ps.executeQuery();
				 
				 while(rs.next()){					 
					 count=rs.getString("COUNT(CHK_ID)");
				 }
				 
				 int temppo=Integer.parseInt(count);
		
				 
				// System.out.println(prjName+"**********///////"+count);
				 
				 rs.close();
				 ps.close();
				 
				 
				 
				 if(temppo==8){
					 ps=con.prepareStatement("SELECT CHECKPOINT_ID FROM `CHECKLIST_MASTER` WHERE CHK_ID = (SELECT MAX(CHK_ID)-1 FROM `CHECKLIST_MASTER` WHERE CHECKLIST_name =?)");
					 ps.setString(1, prjName);	 
				}else if(temppo==9){
					 ps=con.prepareStatement("SELECT CHECKPOINT_ID FROM `CHECKLIST_MASTER` WHERE CHK_ID = (SELECT MAX(CHK_ID)-2 FROM `CHECKLIST_MASTER` WHERE CHECKLIST_name =?)");
					 ps.setString(1, prjName);					 
				}else {
					ps=con.prepareStatement("SELECT CHECKPOINT_ID FROM `CHECKLIST_MASTER` WHERE CHK_ID = (SELECT MAX(CHK_ID)-2 FROM `CHECKLIST_MASTER` WHERE CHECKLIST_name =?)");
					 ps.setString(1, prjName);	
					
				}

				 
				 rs=ps.executeQuery();
				 String dontKnow="";
				 while(rs.next()){					 
					 dontKnowId=rs.getString("CHECKPOINT_ID");
				 }
				 
				 
				// System.out.println(dontKnowId);
				// System.out.println(dontKnowId);
				 rs.close();
				 ps.close();
				 
				
				 if(fl==false){
					 endDate=date+" "+"23:59:59";
					 date=date+" "+"00:00:00";
				 	fl=true;
				 }
				 
				 
				 
				 
				 
				 
				 //debug here				 
				 
				 //System.out.println(prjName+"--------"+date+"-------"+endDate+"-----"+tlcodecheckpoint);
				 ps=con.prepareStatement("SELECT *  FROM `SAVE_SURVEY` WHERE `DATETIME` >=? AND  `DATETIME` <= ? AND CHECKPOINT_ID=?");
			     ps.setString(1,date);
			     ps.setString(2,endDate);
				 ps.setString(3,tlcodecheckpoint);
				 rs=ps.executeQuery();				 
				 while(rs.next()){
					 specificInterviewId.add(rs.getString("id1"));	 
				 }				 
				// System.out.println(prjName+"*********"+specificInterviewId.size());				 
				 rs.close();
				 ps.close();
				 
				 
				 //System.out.println(tlcodecheckpoint);
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 
				 ps=con.prepareStatement("SELECT DISTINCT(VALUE) FROM `SAVE_SURVEY` WHERE CHECKPOINT_ID=? AND `DATETIME` >=? AND  `DATETIME` <= ?");
				 ps.setString(1,tlcodecheckpoint);
				 ps.setString(2,date);
				 ps.setString(3,endDate);
				 rs=ps.executeQuery();				 
				 while(rs.next()){
					 frNameList.add(rs.getString("VALUE"));
				 }				 
				 rs.close();
				 ps.close();				 
				 
				 //System.out.println(prjName+"*********"+frNameList); //fr name array
				 
				 
				 
				 
				 //for fetching survey interview count and female count %
				 for(int i=0;i<frNameList.size();i++){
					 String currentFrName=frNameList.get(i);	
					// System.out.println(endDate);
					 ps=con.prepareStatement("SELECT id1 FROM `SAVE_SURVEY` WHERE `DATETIME` >=? AND  `DATETIME` <= ? AND CHECKPOINT_ID=? AND VALUE=?");					 
				     ps.setString(1,date);
				     ps.setString(2,endDate);
					 ps.setString(3,tlcodecheckpoint);
					 ps.setString(4,currentFrName);
					 rs=ps.executeQuery();
					 ArrayList<String> temp=new ArrayList<>();
					 String tempInterview="";
					 
					 while(rs.next()){
						 tempInterview=rs.getString("id1")+","+tempInterview;
						 temp.add(rs.getString("id1"));
					 }
					 
					 rs.close();
					 ps.close();
					 interviewCount.add(temp.size()); 			 
					 tempInterview= "("+tempInterview.substring(0,tempInterview.length()-1)+")";
					 allInterviewId.add(tempInterview);
					//System.out.println(tempInterview);
					 
					 ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE '%2-FEMALE%' AND `id1` IN" +tempInterview);
					 ps.setString(1,gendercheckpoint);		  
					 rs=ps.executeQuery();
					 
					 String ans="0";
					 while(rs.next()){
						ans=rs.getString("COUNT(VALUE)");	 
					 }
					 //Computation begins
					
					Double femaleCount=Double.parseDouble(ans);
					Double interviewTaken=Double.valueOf(interviewCount.get(i));
					Double femalePerc=((femaleCount)/interviewTaken)*100;
					Double newData = new Double(femalePerc);
					int value = (int)Math.round(newData);
					//System.out.println(value);
					femalepercent.add(value);//female percent array
					rs.close();
					ps.close();
					
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE '%FARMER%' AND `id1` IN "+tempInterview);
					ps.setString(1, occupationcheckpoint);
					
					rs=ps.executeQuery();
					String temp2="0";
					while(rs.next()){
						temp2=rs.getString("COUNT(VALUE)");
					}
					
					Double farmerPercent=Double.valueOf(Integer.parseInt(temp2)*100)/Double.valueOf(interviewCount.get(i));
					
					int tttt=(int)Math.round(farmerPercent);
					allFarmerPercent.add(tttt);
					rs.close();
					ps.close();				
					
					
					
		
					
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` IN ('14-SELF OCCUPATION','9-SMALL SHOP (TEA STALL/PAN SHOP/SALOON/DHABA/ROADSIDE/HAWKERS/VEGETABLE SELLER/FRUIT SELLER)') AND ID1 IN "+tempInterview);
					ps.setString(1, occupationcheckpoint);
					rs=ps.executeQuery();
					String temp4="";
					while(rs.next()){
						temp4=rs.getString("COUNT(VALUE)");
					}
					
					double shopPercent=Double.valueOf(Integer.parseInt(temp4)*100)/Double.valueOf(interviewCount.get(i));
					
					
					int shopCount=(int)Math.round(shopPercent);					
					//System.out.println(shopCount);					
					shopPercentArray.add(shopCount);	
					rs.close();
					ps.close();
					
					
				ArrayList<Integer> donKnowPercentage=new ArrayList<>();
				String dontknowValue[]=dontKnowId.split(",");	
				//fetching dont know %					
				if(dontknowValue.length==3){
					//last vs dont know count 
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					ps.setString(1,dontknowValue[0]);
					rs=ps.executeQuery();
					String output="";
					while(rs.next()){
						output=rs.getString("COUNT(VALUE)");
					}					
					double lastVS=Double.valueOf(Integer.parseInt(output)*100)/Double.valueOf(interviewCount.get(i));					
					int lastVSRoundOf=(int)Math.round(lastVS);
					donKnowPercentage.add(lastVSRoundOf);
					rs.close();
					ps.close();
					
					
					
					
					
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					String dontknowSecondId=dontknowValue[1];
					String mmo=dontknowSecondId.substring(1);
					ps.setString(1,mmo);
					rs=ps.executeQuery();
					String output1="";
					while(rs.next()){
						output1=rs.getString("COUNT(VALUE)");
					}					
					double lastLS=Double.valueOf(Integer.parseInt(output1)*100)/Double.valueOf(interviewCount.get(i));
					int lastLSRoundOf=(int)Math.round(lastLS);
					donKnowPercentage.add(lastLSRoundOf);
					rs.close();
					ps.close();
					
					
					
					
					//System.out.println(tempInterview);
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					String dontknowThirdId=dontknowValue[2];
					
					String mm=dontknowThirdId.substring(1);
					//System.out.println(mm);
					ps.setString(1,mm);
					rs=ps.executeQuery();
					String output2="";
					while(rs.next()){
						output2=rs.getString("COUNT(VALUE)");
					}					
					double nextVS=Double.valueOf(Integer.parseInt(output2)*100)/Double.valueOf(interviewCount.get(i));
					//System.out.println(nextVS);
					int nextVSRoundOf=(int)Math.round(nextVS);
					donKnowPercentage.add(nextVSRoundOf);
					rs.close();
					ps.close();
					
					
					//System.out.println(donKnowPercentage);
					
					
				}else if(dontknowValue.length==4){
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					ps.setString(1,dontknowValue[0]);
					rs=ps.executeQuery();
					String output="";
					while(rs.next()){
						output=rs.getString("COUNT(VALUE)");
					}					
					double lastVS=Double.valueOf(Integer.parseInt(output)*100)/Double.valueOf(interviewCount.get(i));
					
					int lastVSRoundOf=(int)Math.round(lastVS);
					donKnowPercentage.add(lastVSRoundOf);
					rs.close();
					ps.close();
					
					
					
					
					
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					String dontknowSecondId=dontknowValue[1];
					ps.setString(1,dontknowSecondId.substring(1));
					rs=ps.executeQuery();
					String output1="";
					while(rs.next()){
						output1=rs.getString("COUNT(VALUE)");
					}					
					double lastLS=Double.valueOf(Integer.parseInt(output1)*100)/Double.valueOf(interviewCount.get(i));
					int lastLSRoundOf=(int)Math.round(lastLS);
					donKnowPercentage.add(lastLSRoundOf);
					rs.close();
					ps.close();
					
					
					
					
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					String dontknowThirdId=dontknowValue[2];
					String mm=dontknowThirdId.substring(1);
				//	System.out.println(mm);
					ps.setString(1,mm);
					rs=ps.executeQuery();
					String output2="";
					while(rs.next()){
						output2=rs.getString("COUNT(VALUE)");
					}					
					double nextVS=Double.valueOf(Integer.parseInt(output2)*100)/Double.valueOf(interviewCount.get(i));
					int nextVSRoundOf=(int)Math.round(nextVS);
					donKnowPercentage.add(nextVSRoundOf);
					rs.close();
					ps.close();
					
					
					
					
					
					
					ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempInterview);					
					String dontknowFourthId=dontknowValue[3];
					ps.setString(1,dontknowThirdId.substring(1));
					rs=ps.executeQuery();
					String output3="";
					while(rs.next()){
						output3=rs.getString("COUNT(VALUE)");
					}					
					double nextLS=Double.valueOf(Integer.parseInt(output3)*100)/Double.valueOf(interviewCount.get(i));
					int nextLSRoundOf=(int)Math.round(nextLS);
					donKnowPercentage.add(nextLSRoundOf);
					rs.close();
					ps.close();					
					
					//System.out.println(donKnowPercentage);
							 
				}				
				
				dontknowFrWise.add(donKnowPercentage);
				
					
		}
				
		 
				 
				
				 
				 //for fetching over all female count % and over all farmer count % and over all dont know 

				 for(int i=0;i<frNameList.size();i++){
					 String currentFrName=frNameList.get(i);
					 ps=con.prepareStatement("SELECT *  FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME` <= ? ");
					 ps.setString(1,tlcodecheckpoint);
					 ps.setString(2,currentFrName);
					 ps.setString(3,endDate);
					 rs=ps.executeQuery();
					 String tempOverAllTuple="";
					 ArrayList<String> overAllFemaleId=new ArrayList<>();
					 int countOverAllId=0; 
					 while(rs.next()){
						 tempOverAllTuple=rs.getString("id1")+","+tempOverAllTuple;						
						 overAllFemaleId.add(rs.getString("id1"));						 
					 }
					 countOverAllId= overAllFemaleId.size();
					 
					 
					 //totalInterviewDone.put(currentFrName,totalInterviewDone.getOrDefault(currentFrName, 0)+1);
					 
					 
					 if(sfx.contains("FP")){
						 if(totalInterviewDoneFP.containsKey(currentFrName)){
							 totalInterviewDoneFP.put(currentFrName,totalInterviewDoneFP.get(currentFrName)+ countOverAllId);
						 }else {
							 totalInterviewDoneFP.put(currentFrName, countOverAllId); 
						 }
					 }else {
						 if(totalInterviewDoneBP.containsKey(currentFrName)){
							 totalInterviewDoneBP.put(currentFrName,totalInterviewDoneBP.get(currentFrName)+ countOverAllId);
						 }else {
							 totalInterviewDoneBP.put(currentFrName, countOverAllId); 
						 } 
					 }
					 
					 
					//System.out.println(prjName+"***"+countOverAllId);
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					 tempOverAllTuple= "("+tempOverAllTuple.substring(0,tempOverAllTuple.length()-1)+")";					
					
					 
					 rs.close();
					 ps.close();
					 
					 
					 ps=ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE '%2-FEMALE%' AND `id1` IN" +tempOverAllTuple);
					 ps.setString(1,gendercheckpoint);		  
					 rs=ps.executeQuery();
					 
					 String ans="0";
					 while(rs.next()){
						ans=rs.getString("COUNT(VALUE)");	 
					 }
					 
					 Double temp1=Double.valueOf(Integer.parseInt(ans)*100)/ Double.valueOf(countOverAllId);	 	 
					 int ttp=(int)Math.round(temp1);
					 femaleOverAllPercent.add(ttp);
					 
					 rs.close();
				 	 ps.close();
				 	 
				 	 
				 	 
				 	 
				 	 
				
				 	  //overall farmer percent count 
					 ps=ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE '%FARMER%' AND `id1` IN" +tempOverAllTuple);
					 ps.setString(1,occupationcheckpoint);		  
					 rs=ps.executeQuery();
					 
					 String ans1="0";
					 while(rs.next()){
						ans1=rs.getString("COUNT(VALUE)");	 
					 }
					 
					 
					 Double temp3=Double.valueOf(Integer.parseInt(ans1)*100)/Double.valueOf(countOverAllId);
					 int farmertt=(int)Math.round(temp3);
					 famerOverAllPercent.add(farmertt);
					 
					 rs.close();
				 	 ps.close();
				 	 
				 	 				 	 
				 	 //overall shop percent count 
						ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` IN ('14-SELF OCCUPATION','9-SMALL SHOP (TEA STALL/PAN SHOP/SALOON/DHABA/ROADSIDE/HAWKERS/VEGETABLE SELLER/FRUIT SELLER)') AND ID1 IN "+tempOverAllTuple);
						ps.setString(1, occupationcheckpoint);
						rs=ps.executeQuery();
						
						String temp5="0";
						while(rs.next()){
							temp5=rs.getString("COUNT(VALUE)");
						}					
						double shopPercent=Double.valueOf(Integer.parseInt(temp5)*100)/Double.valueOf(countOverAllId);
						int shopCount=(int)Math.round(shopPercent);
						overAllShopPercentArray.add(shopCount);
						
	
						rs.close();
						ps.close();
						
						
						
						//overall dontknow %
						ArrayList<Integer> overAllDonKnowPercentage=new ArrayList<>();
						String dontknowValue[]=dontKnowId.split(",");	
						
						//fetching dont know %					
						if(dontknowValue.length==3){
							//last vs dont know count 
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							ps.setString(1,dontknowValue[0]);
							rs=ps.executeQuery();
							String output="";
							
							while(rs.next()){
								output=rs.getString("COUNT(VALUE)");
							}
							
							double lastVS=Double.valueOf(Integer.parseInt(output)*100)/Double.valueOf(countOverAllId);					
							int lastVSRoundOf=(int)Math.round(lastVS);
							overAllDonKnowPercentage.add(lastVSRoundOf);
							rs.close();
							ps.close();
							
							
							
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							String dontknowSecondId=dontknowValue[1];
							ps.setString(1,dontknowSecondId.substring(1));
							rs=ps.executeQuery();
							String output1="";
							while(rs.next()){
								output1=rs.getString("COUNT(VALUE)");
							}					
							double lastLS=Double.valueOf(Integer.parseInt(output1)*100)/Double.valueOf(countOverAllId);
							int lastLSRoundOf=(int)Math.round(lastLS);
							overAllDonKnowPercentage.add(lastLSRoundOf);
							rs.close();
							ps.close();
							
							
							
							
							
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							String dontknowThirdId=dontknowValue[2];
							ps.setString(1,dontknowThirdId.substring(1));
							rs=ps.executeQuery();
							String output2="";
							while(rs.next()){
								output2=rs.getString("COUNT(VALUE)");
							}					
							double nextVS=Double.valueOf(Integer.parseInt(output2)*100)/Double.valueOf(countOverAllId);
							//System.out.println(nextVS);
							int nextVSRoundOf=(int)Math.round(nextVS);
							overAllDonKnowPercentage.add(nextVSRoundOf);
							rs.close();
							ps.close();
							
							
							//System.out.println(donKnowPercentage);
							
							
						}else if(dontknowValue.length==4){
							
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							ps.setString(1,dontknowValue[0]);
							rs=ps.executeQuery();
							String output="";
							while(rs.next()){
								output=rs.getString("COUNT(VALUE)");
							}					
							double lastVS=Double.valueOf(Integer.parseInt(output)*100)/Double.valueOf(countOverAllId);					
							int lastVSRoundOf=(int)Math.round(lastVS);
							overAllDonKnowPercentage.add(lastVSRoundOf);
							rs.close();
							ps.close();
							
							
							
							
							
							
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							String dontknowSecondId=dontknowValue[1];
							ps.setString(1,dontknowSecondId.substring(1));
							rs=ps.executeQuery();
							String output1="";
							while(rs.next()){
								output1=rs.getString("COUNT(VALUE)");
							}					
							double lastLS=Double.valueOf(Integer.parseInt(output1)*100)/Double.valueOf(countOverAllId);
							int lastLSRoundOf=(int)Math.round(lastLS);
							overAllDonKnowPercentage.add(lastLSRoundOf);
							rs.close();
							ps.close();
							
							
							
							
							
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							String dontknowThirdId=dontknowValue[2];
							ps.setString(1,dontknowThirdId.substring(1));
							rs=ps.executeQuery();
							String output2="";
							while(rs.next()){
								output2=rs.getString("COUNT(VALUE)");
							}					
							double nextVS=Double.valueOf(Integer.parseInt(output2)*100)/Double.valueOf(countOverAllId);
							int nextVSRoundOf=(int)Math.round(nextVS);
							overAllDonKnowPercentage.add(nextVSRoundOf);
							rs.close();
							ps.close();
							
							
							
							
							
							
							ps=con.prepareStatement("SELECT COUNT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND VALUE  LIKE '%DON%' AND VALUE  LIKE '%KNOW%' AND `id1` IN"+tempOverAllTuple);					
							String dontknowFourthId=dontknowValue[3];
							ps.setString(1,dontknowThirdId.substring(1));
							rs=ps.executeQuery();
							String output3="";
							while(rs.next()){
								output3=rs.getString("COUNT(VALUE)");
							}					
							double nextLS=Double.valueOf(Integer.parseInt(output3)*100)/Double.valueOf(countOverAllId);
							int nextLSRoundOf=(int)Math.round(nextLS);
							overAllDonKnowPercentage.add(nextLSRoundOf);
							rs.close();
							ps.close();					
							
							//System.out.println(donKnowPercentage);
							
									 
						}				
						
						overAllDontknowFrWise.add(overAllDonKnowPercentage);							 
				 }
				 
				 
				 
				/*  System.out.println(prjName+"**********");			
				 
		
				 System.out.println("Fr name : "+frNameList);
				 System.out.println("interview count : "+interviewCount);
				 System.out.println("Female percent :"+femalepercent);
				System.out.println("overl all Female percent :"+femaleOverAllPercent);				 				
				 System.out.println("shop percent "+shopPercentArray);
				 System.out.println("over all shop percent "+overAllShopPercentArray);
				 System.out.println("farmer percent :"+allFarmerPercent);
				 System.out.println("over all farmer percent  :"+famerOverAllPercent);
				 System.out.println("Dont Know Percentage  :"+dontknowFrWise.get(0));				
				 System.out.println("Over all Dont Know Percentage  :"+overAllDontknowFrWise.get(0)); */
				 
			
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					ps.close();
					con.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}

%>



<center>
				<div class="SamplingTable">

					<%
					response.setContentType("text/html");
					String idtable="'"+sfx+"'";
					out.println("<table class='main' id="+sfx+">");

					int index=0;
					int lastD=0;
					int lastDD=0;
					boolean flag=false;
					out.println("<th colspan='17'>Sampling Report</th>");
					out.println("<tr><th colspan='3'>"+prjName+"</th><th colspan='2' font size='20px'>Female</th> <th colspan='2'>Occupation</th><th colspan='2'>Farmer</th> <th colspan='2'>To voted in last Vidansabha election <br>(only don't know)</th><th colspan='2'>To voted in last Loksabha election <br>(only don't know) </th><th colspan='2'>Will vote in next Vidansabha election <br>(only don't know)</th><th colspan='2'>Will vote in next Loksabha election <br>(only don't know)</th></tr>");
					out.println("<tr><th>SR.NO</th><th>Team Leader</th><th>Survey Interview Count</th><th>Female<span style='font-size:10px;'>("+editedDate+")</span></th><th>Female(Overall)</th><th>Small Shop+ Self Occupation<span style='font-size:10px;'>("+editedDate+")</span></th><th>Small Shop+ Self Occupation(Overall)</th><th>Farmer <span style='font-size:10px;'>("+editedDate+")</span></th><th>Farmer(Overall)</th><th  font size='10px'>"+editedDate+"</th><th>Overall</th><th font size='10px'>"+editedDate+"</th><th>overall</th><th font size='10px'>"+editedDate+"</th><th>Overall</th><th font size='10px'>"+editedDate+"</th><th>overall</th></tr>");
						
						while (index<frNameList.size()) {
							int srNo=index+1;
							String frName1 = frNameList.get(index);
							//if(frName1.equals("99-TEST")){index++; continue;}
							int surveyCount = interviewCount.get(index);
							int femalePer = femalepercent.get(index);
							int femalCount=femalePer*surveyCount/100;
							int overAllFemalePer = femaleOverAllPercent.get(index);
							int shopPer = shopPercentArray.get(index);
							int overAllShopPer =overAllShopPercentArray.get(index);
							int farmerPer = allFarmerPercent.get(index);
							int overAllFarmerPer = famerOverAllPercent.get(index);
							
							int a=0;
							int b=0;
							int c=0;
							String d="-";
							int aa=0;
							int bb=0;
							int cc=0;
							String dd="-";
						
							
							if(dontknowFrWise.get(index).size()==3){
								 a=dontknowFrWise.get(index).get(0);
								 b=dontknowFrWise.get(index).get(1);
								 c=dontknowFrWise.get(index).get(2);								
								
								 aa=overAllDontknowFrWise.get(index).get(0);
								 bb=overAllDontknowFrWise.get(index).get(1);
								 cc=overAllDontknowFrWise.get(index).get(2);	
							}
							
							
							
							if(dontknowFrWise.get(index).size()==4){
								flag=true;
								 a=dontknowFrWise.get(index).get(0);
								 b=dontknowFrWise.get(index).get(1);
								 c=dontknowFrWise.get(index).get(2);
								 lastD+=dontknowFrWise.get(index).get(3);
								 d=String.valueOf(dontknowFrWise.get(index).get(3));
								
								 aa=overAllDontknowFrWise.get(index).get(0);
								 bb=overAllDontknowFrWise.get(index).get(1);
								 cc=overAllDontknowFrWise.get(index).get(2);
								 lastDD+=overAllDontknowFrWise.get(index).get(3);
								 dd=String.valueOf(overAllDontknowFrWise.get(index).get(3));
							}
						
							//String temFemale=femalCount+"("+femalePer+"%)";
							out.println("<tr><td  >" + srNo + "</td><td>" + frName1 + "</td><td>" + surveyCount + "</td><td>" + femalePer + "%</td><td>" + overAllFemalePer + "%</td><td>" + shopPer
							+ "%</td><td>" + overAllShopPer + "%</td><td>" + farmerPer + "%</td><td>" + overAllFarmerPer + "%</td><td>" +a+ "%</td><td>" + aa
							+ "%</td><td>" + b + "%</td><td>" + bb + "%</td><td>" + c + "%</td><td>" + cc + "%</td><td>" + d + "%</td><td>" + dd + "%</td></tr>");
								
							algo_sample temp=new algo_sample(frName1);
							temp.setScount(surveyCount);
							temp.setFemale(femalePer);
							temp.setoFemale(overAllFemalePer);
							temp.setShop(shopPer);
							temp.setoShop(overAllShopPer);
							temp.setFarmer(farmerPer);
							temp.setoFarmer(overAllFarmerPer);
							temp.setLv(a);
							temp.setOlv(aa);
							temp.setLs(b);
							temp.setOls(bb);
							temp.setNv(c);
							temp.setOnv(cc);
							temp.setNl(d);							
							temp.setOnl(dd);
							
							
							
							if(sfx.contains("FP")){
									algo_fp.add(temp);
							}else {
								algo_bp.add(temp);
							}
							
							
							index++;
						}
						
						
						
						String x="-";
						String y="-";
						if(flag==true){
							x=String.valueOf(lastD/frNameList.size())+"%";
							addX=x;
							y=String.valueOf(lastDD/frNameList.size())+"%";
							addY=y;
						}
						out.println(
						"<tr id='total' ><td colspan='2' >Total Count</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>"+x+"</td><td>"+y+"</td></tr>");

						out.println("</table>");
					%>
					
					<br/>
					<br/>
						<br/>
					<br/>
			</div>
			
</center>





</div>
<!-- <div><button id ="btn">Download</button></div> -->



<% 
	 dept=(String)session.getAttribute("dept");
	//System.out.println(dept);
%>



	<!--to show download button -->
	<script type="text/javascript">
			function  showingBtn() {
			    var btt = document.getElementById("btn");
			    var depp='<%=dept%>';
			  //  console.log(depp);
			    if(depp=="sm_02"){
					btt.style.display="none";
				}
			}		        
			showingBtn();
	</script>



			<!--to show count in table -->
			<script>
		        function  countSurvey() {
		            var table = document.getElementById("<%=sfx%>");
		            var rows = table.getElementsByTagName("tr");
			            for(let c=2;c<17;c++){
			            	let adCount=0;
							for(let r=3;r<rows.length-1;r++){
										var intValue = parseInt(rows[r].cells[c].textContent, 10);
										adCount+=intValue;
								}
							if((c-1)==1)rows[rows.length-1].cells[c-1].textContent=adCount;
							else {
								rows[rows.length-1].cells[c-1].textContent=Math.round(adCount/<%=frNameList.size()%>)+"%";
								
							}
					}           
		   
		        }		        
		        countSurvey();
		        
		        
		        
		        
		        <!--color coding for female, small shop, donknow-->
		       function  colorCoding(){
		            var table = document.getElementById("<%=sfx%>");
		            var rows = table.getElementsByTagName("tr");
		    	   for(let r=3;r<rows.length-1;r++){
		    		   let var1=rows[r].cells[3].textContent.substring(0,rows[r].cells[3].textContent.length-1);	    		  
		    		 
		    		   
		    		   <!--to color the female-->
		    		   if(var1<20){		    			  
		    			   rows[r].cells[3].style.color="red";   
		    		   }   		   
		    	
		    		   if(var1>20){		    			  
		    			   rows[r].cells[3].style.color="blue";   
		    		   }
		    		   
		    		   
		    		   <!--to color the small shop-->   
		    		   let var2=rows[r].cells[5].textContent.substring(0,rows[r].cells[3].textContent.length-1);	
		    		   if(var2>=10){		    			 
		    			   rows[r].cells[5].style.color="red";   
		    		   }
		    		   
		    		   
		
		    		   
		    		   <!--to color the dont know report-->
		    		   for(let c=9;c<17;c++){
			    		   let var3=rows[r].cells[c].textContent.substring(0,rows[r].cells[3].textContent.length-1);	
			    		   if(var3>=5){		    			 
			    			   rows[r].cells[c].style.color="red";   
			    		   }
		    		   }
		    		   
		    	   }
		       }
		       colorCoding();    
		    </script>
		 
	
	<% }%>
	

	
	
	
	
	<% 
	//totalInterviewDoneFP
	//totalInterviewDoneBP	
/* 		for(algo_sample as: algo_fp){
			System.out.println(as);
		}	
		System.out.println("****************************************");
	
		for(algo_sample as: algo_bp){
		System.out.println(as);
		} */
	
	/* int size=Math.max(algo_bp.size(), algo_fp.size()); */
	
	/* HashSet<algo_sample> algoSet=new HashSet<>(); */	
	
	%>
	
	
	
	<br/>
	<br/>
	<br/>
	
<center>
				<div class="SamplingTable">
				<div id =title><h2><%=finalPrjName%>(FP+BP)<h2></div>
					<%
					response.setContentType("text/html");
				
					out.println("<table class='main' id='FPBP'>");

					int index=0;
					int lastD=0;
					int lastDD=0;
					boolean flag=false;
					out.println("<th colspan='17'>Sampling Report</th>");
					out.println("<tr><th colspan='3'>"+finalPrjName+"(FP+BP)</th><th colspan='2' font size='20px'>Female</th> <th colspan='2'>Occupation</th><th colspan='2'>Farmer</th> <th colspan='2'>To voted in last Vidansabha election <br>(only don't know)</th><th colspan='2'>To voted in last Loksabha election <br>(only don't know) </th><th colspan='2'>Will vote in next Vidansabha election <br>(only don't know)</th><th colspan='2'>Will vote in next Loksabha election <br>(only don't know)</th></tr>");
					out.println("<tr><th>SR.NO</th><th>Team Leader</th><th>Survey Interview Count</th><th>Female<span style='font-size:10px;'>("+editedDate+")</span></th><th>Female(Overall)</th><th>Small Shop+ Self Occupation<span style='font-size:10px;'>("+editedDate+")</span></th><th>Small Shop+ Self Occupation(Overall)</th><th>Farmer <span style='font-size:10px;'>("+editedDate+")</span></th><th>Farmer(Overall)</th><th  font size='10px'>"+editedDate+"</th><th>Overall</th><th font size='10px'>"+editedDate+"</th><th>overall</th><th font size='10px'>"+editedDate+"</th><th>Overall</th><th font size='10px'>"+editedDate+"</th><th>overall</th></tr>");
						
						while (index<algo_bp.size()) {
							int srNo=index+1;
							
							String frName1 = algo_bp.get(index).getFrName();
							/* if(frName1.equals("99-TEST")){index++; continue;} */
							
							int fp_ind=-1;
							for(int i=0;i<algo_fp.size();i++){
								if(algo_fp.get(i).getFrName().equals(frName1))fp_ind=i;
							}					
							
							int surveyCount = algo_bp.get(index).getScount();
							int femalePer = Math.round((algo_bp.get(index).getFemale()*surveyCount)/100);
							int overAllFemalePer = (algo_bp.get(index).getoFemale()*totalInterviewDoneBP.get(frName1))/100;
							int shopPer = (algo_bp.get(index).getShop()*surveyCount)/100;
							int overAllShopPer =(algo_bp.get(index).getoShop()*totalInterviewDoneBP.get(frName1))/100;
							int farmerPer = (algo_bp.get(index).getFarmer()*surveyCount)/100;
							int overAllFarmerPer = (algo_bp.get(index).getoFarmer()*totalInterviewDoneBP.get(frName1))/100;
								
							int a=(algo_bp.get(index).getLv()*surveyCount)/100;
							int b=(algo_bp.get(index).getLs()*surveyCount)/100;
							int c=(algo_bp.get(index).getNv()*surveyCount)/100;
							String d=algo_bp.get(index).getNl(); 
							int aa=(algo_bp.get(index).getOlv()*totalInterviewDoneBP.get(frName1))/100;
							int bb=(algo_bp.get(index).getOls()*totalInterviewDoneBP.get(frName1))/100; 
							int cc=(algo_bp.get(index).getOnv()*totalInterviewDoneBP.get(frName1))/100;
							String dd=algo_bp.get(index).getOnl();  //onl
							
							
							if(fp_ind!=-1){
								
								surveyCount+= algo_fp.get(fp_ind).getScount();
								
								femalePer+=Math.round((algo_fp.get(fp_ind).getFemale()*algo_fp.get(fp_ind).getScount())/100);
								femalePer=((femalePer)*100/surveyCount);
								
								overAllFemalePer+=(algo_fp.get(fp_ind).getoFemale()*totalInterviewDoneFP.get(frName1)/100);
								overAllFemalePer=(overAllFemalePer*100)/(totalInterviewDoneBP.get(frName1)+totalInterviewDoneFP.get(frName1));
								
								shopPer+=(algo_fp.get(fp_ind).getShop()*algo_fp.get(fp_ind).getScount()/100);
								shopPer=(shopPer*100)/surveyCount;
								
								overAllShopPer+=(algo_fp.get(fp_ind).getoShop()*totalInterviewDoneFP.get(frName1))/100;
								overAllShopPer=(overAllShopPer*100)/(totalInterviewDoneBP.get(frName1)+totalInterviewDoneFP.get(frName1));
								
								farmerPer+= (algo_fp.get(fp_ind).getFarmer()*algo_fp.get(fp_ind).getScount()/100);
								farmerPer=(farmerPer*100)/surveyCount;
								
								overAllFarmerPer+=(algo_fp.get(fp_ind).getoFarmer()*totalInterviewDoneFP.get(frName1))/100;
								overAllFarmerPer=(overAllFarmerPer*100)/(totalInterviewDoneBP.get(frName1)+totalInterviewDoneFP.get(frName1));
									
								a+=(algo_fp.get(fp_ind).getLv()*algo_fp.get(fp_ind).getScount())/100;
								a=(a*100)/surveyCount;
								b+=(algo_fp.get(fp_ind).getLs()*algo_fp.get(fp_ind).getScount())/100;
								b=(b*100)/surveyCount;
								c+=(algo_fp.get(fp_ind).getNv()*algo_fp.get(fp_ind).getScount())/100;
								c=(c*100)/surveyCount;
								
								aa+=(algo_fp.get(fp_ind).getOlv()*totalInterviewDoneFP.get(frName1))/100;
								aa=(aa*100)/(totalInterviewDoneBP.get(frName1)+totalInterviewDoneFP.get(frName1));
								bb+=(algo_fp.get(fp_ind).getOls()*totalInterviewDoneFP.get(frName1))/100;
								bb=(bb*100)/(totalInterviewDoneBP.get(frName1)+totalInterviewDoneFP.get(frName1));
								cc+=(algo_fp.get(fp_ind).getOnv()*totalInterviewDoneFP.get(frName1))/100;
								cc=(cc*100)/(totalInterviewDoneBP.get(frName1)+totalInterviewDoneFP.get(frName1));
								
							}
							
							
						
							
			
						
							//String temFemale=femalCount+"("+femalePer+"%)";
							out.println("<tr><td  >" + srNo + "</td><td>" + frName1 + "</td><td>" + surveyCount + "</td><td>" + femalePer + "%</td><td>" + overAllFemalePer + "%</td><td>" + shopPer
							+ "%</td><td>" + overAllShopPer + "%</td><td>" + farmerPer + "%</td><td>" + overAllFarmerPer + "%</td><td>" +a+ "%</td><td>" + aa
							+ "%</td><td>" + b + "%</td><td>" + bb + "%</td><td>" + c + "%</td><td>" + cc + "%</td><td>" + d + "%</td><td>" + dd + "%</td></tr>");
							
							index++;
						}
						
						
						
			
						out.println(
						"<tr id='total' ><td colspan='2' >Total Count</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>"+addX+"</td><td>"+addY+"</td></tr>");

						out.println("</table>");
					%>
					
					<br/>
					<br/>
			</div>
			
</center>




<!--to show count in table -->
			<script>
		        function  countSurvey() {
		            var table = document.getElementById("FPBP");
		            var rows = table.getElementsByTagName("tr");
			            for(let c=2;c<15;c++){
			            	let adCount=0;
			            	let rsize=rows.length;
			            	//console.log(rsize);
							for(let r=3;r<rows.length-1;r++){
										var intValue = parseInt(rows[r].cells[c].textContent, 10);
										adCount+=intValue;
								}
							
							if((c-1)==1)rows[rows.length-1].cells[c-1].textContent=adCount;
							else {
								rows[rows.length-1].cells[c-1].textContent=Math.round(adCount/(rsize-4))+"%";
								
							}
					}           
		   
		        }		        
		        countSurvey();       
		       
		        
		        <!--color coding for female, small shop, donknow-->
		       function  colorCoding(){
		            var table = document.getElementById("FPBP");
		            var rows = table.getElementsByTagName("tr");
		    	   for(let r=3;r<rows.length-1;r++){
		    		   let var1=rows[r].cells[3].textContent.substring(0,rows[r].cells[3].textContent.length-1);	    		  
		    		 
		    		   
		    		   <!--to color the female-->
		    		   if(var1<20){		    			  
		    			   rows[r].cells[3].style.color="red";   
		    		   }   		   
		    	
		    		   if(var1>20){		    			  
		    			   rows[r].cells[3].style.color="blue";   
		    		   }
		    		   
		    		   
		    		   <!--to color the small shop-->   
		    		   let var2=rows[r].cells[5].textContent.substring(0,rows[r].cells[3].textContent.length-1);	
		    		   if(var2>=10){		    			 
		    			   rows[r].cells[5].style.color="red";   
		    		   }
		
		    		   
		    		   <!--to color the dont know report-->
		    		   for(let c=9;c<17;c++){
			    		   let var3=rows[r].cells[c].textContent.substring(0,rows[r].cells[3].textContent.length-1);	
			    		   if(var3>=5){		    			 
			    			   rows[r].cells[c].style.color="red";   
			    		   } 
		    		   }
		    		   
		    		   
		    	   }
		       }
		       
		        
		       colorCoding();
		    </script>			
		    
	<!-- **********************************Sampling Code End ******************************************** -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<br/>
	
	<h1 id='frName'>Caste Sampling</h1>
	
	
	
		<!-- **********************************caste sampling start here  ******************************************** -->
	
	
	<% 
		//List<String> myList= (List<String>)session.getAttribute("myList");
	//
	  	  for (int i=0;i<myList.size();i++ ) {	  		  
	  		String frName=myList.get(i);	  		
	  		if(frName.contains("99-TEST"))continue;
	  	  
	  		
	%>
	
	
	
	
	
	<!-- for fetching FR name from server  -->	   
     <%
		Connection con=null;		
		String mValue="not selected"; 
	     ArrayList<String> fRnameList=new ArrayList<>();
	     String temp_tlcheckpoint="";
	     HashSet<String> set=new HashSet<>();
	     ArrayList <String> bothFrName=new ArrayList<>();
	     String chkListId="";   
	     
	     try {
	      	Class.forName("com.mysql.cj.jdbc.Driver");
	 			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");
	 			 
	 				PreparedStatement ps1 =con.prepareStatement("SELECT * FROM `algo_survey` WHERE project=? ");
	 				ps1.setString(1, projectName);
	 				ResultSet rs1=ps1.executeQuery();
	 				
	 				while(rs1.next()) {
	 					chkListId = rs1.getString("checklistID");	 					
	 				}
	 				
	 			  //  System.out.println("chkListId"+chkListId);
	 				
	 	 			rs1.close();
	 	 			ps1.close();
	 	            con.close();
	 			
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		}   
	     %>
			
			
			<!-- for fetching VidhanSabha name from server  -->	   
     <%
 	Connection con_sg=null;
 	PreparedStatement ps_sg=null;
 	ResultSet rs_sg=null;
 	Connection con_capi=null;
 	PreparedStatement ps_capi=null;
 	ResultSet rs_capi=null;	
 	String id1="(";
 	String vidhansabhaId="";
 	ArrayList<String> arr=new ArrayList<>();
     
 	
 	
     
     try {    	 
    
    	con=null;		
    		
         ArrayList<String> task=new ArrayList<>();
         ArrayList<String> checkList=new ArrayList<>();
         HashSet<String> ProjectName=new HashSet<>();
        // System.out.println("DON TILL 1");
         
    

    			
    			chkListId="("+chkListId+")";
    			//System.out.println(chkListId);
    			
    		    //Class.forName("com.mysql.cj.jdbc.Driver");
    			con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
    			//System.out.println("connected");
    			ps_sg =con_sg.prepareStatement("SELECT *  FROM `mainapp_project` WHERE `capi_checklist_id` IN "+chkListId);
    			//ps_sg.setString(1,chkListId);	
    			
    			rs_sg=ps_sg.executeQuery();
    			
    			
    			String newId="";
    			while(rs_sg.next()) {
    				newId+=rs_sg.getString("id")+",";	 
				}
    			
    			newId="("+newId.substring(0,newId.length()-1)+")";
    		//	System.out.println("newId"+newId);
    			
    		
        rs_sg.close();
        ps_sg.close();
    	 
    	
			ps_sg =con_sg.prepareStatement("SELECT checkpointid FROM `mainapp_vidhansabhacheckpoint` where project_id IN "+newId);
			//ps_sg.setString(1,newId);
			
			//System.out.println(newId);
			
			rs_sg=ps_sg.executeQuery();
			
			while(rs_sg.next()) {
				vidhansabhaId+=rs_sg.getString("checkpointid")+",";		
			}		
			
			vidhansabhaId=vidhansabhaId.substring(0,vidhansabhaId.length()-1);
			
			rs_sg.close();
			ps_sg.close();
			con_sg.close();
			
			//System.out.println(newId);
	     	Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");	
    	
 
  			String editDate =date+" 00:00:00";
  		
  		        ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN "+"("+min_value+")"+" AND `VALUE` LIKE ? AND `DATETIME` > ? ORDER BY `DATETIME`");
  		       // ps_capi.setString(1,min_value);
  		        ps_capi.setString(1,frName);
  		        ps_capi.setString(2,editDate);
  			    rs_capi=ps_capi.executeQuery();
  		         
  				while(rs_capi.next()) {
  						id1+=rs_capi.getString("id1")+",";		
  				}
  				
  				id1=id1.substring(0,id1.length()-1)+")";
  				//System.out.println("id1"+id1);
  	   			/* System.out.println("id"+id1); */
  		        rs_capi.close();
  		        ps_capi.close();
  		        
  		    
  		     // System.out.println()
  			 //fetching distinct value from capi
  		       ps_capi=con_capi.prepareStatement("SELECT DISTINCT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN "+"("+vidhansabhaId+")"+" AND `id1` IN "+id1);
  		       /* ps_capi.setString(1,vidhansabhaId);  			    */    
  	           rs_capi=ps_capi.executeQuery();  	           
  				while(rs_capi.next()) {
  					String v1=rs_capi.getString("VALUE");
  					arr.add(v1);
  				}
  				
  				//arr.add("man"); 
  				Collections.sort(arr);
  				//System.out.println(arr);
  			rs_capi.close();
  			ps_capi.close();
	    
	        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    %>

    
	<% 
		
		 
	for(int vv=0;vv<arr.size();vv++){
			
		String VALUE=arr.get(vv);
		//System.out.println("------*--*--*------");
		//	System.out.println("VsName=>"+VALUE);
		
			%>
			
			

	<!--Fetching vishansabha name -->
	
	<%
	String vidhanSabhaName="";
	 con_capi=null;
	 ps_capi=null;
	 rs_capi=null;	
	
	ArrayList<String>allCasteName=new ArrayList<>();
	ArrayList<String> allCasteTaken=new ArrayList<>();
	HashMap<String,Integer> map=new HashMap<>();
	HashMap<String,Integer> reqPercentage=new HashMap<>();
	HashMap<String, String> achievedPercentage=new HashMap<>();
	int totalInterview=0;
		
	id1="(";
	
	
		try{			

			
	     	Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
			
		//String date = java.time.LocalDate.now().toString();						
		String editDate =date+" 00:00:00";
		//String editDate ="2023-11-02"+" 00:00:00";
		//editDate = shi=ould be todaysdate - 3	
		String taskId="(";
		String oneTaskId="";
		 //fetching taskId from capi
		
		
		LocalDate todayDate = LocalDate.now();			
		 String finalDate=todayDate.minusDays(2).toString();
		finalDate=finalDate+" 00:00:00";
		//finalDate="2023-11-01"+" 00:00:00";
		
		
		/*  System.out.println(finalDate);
		 System.out.println(vidhansabhaId); */
		
		 String vidhanSabhaseparate[]=vidhansabhaId.split(",");
		 
		// System.out.println(Arrays.toString(vidhanSabhaseparate));
		 
 		 for(int iq=0;iq<vidhanSabhaseparate.length;iq++){
			 ps_capi=con_capi.prepareStatement("SELECT DISTINCT(TASK_ID) FROM SAVE_SURVEY WHERE CHECKPOINT_ID Like ? AND VALUE LIKE '"+VALUE+"' AND DATETIME > ? ");
			  ps_capi.setString(1,vidhanSabhaseparate[iq]);
			 //ps_capi.setString(1,VALUE);	     
		     ps_capi.setString(2,finalDate);
	           rs_capi=ps_capi.executeQuery();
	           
				while(rs_capi.next()) {				
					taskId+=rs_capi.getString("TASK_ID")+",";
					oneTaskId=rs_capi.getString("TASK_ID");
					//System.out.println("one task id"+oneTaskId);
				}			
				
		 } 
 		 
 		//System.out.println("one task id"+oneTaskId);





		 
		 
		 taskId=taskId.substring(0,taskId.length()-1)+")";
	       
	      // ps_capi.setString(1, VALUE);
	      // SELECT DISTINCT(TASK_ID) FROM SAVE_SURVEY WHERE CHECKPOINT_ID LIKE '77556' AND VALUE LIKE "89-HUZURNAGAR" AND DATETIME > '2023-10-08 00:00:00'

		 //  ps_capi.setString(2,id1);		       
			
			//System.out.println("oneTaskId=>"+oneTaskId);			
			
		rs_capi.close();
		ps_capi.close();
		
		//System.out.println("done till now 1");
		//fetvhing all caste name 
		String casteName="";
		 //fetching taskId from capi
	       ps_capi=con_capi.prepareStatement("SELECT DISTINCT (VALUE) FROM SAMPLING1 WHERE TASK_ID LIKE "+oneTaskId+" AND NAME1 LIKE ?");
	       ps_capi.setString(1,VALUE);
	      // ps_capi.setString(2,frName);
		 //  ps_capi.setString(2,id1);		       
          rs_capi=ps_capi.executeQuery();
          
			while(rs_capi.next()) {
				casteName=rs_capi.getString("VALUE");
				allCasteName.add(casteName);
			}			
			//System.out.println("**"+allCasteName);			
			
		rs_capi.close();
		ps_capi.close();

		
		//System.out.println(VALUE+"-------------"+taskId);	
		String casteTaken="";		
		map.clear();
		//System.out.println("0000000000000000000000000000000000000000000000000000000000000000");
		//System.out.println(map);	
		 //fetching taskId from capi
	       ps_capi=con_capi.prepareStatement("SELECT VALUE, REMAINING_COUNT  FROM `SAMPLING1` WHERE `TASK_ID` IN "+taskId +"AND NAME1 LIKE ?");
	       ps_capi.setString(1,VALUE);
	      // ps_capi.setString(2,frName);
		 //  ps_capi.setString(2,id1);		       
         rs_capi=ps_capi.executeQuery();
         
			while(rs_capi.next()) {
				String v1=rs_capi.getString("VALUE");
				casteTaken=rs_capi.getString("REMAINING_COUNT");
				int castNumber=Integer.parseInt(casteTaken);
				totalInterview+=castNumber;
				
				if(map.containsKey(v1)){
					map.put(v1,map.get(v1)+castNumber);					
				}else {
					map.put(v1,castNumber);
				}						
				//System.out.println(v1+" "+casteTaken);				
				//allCasteTaken.add(v1+"-"+casteTaken);
			}
			
			//System.out.println(map);		
			rs_capi.close();
			ps_capi.close();
			
			
			
			//String ="";
			 //fetching taskId from capi			
		       ps_capi=con_capi.prepareStatement("SELECT VALUE, TOTAL_COUNT  FROM `SAMPLING1` WHERE `TASK_ID` LIKE "+oneTaskId+" AND `NAME1` LIKE ?");
		       ps_capi.setString(1,VALUE);
		       
		      // ps_capi.setString(2,frName);
			 //  ps_capi.setString(2,id1);		       
	         rs_capi=ps_capi.executeQuery();
	         
				while(rs_capi.next()) {
					String v1=rs_capi.getString("VALUE");
					String TOTAL_COUNT=rs_capi.getString("TOTAL_COUNT");
				    int tc=Integer.parseInt(TOTAL_COUNT);	
					reqPercentage.put(v1,tc);			
							
					//allCasteTaken.add(v1+"-"+casteTaken);
				}			
								
				//System.out.println(reqPercentage);		
				rs_capi.close();
				ps_capi.close();
				
				//System.out.println(totalInterview);
				con_capi.close();	
				
				for(String k:map.keySet()){
					double perConv=((double)(map.get(k)*100))/(double)totalInterview;
					String ans=String.format("%.1f", perConv);
					achievedPercentage.put(k,ans);
				}				
				
				//System.out.println(achievedPercentage); 
			
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{			
			
			try{		
				rs_capi.close();
				ps_capi.close();
				con_capi.close();				
			}catch(Exception e){
				System.out.println(e);
			}	
		}
		
		
	/* 	System.out.println(allCasteName);
		System.out.println("**************");
		System.out.println(map);
		System.out.println("**************");
		System.out.println(reqPercentage);		
		System.out.println("done till now 2"); */
		
		//allCasteName (template)
		//map(how much interview have take wrt caste)
		//reqPercentage(required % of caste sample )
		//achievedPercentage(achieve percentage by )
		
		//System.out.println("allCasteName with their number "+map);
		
	%>
	
	      

  	 
	
	 
	
	<div>
	<div>
	<center>     
   <div class="tables">
    <%
		response.setContentType("text/html");    
    %>
	<table class="main-tab" id="main<%=VALUE%><%=i%>">
<br>
<br>
	<% 		
					index=0;
					String data[]=null;
					allCasteName.add(allCasteName.size()-1,allCasteName.size()+"-"+allCasteName.get(allCasteName.size()-1));
					//System.out.println("allCasteName"+allCasteName);
					String vsnameTemp=VALUE;
					String wholeName=frName+"("+vsnameTemp+")";
					out.println("<th colspan='6'>"+wholeName+"</th> ");
					out.println("<tr ><th>Sr.No</th><th>Caste</th><th>Interview Count</th><th> % Required </th><th> % Achieved </th><th> % Variance</th></tr>");
					
					int slnum=0;					
					//System.out.println("$$$$$$$$$$$$$$$$$$$$$$$");
				while(index<allCasteName.size()-1){
					if(allCasteName.size()>2){
					String p1=allCasteName.get(index);
					data=p1.split("-");
					

					if(index==allCasteName.size()-2)p1=allCasteName.get(index+1);
					int count =map.get(p1);
					int d1=reqPercentage.get(p1);
					
					if(d1>3)slnum++;
					
					String d2=achievedPercentage.get(p1);
					
					double oc=Double.valueOf(d2);
					double diff=oc-(double)d1;
					String oc1=String.format("%.1f", diff);
					
					out.println("<tr><td>"+slnum+"</td><td>" + data[1] + "</td><td>"+count+"</td><td>"+d1+"</td><td>"+d2+"</td><td>" + oc1 + "</td></tr>");
				//	System.out.println(slnum);
					//out.println("<tr><td>0</td></tr>");
                   index++;
				}
					
					else {
						slnum++;
						String p1=allCasteName.get(index);
						int count =map.get(p1);
						int d1=reqPercentage.get(p1);
						String d2=achievedPercentage.get(p1);
						
						double oc=Double.valueOf(d2);
						double diff=oc-(double)d1;
						String oc1=String.format("%.1f", diff);
						
						
						out.println("<tr><td >" + slnum + "</td><td>" + p1 + "</td><td>"+count+"</td><td>"+d1+"%</td><td>"+d2+"%</td><td>" + oc1 + "%</td></tr>");
		                   index++;
					}
				}
				out.println("<tr><td colspan='2' style='font-weight: bold;'>Total</td><td style='font-weight: bold;'>"+totalInterview+"</td><td style='font-weight: bold;' >100%</td><td style='font-weight: bold;'>100%</td><td style='font-weight: bold;' > 0.0%</td></tr>");
				out.println("<table>");
%>
      		 
     </div>
     </div>    
    </center>
</div>

	
	
	
	
	<!-- exclude the caste which % req is less than = 3 -->
	<script>
        function highlightCells() {
        	//console.log("main<%=frName%><%=VALUE%><%=i%>");
            var table = document.getElementById("main<%=VALUE%><%=i%>");
            var rows = table.getElementsByTagName("tr");                    
			var allCasteLessThan5="";
			let countPerc=0;
			let interviewCount=0;
			let achievedPerc=0;

			for (let r = 1; r < rows.length - 2; r++) {	
				//console.log(rows[r].cells[5].textContent.charAt(0));
				var reqPer=Number(rows[r].cells[3].textContent);
					
					if (reqPer <= 3) {						
						//rows[r].cells[5].style.background = "Red";
						allCasteLessThan5=allCasteLessThan5+""+rows[r].cells[1].textContent+",";
						countPerc+=Number(reqPer);
						interviewCount+=Number(rows[r].cells[2].textContent);
						achievedPerc+=Number(rows[r].cells[4].textContent);
						//rows[r].cells[3].style.color = "blue";
						if(r<rows.length-2)rows[r].style.display="none";
						//rows[r].cells[5].style.fontWeight = "bold";
						//rows[r].cells[1].style.fontWeight = "bold";
					}					
					//console.log(allCasteLessThan5+ "-->"+countPerc);
					//console.log(achievedPerc);
			}			
			var casteName=rows[rows.length - 2].cells[1].textContent+"("+allCasteLessThan5.substring(0,allCasteLessThan5.length-1)+")";
			//rows[rows.length - 2].cells[1].textContent=casteName;
			
			let v2=rows[rows.length - 2].cells[4].textContent=Number(rows[rows.length - 2].cells[4].textContent)+ Number(achievedPerc);
			let v1=rows[rows.length - 2].cells[3].textContent=Number(rows[rows.length - 2].cells[3].textContent)+ Number(countPerc);
			rows[rows.length - 2].cells[0].textContent=Number(rows[rows.length - 3].cells[0].textContent)+1;
			
			var roundedV1 = Math.round(v1 * 10) / 10;
			rows[rows.length - 2].cells[3].textContent=roundedV1;
			
			var roundedV2 = Math.round(v2 * 10) / 10;
			rows[rows.length - 2].cells[4].textContent=roundedV2;
			
			
			rows[rows.length - 2].cells[2].textContent=Number(rows[rows.length - 2].cells[2].textContent)+ Number(interviewCount);
			let finalCount=v2-v1;
			//rows[rows.length - 2].cells[5].textContent=finalCount;
			
			//console.log(Math.round(finalCount));
			//console.log(finalCount);
			var rounded = Math.round(finalCount * 10) / 10;
		//	console.log(rounded);
			rows[rows.length - 2].cells[5].textContent=rounded;			
			
		}
		highlightCells();
	</script>
	
	
	
	
		<!------- to color the cell  -------->
	<script>
        function highlightCells() {
            var table = document.getElementById("main<%=VALUE%><%=i%>");
            var rows = table.getElementsByTagName("tr");                    

			var num=1;
			for (let r = 1; r < rows.length - 1; r++) {	
				//console.log(rows[r].cells[5].textContent.charAt(0));

					if (Number(rows[r].cells[5].textContent)<-5 ) {
						
						//rows[r].cells[5].style.background = "Red";
						rows[r].cells[5].style.color = "Red";						
						rows[r].cells[5].style.fontWeight = "bold";
						rows[r].cells[1].style.fontWeight = "bold";
					}else if(Number(rows[r].cells[5].textContent)>5){
						rows[r].cells[5].style.color = "Green";
						rows[r].cells[5].style.fontWeight = "bold";
					}		
			}
		}

		highlightCells();
	</script> 
    
   
    
    
    <%	}
	}%>    
	
	
	
	
	
	
	
	
<h1 id='frName'>Female Sampling</h1>	

	
	
	
	<!----------------------------------- Female Sampling ---------------------------------------->
	
	
		<% 
		
		
		 projectName=request.getParameter("projectName");
		List<String> myList1= newbothFrName;
		 min_value=request.getParameter("min_value");
		String tempMin[]=min_value.split(",");
		min_value=tempMin[0];
	//
	  	  for (int i=0;i<myList1.size();i++ ) {
	  		  
	  		String frName=myList1.get(i);
	  		String constFrName=frName;
	  		if(frName.contains("99-TEST"))continue;
	  		
			
			
			
			
			
			
			/* System.out.println(projectName);
			System.out.println(frName);
			System.out.println(min_value);		 */
			%>
			
			
			
			
						
		<!-- for fetching chkListId for project -->	   
	     <%
			Connection con=null;		
			String mValue="not selected"; 
		     ArrayList<String> fRnameList=new ArrayList<>();
		     String temp_tlcheckpoint="";
		     HashSet<String> set=new HashSet<>();
		     ArrayList <String> bothFrName=new ArrayList<>();
		     String chkListId="";   
		     
		     try {
		      	Class.forName("com.mysql.cj.jdbc.Driver");
		 			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");
		 			 
		 				PreparedStatement ps1 =con.prepareStatement("SELECT * FROM `algo_survey` WHERE project=? ");
		 				ps1.setString(1, projectName);
		 				ResultSet rs1=ps1.executeQuery();
		 				
		 				while(rs1.next()) {
		 					chkListId = rs1.getString("checklistID");	 					
		 				}
		 				
		 			  //  System.out.println("chkListId"+chkListId);
		 				
		 	 			rs1.close();
		 	 			ps1.close();
		 	            con.close();
		 			
		 		} catch (Exception e) {
		 			e.printStackTrace();
		 		}   
		     %>
			
			
			
			
			
			
			
			
			
	<!-- for fetching VidhanSabha name from server  -->	   
	     <%
	 	Connection con_sg=null;
	 	PreparedStatement ps_sg=null;
	 	ResultSet rs_sg=null;
	 	Connection con_capi=null;
	 	PreparedStatement ps_capi=null;
	 	ResultSet rs_capi=null;	
	 	String id1="(";
	 	String vidhansabhaId="";
	 	ArrayList<String> arr=new ArrayList<>();
	 	int cnt=0;
	     
	     
	     try {    	 
	    
	    	con=null;		
	    		
	         ArrayList<String> task=new ArrayList<>();
	         ArrayList<String> checkList=new ArrayList<>();
	         HashSet<String> ProjectName=new HashSet<>();

	    			
	    			chkListId="("+chkListId+")";
	    			//System.out.println(chkListId);
	    			
	    		    //Class.forName("com.mysql.cj.jdbc.Driver");
	    			con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
	    			//System.out.println("connected");
	    			ps_sg =con_sg.prepareStatement("SELECT *  FROM `mainapp_project` WHERE `capi_checklist_id` IN "+chkListId);
	    			//ps_sg.setString(1,chkListId);	
	    			
	    			rs_sg=ps_sg.executeQuery();
	    			
	    			
	    			String newId="";
	    			while(rs_sg.next()) {
	    				newId+=rs_sg.getString("id")+",";	 
					}
	    			
	    			newId="("+newId.substring(0,newId.length()-1)+")";
	    		//	System.out.println("newId"+newId);
	    			
	    		
	        rs_sg.close();
	        ps_sg.close();
	    	 

				ps_sg =con_sg.prepareStatement("SELECT checkpointid FROM `mainapp_vidhansabhacheckpoint` where project_id IN "+newId);			
				rs_sg=ps_sg.executeQuery();			
				while(rs_sg.next()) {
					vidhansabhaId+=rs_sg.getString("checkpointid")+",";		
				}		
				
				vidhansabhaId=vidhansabhaId.substring(0,vidhansabhaId.length()-1);
				
				rs_sg.close();
				ps_sg.close();
				con_sg.close();
				
				//System.out.println(newId);
		     	Class.forName("com.mysql.cj.jdbc.Driver");
				con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
	    		//System.out.println("vidhansabhaId***************"+vidhansabhaId);
	  	   		date = java.time.LocalDate.now().toString();	 
	  			String editDate =date+" 00:00:00";
	  			
	  		        //fetchig id from capi
	  		        //SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME` > ? ORDER BY `DATETIME`
	  		        		
	  		        		for(String newMinValue:tempMin){
	  		    		        ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME` > ? ORDER BY `DATETIME`");
	  		    		        ps_capi.setString(1,newMinValue);
	  		    		        ps_capi.setString(2,frName);
	  		    		        ps_capi.setString(3,editDate);
	  		    			    rs_capi=ps_capi.executeQuery();  		    		         
	  		    				while(rs_capi.next()) {
	  		    					cnt++;
	  		    						id1+=rs_capi.getString("id1")+",";		
	  		    				}	  		        			
	  		        		}
	  		        
	  				id1=id1.substring(0,id1.length()-1)+")";
	  		        rs_capi.close();
	  		        ps_capi.close();
	  		        
	  		    
	  		     // System.out.println()
	  			 //fetching distinct value from capi
	  		       ps_capi=con_capi.prepareStatement("SELECT DISTINCT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN "+"("+vidhansabhaId+")"+" AND `id1` IN "+id1);
	  		       /* ps_capi.setString(1,vidhansabhaId);  			    */    
	  	           rs_capi=ps_capi.executeQuery();  	           
	  				while(rs_capi.next()) {
	  					String v1=rs_capi.getString("VALUE");
	  					arr.add(v1);
	  				}
	  				
	  				//arr.add("man"); 
	  				Collections.sort(arr);
	  				//System.out.println(arr);
	  			rs_capi.close();
	  			ps_capi.close();
		    
	  			//System.out.print(id1);
	  			//System.out.print(cnt);
	  			//System.out.print(arr);  
	  			
			} catch (Exception e) {
				e.printStackTrace();
			}
	    %>
	    
	    
	    
	    
	    
	    
	    <!-- for fetching Female count VS wise -->
	    <%
			Connection con_female=null;		
			 
		     HashMap<String,String> map=new HashMap<>();
	    	 HashMap<String,Integer> mapCount=new HashMap<>();
	    	 HashMap<String,Integer> femalePercentage=new HashMap<>();
	    		
		    /*  String temp_tlcheckpoint="";
		     HashSet<String> set=new HashSet<>();
		     ArrayList <String> bothFrName=new ArrayList<>();
		     String chkListId="";    */
		     int totalInterview=0;
		     
		     try {
		      	Class.forName("com.mysql.cj.jdbc.Driver");
		 			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
		 			 
		 			 for(int ip=0;ip<arr.size();ip++){
		 				int vsCnt=0;
		 				String vsCheckListId="(";
		 				PreparedStatement ps_female =con.prepareStatement("SELECT *  FROM `SAVE_SURVEY` WHERE `VALUE` LIKE ? AND `id1` IN "+id1);
		 				ps_female.setString(1, arr.get(ip));
		 				ResultSet rs1=ps_female.executeQuery();
		 				
		 				while(rs1.next()) {
		 					vsCnt++;
		 					vsCheckListId+= rs1.getString("id1")+",";	 					
		 				}
		 				
		 				totalInterview+=vsCnt;
		 				vsCheckListId=vsCheckListId.substring(0,vsCheckListId.length()-1)+")";
		 				map.put(arr.get(ip),vsCheckListId);
		 				mapCount.put(arr.get(ip),vsCnt);
		 				rs1.close();
		 				ps_female.close();
		 			 }
		 			 
		 			 
		 				for(String key: map.keySet()){
		 					PreparedStatement ps_female =con.prepareStatement("SELECT COUNT(*)  FROM `SAVE_SURVEY` WHERE `VALUE` LIKE '%FEMALE%' AND `id1` IN "+map.get(key));
		 					ResultSet rs1=ps_female.executeQuery();
		 					
		 					int femaleCount=0;
		 					while(rs1.next()) {
		 						String tempo= rs1.getString("COUNT(*)");
		 						femaleCount=Integer.parseInt(tempo);
			 				}
		 					int Percentage=(femaleCount*100)/mapCount.get(key);
		 					femalePercentage.put(key, Percentage);
		 					rs1.close();
		 					ps_female.close();
		 			} 				
		 		con.close();
		 	            
		 	            
		 	            
		 			
		 		} catch (Exception e) {
		 			e.printStackTrace();
		 		} 
	    
	   // System.out.println(map);
	    //System.out.println(mapCount);
	    //System.out.println(femalePercentage);
	    %>
	    
	    
	    
	    
	    





		
		<div>
		<div>
		<center>
	     
	   <div class="tables">
	    <%
	    
	    				femaleTable++;
						response.setContentType("text/html");
						//out.println("<table id="+femaleTable+">");
						out.println("<table id=\"" + femaleTable + "\">");
						index=1;	
						out.println("<tr ><th colspan='4'>"+frName+"</th></tr>");
						out.println("<tr ><th>Sr.No</th><th>VidhanSabha Name </th><th>Female percentage</th><th>Total Interview Taken</th></tr>");
				
					for(String tempVsName : femalePercentage.keySet()){						
							out.println("<tr><td >" + index + "</td><td>" +tempVsName + "</td><td>"+femalePercentage.get(tempVsName)+"%</td><td>"+mapCount.get(tempVsName)+"</td></tr>");
			                 index++;
					}
					
					out.println("<tr><td colspan='3'>Total interviews done today</td><td>" +totalInterview + "</td></tr>");
					out.println("</table>");
		            
	%>
		
		<br/>
		<br/>
	      		 
	     </div>
	     </div>    
	    </center>
	</div>
	
	
	
		<script>
	
		        <!--color coding for female-->
		       function  colorCoding(){
		            var table = document.getElementById("<%=femaleTable%>");
		            var rows = table.getElementsByTagName("tr");
		    	   for(let r=2;r<rows.length-1;r++){
		    		   let var1=rows[r].cells[2].textContent.substring(0,rows[r].cells[2].textContent.length-1);	    		  
		    		   console.log(var1);
		    		   
		    		   <!--to color the female-->
		    		   if(var1<20){		    			  
		    			   rows[r].cells[2].style.color="red";   
		    		   }   		   
		    	
		    		   if(var1>20){		    			  
		    			   rows[r].cells[2].style.color="blue";   
		    		   }   

		    	   }

		       }
		        
		       colorCoding();
		        
		  
		        
		        
		    </script>
	
	
	<%} %>	
	
	
	
	

	
	
	
	
	
	
	<br/>
	<h1 id='frName'>LAT LONG REPORT</h1>
	<div id='latlongdiv'>
	      <!-------------------------------------------------- Lat/Long Code FP --------------------------------------------------------->	     
    <% 

		//2024-04-28
		System.out.println(date);
		//String ddd=request.getParameter("inputDate");
		String ddd=date.substring(0,10);
		String project=request.getParameter("projectName")+" FP";
		String prjjj=project;
		project=project.replace(" ", "%20");
		//System.out.println(ddd+"  "+project);
		


			//String dd="2023-09-18";
			String prjName=project+"/"+ddd;
			var url ="http://192.168.1.198:8090/"+prjName+"/?format=json";
			//URL urlObj=new URL("https://18bc-103-226-1-242.ngrok-free.app/J&K%20LOKSABHA%20IMPACT%20ASSESSMENT%20SURVEY%20P1/2023-09-14/");
			
			var req=HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
			var client =HttpClient.newBuilder().build();
			var resp=client.send(req, HttpResponse.BodyHandlers.ofString());
			//System.out.println(resp.statusCode());
			//System.out.println(response.body());
			StringBuilder sb=new StringBuilder();
			sb.append(resp.body());		
			//System.out.println(sb);
			
			String temp[]=null;
			temp=sb.toString().replace("[", "]").split("]");
			//System.out.println();
			
			
			String []Ldate=null;
			String []FrName=null;
			String []surveyor1=null;
			String []surveyor2=null;
			String []Lcount=null;
			
			
			Ldate=temp[1].replace("\"", "").split(",");
			FrName=temp[3].replace("\"", "").split(",");
			surveyor1=temp[5].replace("\"", "").split(",");
			surveyor2=temp[7].replace("\"", "").split(",");
			Lcount=temp[9].replace("\"", "").split(",");			
			
			
			//System.out.println(Arrays.toString(date));
			//System.out.println(Arrays.toString(FrName));
			//System.out.println(Arrays.toString(surveyor1));
			//System.out.println(Arrays.toString(surveyor2));
			//System.out.println(Arrays.toString(count));
	
%>

		<br/>
		<br/>
    <center id="latTable" >
				<div class="latLongTable" >
					<%
					response.setContentType("text/html");
					out.println("<table id='main'>");

					out.println("<th colspan='18' id='upperRow' style='font-size: 30px;' >Lat/Long Report FP</th>");
					 index=0;
					out.println("<tr><th>SR.NO</th><th>Date</th><th>FR Name</th><th>Surveyor 1</th><th>Surveyor 2</th><th>Nearest Interview Count(less than 10 mtr.)</th></tr>");
					out.println("<tbody id='latlatData'>");
						while (index<FrName.length) {
							int srNo=index+1;
							String date1 = Ldate[index];
							String frName1 = FrName[index];
							String sur1 = surveyor1[index];
							String sur2 = surveyor2[index];
							String count1 = Lcount[index];							
							out.println("<tr><td  >" + srNo + "</td><td id='dateFetch'>" + date1 + "</td><td>" + frName1 + "</td><td>" + sur1 + "</td><td>" + sur2 + "</td><td>" + count1
							+ "</td></tr>");							
							index++;
						}
					out.println("</tbody>");
					out.println("</table>");
					 
					%>
			</div>			
</center>





 <center id="noDataFound" >
			<h1 id="msg"></h1>
			<br>
			<h2 id="or"></h2>
			<br>
			<h1 id="msg1"></h1>
</center>


	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">



	<script type="text/javascript">
		function showingMsg(){
			var msg=document.getElementById("msg");		
			var msg1=document.getElementById("msg1");
			var or=document.getElementById("or");
			
			var lateTable=document.getElementById("latTable");
			
			if(<%=Ldate[0].length()%><3){				
				//alert("No data found");
				latTable.style.display="none";

				msg.textContent="No interview was conducted at a distance of less than 10 meters in FP !!";
				msg.style.color="green";
				
				or.textContent="";
				or.style.color="green";
				
				
				msg1.textContent="";
				msg1.style.color="green";
		
			}
		}	
		
		showingMsg();	
	</script>
	
	
	
	
	
	
	
	
	
	
	
		
	      <!-------------------------------------------------- Lat/Long Code BP --------------------------------------------------------->	     
    <% 

		//2024-04-28
		//System.out.println(date);
		//String ddd=request.getParameter("inputDate");
		ddd=date.substring(0,10);
		project=request.getParameter("projectName")+" BP";
		prjjj=project;
		project=project.replace(" ", "%20");
		System.out.println(ddd+"  "+project);
		


			//String dd="2023-09-18";
			prjName=project+"/"+ddd;
			 url ="http://192.168.1.198:8090/"+prjName+"/?format=json";
			//URL urlObj=new URL("https://18bc-103-226-1-242.ngrok-free.app/J&K%20LOKSABHA%20IMPACT%20ASSESSMENT%20SURVEY%20P1/2023-09-14/");
			
			 req=HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
			 client =HttpClient.newBuilder().build();
			resp=client.send(req, HttpResponse.BodyHandlers.ofString());
			//System.out.println(resp.statusCode());
			//System.out.println(response.body());
			 sb=new StringBuilder();
			sb.append(resp.body());		
			//System.out.println(sb);
			
			temp=null;
			temp=sb.toString().replace("[", "]").split("]");
			//System.out.println();
			
			
			 Ldate=null;
			 FrName=null;
			 surveyor1=null;
			 surveyor2=null;
			 Lcount=null;
			
			
			Ldate=temp[1].replace("\"", "").split(",");
			FrName=temp[3].replace("\"", "").split(",");
			surveyor1=temp[5].replace("\"", "").split(",");
			surveyor2=temp[7].replace("\"", "").split(",");
			Lcount=temp[9].replace("\"", "").split(",");			
			
			
			//System.out.println(Arrays.toString(date));
			//System.out.println(Arrays.toString(FrName));
			//System.out.println(Arrays.toString(surveyor1));
			//System.out.println(Arrays.toString(surveyor2));
			//System.out.println(Arrays.toString(count));
	
%>

		<br>
		<br>
    <center id="latTablee" >
				<div class="latLongTable" >
					<%
					response.setContentType("text/html");
					out.println("<table id='main'>");

					out.println("<th colspan='18' id='upperRow' style='font-size: 30px;' >Lat/Long Report BP</th>");
					 index=0;
					out.println("<tr><th>SR.NO</th><th>Date</th><th>FR Name</th><th>Surveyor 1</th><th>Surveyor 2</th><th>Nearest Interview Count(less than 10 mtr.)</th></tr>");
					out.println("<tbody id='latlatData'>");
						while (index<FrName.length) {
							int srNo=index+1;
							String date1 = Ldate[index];
							String frName1 = FrName[index];
							String sur1 = surveyor1[index];
							String sur2 = surveyor2[index];
							String count1 = Lcount[index];							
							out.println("<tr><td  >" + srNo + "</td><td id='dateFetch'>" + date1 + "</td><td>" + frName1 + "</td><td>" + sur1 + "</td><td>" + sur2 + "</td><td>" + count1
							+ "</td></tr>");							
							index++;
						}
					out.println("</tbody>");
					out.println("</table>");					 
					%>
			</div>			
</center>


 <center id="noDataFound" >
			<h1 id="msgg"></h1>
			<br>
			<h2 id="orr"></h2>
			<br>
			<h1 id="msgg1"></h1>
</center>


	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	
		function showingMsgg(){
			var msgg=document.getElementById("msgg");		
			var msgg1=document.getElementById("msgg1");
			var orr=document.getElementById("orr");			
			var lateTable=document.getElementById("latTablee");
			
			if(<%=Ldate[0].length()%><3){				
				//alert("No data found");
				latTable.style.display="none";

				msgg.textContent="No interview was conducted at a distance of less than 10 meters in BP !!";
				msgg.style.color="green";
				
				orr.textContent="";
				orr.style.color="green";				
				
				msgg1.textContent="";
				msgg1.style.color="green";		
			}
		}		
		showingMsgg();	
	</script>
	
</div>
      
	
	