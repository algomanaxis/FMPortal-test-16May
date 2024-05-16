<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="java.util.stream.Collectors" %>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@page errorPage="error_page.jsp"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SelectFrName</title>
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
         .header {
		   
		    background-color: #eee1ff;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-left: 27%;
		    color: #990099;
		    padding: 10px;
		    padding-bottom:5px;
		    width : 90vh;
		    border-radius:10px;
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



     <%
		String prjName=request.getParameter("project");		
	%>	
	<br>	
	
	

	
	
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
    
	
	
	
	
	
	
	
	
	
	
		<!-- for fetching FR name from server  -->	   
    <%
		Connection con=null;		
		String mValue="not selected";
		String str="not selected";
	     ArrayList<String> FRname=new ArrayList<>();
	     List<String> arr=new ArrayList<>();
	     List<String> arr1=new ArrayList<>();
	     int temp=0;
	     String CHECKPOINT_ID="";
     
     
     try {
     	Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/survey_monitor",username,password);
			
				//System.out.println("succesfully connected");			
				//data base connection to fetch surveyor id
				PreparedStatement ps1 =con.prepareStatement("SELECT `fr_list` FROM `projects` WHERE `project` LIKE ?");
				/* PreparedStatement ps1=con.prepareStatement("SELECT MAX(CHK_ID) AS CHK_ID, CHECKLIST_NAME FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_ID` IN (SELECT DISTINCT(CHECKLIST_ID) FROM `ASSIGNED_SURVEY` WHERE `TASK_ID` IN (SELECT DISTINCT SUBSTRING(TASK_ID, 1, 6) FROM `MOVEMENT` WHERE `DEVICE_DATETIME` >= '2023-11-23 00:00:00' ) ) GROUP BY `CHECKLIST_NAME`"); */
				ps1.setString(1, prjName);	
				ResultSet rs1=ps1.executeQuery();	
				String name_list="";
			    while(rs1.next())
			    {
			    	name_list=rs1.getString("fr_list");
			    }
			  //  System.out.println(name_list);
				String name=name_list.substring(1,name_list.length()-1);
			//	System.out.println(name);
				
				
				
				arr=Arrays.stream(name.split(","))
			              .map(String::trim).collect(Collectors.toList());
				
				for(int i=0;i<arr.size();i++)
				{
					String s=arr.get(i);
			
					arr1.add(s.substring(1,s.length()-1));
				}
				
				/* String namestr[]=name.split(",");
				System.out.println(namestr[0]); */
				
			    ps1.close();	
	            con.close();
	    
	        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    %>
    
    
       <!--to show name of project -->	
	  <div class="header">
   		 <label for="Project"><%=prjName%></label>
  	 </div>
  	
  	

      <!--to show FR name list -->    
   <div class="container">
	
        <form action="FormFRCalling.jsp" method="post">
            <label for="frName">Select a FR Name:</label>
            <select id="frName" name="frName">
            
			<%
			    for (String str1:arr1) {
			%>
			        <option value="<%=str1%>"><%=str1%></option>
			        
			<%
			    }
			%>			
			
           </select>  
           
           <%-- <input type="hidden" id="valueId" name="min_value" value="<%=temp%>">  --%>  
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >        
           <%-- <%request.getSession().setAttribute("projname", prjName); %>  --%>
           <%
                HttpSession session1=request.getSession();  
                session1.setAttribute("projname",prjName);  
           %>
           <br>
           <br>
           
            <button type="submit">Submit</button>
            </form>
    </div>
    
    
    
</body>
</html>