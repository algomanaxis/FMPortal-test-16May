<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
 <%@page errorPage="error_page.jsp"%>  
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<link href="css/fr_caling.css" rel="stylesheet">
<title>Select FR</title>
<style>
           body {
 
           font-family: Verdana;
            margin: 0;
            padding: 0;
            height: 100vh; /* Increased height */
        }
 
         .form{
             padding: 50px;
             height: 3vh;        
 
         }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 80%; /* Increased width */
 
        }
 
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }
 
        select, button ,input{
 
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
 
        }
        
        input{
         width: 95%;
        }       
        
        
          #hiddenButton{
        	width:200px;
        	display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-left: 45%;
		    
        }  
        
        button {
            background-color: #990099;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
 
        }
 
        button:hover {
            background-color: #2680c2;
        }
        
        #hiddenButton{
        	width:200px;
        	display: flex;
		    justify-content: center;
		    align-items: center;
		    
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
		
 
        
        
 
    </style>
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
    
    
    
 
 
 
	   <!-- for fetching project name from server  -->
     <%
		Connection con=null;		
		
     ArrayList<String> task=new ArrayList<>();
     ArrayList<String> checkList=new ArrayList<>();
     HashSet<String> ProjectName_=new HashSet<String>();
     List<String> ProjectName=new ArrayList<>();
     
     
     try {
     	Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/survey_monitor",username,password);			
		//	System.out.println("succesfully connected");
			
				//data base connection to fetch surveyor id
				/* PreparedStatement ps1 =con.prepareStatement("SELECT DISTINCT SUBSTRING(TASK_ID, 1, 6) FROM `MOVEMENT` WHERE `DEVICE_DATETIME` >= CURDATE();"); */
				PreparedStatement ps1 =con.prepareStatement("SELECT DISTINCT project FROM projects;");
				ResultSet rs1=ps1.executeQuery();			

				while(rs1.next())
				{
					String pname=rs1.getString("project");
					ProjectName_.add(pname);
				}
			
				ProjectName = new ArrayList<String>(ProjectName_); 
			    Collections.sort(ProjectName); 
			
			
	 			 rs1.close();
	 			ps1.close();
	             /* con.close(); */
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     %> 

    <div class="container">
        <form action="frNameFRCalling.jsp" method="post">
            <label for="project">Select a Project:</label>
            <select id="project" name="project">
            
			<%
			    
			    for (String str:ProjectName) {
			%>
			         
			        <option value="<%=str%>"><%=str%></option>
			<%
			    }
			%>			
			
           </select>           
     
           <br>
           <br>
            <button type="submit">Submit</button>
 
        </form>
    </div>


       <script>
        var loader=document.getElementById("preloader");
        window.addEventListener('load',()=>{
                loader.style.display="none"
        })
    </script>
</body>
</html>