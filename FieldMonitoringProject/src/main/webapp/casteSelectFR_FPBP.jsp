<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@ page import="java.sql.*"%>


<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}

%>
<%@page errorPage="error_page.jsp"%>





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
		
		
		
		
		         .form{
             padding: 50px;
             height: 3vh;        

         }
        .container {
            max-width: 500px;
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
            margin-bottom: 4px;
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

		
</style>


</head>
<body>

	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">CASTE SAMPLING</a>
	  <div id="rightNavBar">
	   <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
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


	<%String projectName=request.getParameter("projectName"); 
		String prjName=projectName;
		
		
		Connection con=null;		
		String mValue="not selected"; 
	     ArrayList<String> fRnameList=new ArrayList<>();
	     String temp_tlcheckpoint="";
	     HashSet<String> set=new HashSet<>();
	     ArrayList <String> bothFrName=new ArrayList<>();
	     
	  
	     
	     
	     try {
	      	Class.forName("com.mysql.cj.jdbc.Driver");
	 			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");
	 			 
	 				PreparedStatement ps1 =con.prepareStatement("SELECT tlcheckpoint FROM `algo_survey` WHERE project=? ");
	 				ps1.setString(1, prjName);
	 				ResultSet rs1=ps1.executeQuery();			
	 				  
	 				while(rs1.next()) {
	 					temp_tlcheckpoint = rs1.getString("tlcheckpoint");	 					
	 				}
	 			
	 			    //System.out.println(temp_tlcheckpoint);
	 				
	 	 			rs1.close();
	 	 			ps1.close();
	 	            con.close();
	 			
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		}
	     
	     
	     
	     
	     
	     
	     
	     try {
	      	Class.forName("com.mysql.cj.jdbc.Driver");
	 			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");			 
	 				
	 				//data base connection to fetch surveyor id
	 				
	 				PreparedStatement ps1 =con.prepareStatement("SELECT VALUE FROM `CHECKPOINT` WHERE `CHECKPOINT_ID` IN"+"("+temp_tlcheckpoint+")");                                  
	 				/* ps1.setString(1, temp_tlcheckpoint); */	 				
	 				//System.out.println(temp_tlcheckpoint);
	 				ResultSet rs1=ps1.executeQuery();
	 				
	 				while(rs1.next()) {
	 					//System.out.println('1');
	 					String tempFrList=rs1.getString("VALUE");
	 					fRnameList.add(tempFrList);
	 				}
	 				
	 				for(int i=0;i<fRnameList.size();i++){
		 					String allfrName[]=fRnameList.get(i).split(",");
		 					for(String str: allfrName){
		 						set.add(str);
		 					}
	 				}
	 				
	 				for(String str: set)bothFrName.add(str);
	 				
	 				// System.out.println(set);
	 				
	 				
	 				
	 				
	 				
	 				
	 				//System.out.println(temp_tlcheckpoint);	 					
	/*  		       arr=Arrays.stream(str.split(","))
	 		              .map(String::trim).collect(Collectors.toList()); */      
	 		    
	 		       rs1.close();
	 		       ps1.close();
	 	           con.close();
	 	           
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		} 
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%
		String min_value=request.getParameter("min_value");
		min_value = "'" + min_value.replace(",", "','") + "'"; 
		//System.out.println("????"+min_value);
	//String editDate=date=date.substring(8)+"-"+date.substring(5,7)+"-"+date.substring(0,4);
	//projectName=projectName+" FP";	
	//System.out.println(projectName);
	//	System.out.println(date);
	%>

	<h1 id="prjName"><%=projectName%> FP+BP</h1>

	<% 
		List<String> myList= (List<String>)session.getAttribute("myList");
	Collections.sort(myList);
	//
/* 	  	  for (int i=0;i<myList.size();i++ ) {
	  		  
	  		String frName=myList.get(i);
	  		String constFrName=frName;
	  		if(frName.contains("99-TEST"))continue; */	  		
	%>
	
	
	
	<% 
	 con=null;
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
	
	

  	 
    <!--to show FR name list -->    
   <div class="container">
	
        <form action="casteSamplingFRWise_FPBP.jsp" method="post">
            <label for="frName">Select a FR Name:</label>
            <select id="frName" name="frName">
            
			<%
			    for (String str1:bothFrName) {
			%>
			        <option value="<%=str1%>"><%=str1%></option>			        
			<%
			    }
			%>			
			
           </select>  
           
          <%--  <input type="hidden" id="valueId" name="min_value" value="<%=temp%>">    --%>
             <input type="hidden" id="valueId" name="min_value" value="<%=min_value%>"> 
            <input type="hidden" id="valueProject" name="projectName" value="<%=projectName%>" >        
     
          
           <br>
            <button type="submit">Submit</button>
            </form>
    </div>
	



</body>
</html>