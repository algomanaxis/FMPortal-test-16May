<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
  <%@ page import="java.time.LocalDate" %>  
  <%@ page import=" java.time.format.DateTimeFormatter" %>
 
    
<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);
		
	}
%>
 
<%-- <%@page errorPage="error_page.jsp"%> --%>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FR_SR Management Portal</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Verdana;
            margin: 0;
            padding: 0;       
          
            height: 100vh;
            background: linear-gradient(to bottom, white,#D8BFD8);
        }
 
        .boxbar {
            width: 100%;
            
            max-width: 800px;
            text-align: center;
              position: absolute;
              
			  top: 40%;
			  left: 50%;
			  transform: translate(-50%, -50%);
            
           <%--  background: linear-gradient(to bottom, white, #721a71);--%>
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 50px;
        }
        
         .boxbar2 {
<%--             width: 80%;
          
           max-width: 300px;
            text-align: left;
             position: absolute;
             
			  top: 5%;
			  left: 2%;
			  /* transform: translate(-50%, -50%); */
            
            background: linear-gradient(to bottom, white, #721a71);
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 50px; --%>
        }
      
        
 
        .dashboard-button {
            background-color: #990099;
            color: #fff;
            border: none;
            padding: 28px 28px;
           text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 20px;
            cursor: pointer;
            border-radius: 7px;
            transition: background-color 0.3s ease-in-out;
            width: 100%;
            max-width: 250px;
            margin-top: 15px;
            margin-left :10px;
        }
 
        .dashboard-button:hover {
            background-color: #0056b3;
        }
 
        .action-button:hover {
            background-color: #171718;
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
		
		
		th, td {
			border: 1px solid black;
			text-align: center;
			padding: 13px;
			
		}
		
		th {
			background-color: purple;
			color: white;
			
		}
		
		tr:hover {
			background-color: #f5f5f5;
		}
		
		 /* #main {
			border-collapse: collapse;
		}  */
		
 
		
		#main {
			margin-top: 40px;
		}
		
		table {
	    border-collapse: collapse;	     
	    
		}
		
		
    </style>
</head>
<body>		
	
	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">FR SR MANAGEMENT PORTAL</a>
	  <div id="rightNavBar">
	  <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  </div>
	</div> 
 
    <div class="boxbar2">
    <p style="font-weight: bold; color: purple; text-align: center;">Today's form count till now</p>
    <%
    /* response.setContentType("text/html"); */
    
	out.println("<table id='main'>");
    Connection con=null;
      Class.forName("com.mysql.cj.jdbc.Driver");
    			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");			
    			 PreparedStatement ps = null;
    			 ResultSet rs = null;
    			
    			
    			
    			 /* String checkpoint="";
    			 String chkpnt="('127643','127743')";
    			checkpoint+="127643"+","+","+"127743"+","+"127864"+","+"127967"+","+"128242"+","+"128346"+","+"128603"+","+"128690"+","+"128775"+","+"128988"+","+"129431"+","+"129625"+","+"129880"+","+"129952"+","+"130021"+","+"130267"+","+"130327"+","+"130700"+","+"130800"+","+"130881"+","+"130908"+","+"131063"+","+"131376"+","+"131409"+","+"131501"+","+"131559"+","+"131634"+","+"131655"+","+"131887"+","+"131975"+","+"132026"+","+"132114"+","+"132195"+","+"132457"+","+"132672"+","+"132922"+","+"133076"+","+"133223"+","+"133539"+","+"133620"+","+"133742"+","+"133911"+","+"134016"+","+"134325"+","+"134755"+","+"134912"+","+"135337"+","+"135552"+","+"135808"+","+"135880"+","+"136026"+","+"136265"+","+"136320"+","+"136517"+","+"136656"+","+"136839"+","+"136957"+","+"137089"+","+"137199"+","+"137226"+","+"137248"+","+"137275"+","+"137295"+","+"137396"+","+"137575"+","+"137658"+","+"137829"+","+"137861"+","+"137969"+","+"137984"+","+"138085"+","+"138121"+","+"138220"+","+"138236"+","+"141916"+","+"141869";
    			PreparedStatement ps =con.prepareStatement("SELECT VALUE,COUNT(VALUE) from  `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN"+ chkpnt+ "AND `DATETIME` > '2024-05-14 00:00:00' GROUP by VALUE");
    			
    			ResultSet rs=ps.executeQuery(); */
    			
    			/* LocalDate currentDate = LocalDate.now(); */
    			LocalDate today = java.time.LocalDate.now();
    			String date=today+" 00:00:00";
    			System.out.println(date);
    			String sqlQuery = "SELECT VALUE, COUNT(VALUE) FROM SAVE_SURVEY WHERE CHECKPOINT_ID IN (" +
    				    "'127643','127743','127864','127967','128242','128346','128603','128690','128775','128988','129431','129625','129880','129952','130021','130267','130327','130700','130800','130881','130908','131063','131376','131409','131501','131559','131634','131655','131887','131975','132026','132114','132195','132457','132672','132922','133076','133223','133539','133620','133742','133911','134016','134325','134755','134912','135337','135552','135808','135880','136026','136265','136320','136517','136656','136839','136957','137089','137199','137226','137248','137275','137295','137396','137575','137658','137829','137861','137969','137984','138085','138121','138220','138236','141916','141869')" +
    				    "AND DATETIME > ? GROUP BY VALUE";
    		   
    		    // Prepare the statement
    		    ps = con.prepareStatement(sqlQuery);
    		    ps.setString(1,date);
    		    // Set parameters
    		    
    		    
    		    // Execute the query
    		    rs = ps.executeQuery();
    			int total=0;
    			
    			out.println("<tr ><th>State</th><th>Today's Count</th></tr>");
    			
    			while(rs.next())
    			{
    				/* out.println(rs.getString("VALUE") +" : "+rs.getInt(2)+ "<br>"); */
    				String state=rs.getString("VALUE");
    				String[] st=state.split("-");
    				String state1=st[1];
    				out.println("<tr><td >" + state1 + "</td><td>" + rs.getInt(2)+ "</td></tr>");
    		        total+=rs.getInt(2);
    			}
    			
    			out.println("<tr ><td style='font-weight: bold;'>Total  </td><td>"+total+"</td></tr>");
    			ps.close();
    			rs.close();
    			con.close();
    			
    	%>
    	</table>
    </div>
    
   <div class="boxbar">
 
	
        <h1>FR SR MANAGEMENT PORTAL</h1>
        
    <!--    <div class="current-time">
            <p id="date"></p>
            <h2 id="time"></h2>
        </div>-->
        
        <div class="buttons">
            <button class="dashboard-button" onclick="goToPage('projectSelect.jsp')">Hourly Report</button>
                     
            <button class="dashboard-button" onclick="goToPage('samplingSelectProject.jsp')">Sampling</button>
           
            <button class="dashboard-button" onclick="goToPage('casteProjectSelect.jsp')">Caste Sampling</button>
                                   
            <button class="dashboard-button" onclick="goToPage('latLongProjectSelect.jsp')">Lat/Long</button>
            
             <button class="dashboard-button" onclick="goToPage('selectProject_FPBP.jsp')">EXIT POLL</button>
            
            <button class="dashboard-button" onclick="goToPage('qualityLandingPage.jsp')">Quality Report</button>
            
            <button class="dashboard-button" onclick="goToPage('indexFRCalling.jsp')">FR Calling</button>
 
           <!--  <button class="dashboard-button" onclick="goToPage('landingPage_STDP.jsp')">STDP</button> -->
           
            <button class="dashboard-button" onclick="goToPage('cdProjectSelect.jsp')">Central DashBoard</button>                    
            <button class="dashboard-button" onclick="goToPage('adminPage.jsp')">Admin Portal</button>
            
            <button class="dashboard-button" onclick="goToPage('villageProjectSelect.jsp')">Village Sampling</button>
            
           <!--  <button class="dashboard-button" onclick="goToPage('login.jsp')">Quality</button>  -->
          <!--   <button class="dashboard-button" onclick="goToPage('selectState_Masterji.jsp')">Recruitment Monitoring</button>-->
           <!--   <button class="dashboard-button" onclick="goToPage('attendance.jsp')">Attendance</button>   -->
          
        </div>
    </div>
    
    <script>
    
        function goToPage(pageName) {
            window.location.href = pageName;
        }
 
        function updateDateTime() {
            const now = new Date();
            const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            const dateString = now.toLocaleDateString('en-US', options);
            const timeString = now.toLocaleTimeString('en-US');
            document.getElementById("date").textContent = dateString;
            document.getElementById("time").textContent = timeString;
        }
 
        // Update the date and time every second
        setInterval(updateDateTime, 1000);
 
        // Initial update
        updateDateTime();
    </script>
</body>
</html>