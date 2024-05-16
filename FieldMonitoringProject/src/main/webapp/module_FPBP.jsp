<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="java.util.stream.Collectors" %>
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

    <title>Module FPBP</title>

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
            width: 20%; /* Increased width */

        } 
        
        .boxbar {
            width: 100%;
            
           
            text-align: center;
              position: absolute;
              max-width:1800px;
			  top: 40%;
			  left: 50%;
			  transform: translate(-50%, -50%);
            
      
            padding: 40px;
            border-radius: 50px;
        }
        
        
        
                .dashboard-button {
            background-color: #990099;
            color: #fff;
            border: none;
            padding: 38px 38px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 25px;
            cursor: pointer;
            border-radius: 7px;
            transition: background-color 0.3s ease-in-out;
            width: 100%;
            max-width: 450px;
            margin-top: 15px;
            margin-left :10px;
        }

        .dashboard-button:hover {
            background-color: #0056b3;
        }

        .action-button:hover {
            background-color: #171718;
        }
        
        
        .maincontainer{
        	background-color: #fff;
        	
        	display :flex;
        	justify-content: center;
		    align-items: center;
		    margin-top:70px;
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
		
		
		#casteNameheader{
			margin-left:10px;
		}
		

    </style>

</head>
 

<body>
	
	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">All REPORT</a>
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
	
		<!-- for fetching FR name from server  -->	   
     <%
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
	 				
	 				
	 				//code that we need to write here down 
	 				//for(int i=0;i<bothFrName.size();i++)
	 					
	 				
	 				
	 				
	 				
	 				
	 				
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
	     
	     
	     
	   

<%--      
     
     try {
     	Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");			 
				//System.out.println("succesfully connected");			 
				//data base connection to fetch surveyor id 
				PreparedStatement ps1 =con.prepareStatement("SELECT * FROM CHECKLIST_MASTER WHERE `CAT_ID` LIKE (SELECT MIN(CAT_ID) FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ?)");                                  
				ps1.setString(1, prjName);	
				ResultSet rs1=ps1.executeQuery();	
				while(rs1.next()) {
					CHECKPOINT_ID=rs1.getString("CHECKPOINT_ID");			
				}
				String str1[]=CHECKPOINT_ID.split(",");				
				int s1=Integer.parseInt(str1[0]);				
				temp=Integer.parseInt(str1[0]);
				request.setAttribute("min_value", temp);
				
				
				PreparedStatement ps2 =con.prepareStatement("SELECT VALUE FROM `CHECKPOINT` WHERE `CHECKPOINT_ID` = "+temp+" ORDER BY `CPID` DESC");
				ResultSet rs2=ps2.executeQuery();
				
				while(rs2.next()) {
					str=rs2.getString("VALUE");		
				}
					
		       arr=Arrays.stream(str.split(","))
		              .map(String::trim).collect(Collectors.toList());
		       
		      // System.out.println(arr);
		        
		       rs2.close();
		       ps2.close();        
	           con.close();
	    
	        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    %>

   --%>
     
      <!--to show name of project -->	
	  <div class="header">
   		 <label for="Project"><%=prjName%> FP+BP</label>
  	 </div>
  	 <br/>
  	 <br/>
  	 
    <div class="boxbar">  	 
  	 
  <div class="maincontainer">		 
  	 <!--ALl fr list hourly report -->  
  	 	 
	<div class="container">	
        <form action="allDbConnFPBP.jsp" method="post">
            <label for="allBothFrName">Hourly Count </label>   		
			
          <% session.setAttribute("myList",bothFrName);%>
           
           <input type="hidden" id="valueId" name="min_value" value="<%=temp_tlcheckpoint%>">  
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >   <br/> 
            <input type="date" name="inputDate" required  max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"  >     
     
           <br>
           <br>
            <button type="submit">Click me</button>
          </form>
    </div>
    
    
    
    
    
    
      	 
  	 <!--sampling report -->  	 
	<div class="container">	
        <form action="sampling_FPBP.jsp" method="post">
            <label for="allBothFrName">Sampling Report</label>   		
			
          <% session.setAttribute("myList",bothFrName);%>
           
           <%-- <input type="hidden" id="valueId" name="min_value" value="<%=temp%>">    --%>
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >   
            <br/> 
             <input type="date" name="inputDate" required  max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"  >       
     
           <br>
           <br>
            <button type="submit">Click me</button>
          </form>
    </div>
    
    
    
    
    
     <!--sampling report -->  	 
	<div class="container">	
        <form action="casteSelectFR_FPBP.jsp" method="post">
        <br/>
              
              
            <label for="allBothFrName" id ='casteNameheader'>Caste Sampling Report</label>   		
			
          <% session.setAttribute("myList",bothFrName);%>
             <input type="hidden" id="valueId" name="min_value" value="<%=temp_tlcheckpoint%>"> 
           
           <%-- <input type="hidden" id="valueId" name="min_value" value="<%=temp%>">    --%>
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >        
     
           <br/>
           <br/>
            <br/>
             
            <button type="submit">Click me</button>
          </form>
    </div>
    
    
    
    
    
     	 <!--Female Sampling -->  	 
    
   <div class="container">
	
        <form action="FemaleSampling_FPBP.jsp" method="post">
            <label for="frName">Female Sampling</label>
            <br>
            <select id="frName" name="frName">
            
			<%
					Collections.sort(bothFrName);
			    for (String str1:bothFrName) {
			%>
			        <option value="<%=str1%>"><%=str1%></option>
			        
			<%
			    }
			%>			
			
           </select>  
           
           <input type="hidden" id="valueId" name="min_value" value="<%=temp_tlcheckpoint%>">   
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >        
     
           <br>
           <br>
            <button type="submit">Submit</button>
            </form>
    </div>
    </div>  
    
    
    	<div class="container">	
        <form action="cd_FPBP.jsp" method="post">
            <label for="allBothFrName">Central DashBoard</label>   		
			
          <% session.setAttribute("myList",bothFrName);%>
           
           <input type="hidden" id="valueId" name="min_value" value="<%=temp_tlcheckpoint%>">  
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >   <br/> 
            <%-- <input type="date" name="inputDate" required  max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"  > --%>     
           <br>
            <button type="submit">Click me</button>
          </form>
    	</div>
    


		<%-- <div class="buttons">
		    <button class="dashboard-button" onclick="goToPageWithParam('cd_FPBP.jsp', 'projectName=<%=prjName%>')">Central DashBoard</button>
		</div>
		
		<script>
		    function goToPageWithParam(page, param) {		 
		        var url = page + '?' + param;		      
		        window.location.href = url;
		    }
		</script> --%>
    </div>
    
 
    
    

</body>

 

</html>