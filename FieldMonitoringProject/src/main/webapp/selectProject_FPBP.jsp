<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Select project</title>

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
	  <a class="active" href="#home">FP/BP HOURLY REPORT</a>
	  <div id="rightNavBar">
	  <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
	</div>



	<!-- for fetching project name from server  -->
     <%
	Connection con=null;	
		
    
     List<String> ProjectName=new ArrayList<>();
	 /* List<String> checkListId=new ArrayList<>();
	 List<String> tlcheckpoint=new ArrayList<>();
	 List<String> gendercheckpoint=new ArrayList<>();
	 List<String> vscheckpoint=new ArrayList<>();
	 List<String> castecheckpoint=new ArrayList<>(); */
	 
     
     
     try {
     	Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");			 
		//	System.out.println("succesfully connected");
			 
				//data base connection to fetch surveyor id 
				PreparedStatement ps1 =con.prepareStatement("SELECT * FROM `algo_survey` WHERE status=1");
				ResultSet rs1=ps1.executeQuery();			
				  
				while(rs1.next()) {
					String prjName =rs1.getString("project");
					/* String checkListIdstr =rs1.getString("checkListId");
					String tlcheckpointstr =rs1.getString("tlcheckpoint");
					String gendercheckpointstr=rs1.getString("gendercheckpoint");
					String vscheckpointstr =rs1.getString("vscheckpoint");
					String castecheckpointstr =rs1.getString("castecheckpoint"); */
					
					ProjectName.add(prjName);
					/* checkListId.add(checkListIdstr);
					tlcheckpoint.add(tlcheckpointstr);
					gendercheckpoint.add(gendercheckpointstr);
					vscheckpoint.add(vscheckpointstr);
					castecheckpoint.add(castecheckpointstr); */
				}
			
			    Collections.sort(ProjectName); 
				
	 			 rs1.close();
	 			ps1.close();
	             con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     %>
     
  
     
     
      <!-- to fetch user name and password from xml-->
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
    	 	String webPage="HourlyReport";
    	 	
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
					System.out.println("user log Not Working");
				}
				
				
	 			ps1.close();				
	            con2.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     %>

    <div class="container">
        <form action="module_FPBP.jsp" method="post">
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
    
    
   
    

	

 


</body>

 

</html>