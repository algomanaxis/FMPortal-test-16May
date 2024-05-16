<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@ page import="java.net.URI" %>
<%@ page import="java.net.http.HttpClient" %>
<%@ page import="java.net.http.HttpRequest" %>
<%@ page import="java.net.http.HttpResponse" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.LocalDate" %>

<% 
//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//response.setHeader("Pragma", "no-cache"); // HTTP 1.0.

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
<title>Central caste sampling </title>
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
<title>All Frs Hourly Report</title>

<style>
           body {

           font-family: Verdana;
            margin: 0;
            padding: 0;
            height: 100vh; /* Increased height */
        }



        label {
            display: block;
            font-weight: bold;
            
        }

        select ,input{

            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;

        }


		    .header {		   
		   
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-left: 27%;
		    color: #990099;
		    padding: 10px;
		    padding-bottom:5px;
		    width : 90vh;
		   
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
		
		#main {
			border-collapse: collapse;
		}
		

		
		#main {
			margin-top: 40px;
		}
		
		table {
	    border-collapse: collapse;	     
	    
		}
		
		#headerProject{
		
			  font-size: 21px;
		}
		
		#headerfR{
			 margin-bottom:-24px;
		}
		
		.topright {
		  position: absolute;
		  top: 55px;
		  right: 100px;
		  font-size: 20px;
		  color:red;
		  font-weight:bold;
		}
		
		
		#details{
			margin-top:30px;
			margin-bottom:10px;
			
		}</style>


</head>
<body>


	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">CENTRAL DASHBOARD</a>
	  <div id="rightNavBar">
	  <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
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
	
	



	<%String projectName=request.getParameter("project");
		String prjName=projectName;
	%>
	
	
	
	
	
	
	     
   <!-- for fetching live FR name from server  -->	   
     <%
     String min_valueVS="";
		Connection concs=null;		
		String mValue="not selected"; 
		String str="";
	     ArrayList<String> FRname=new ArrayList<>();
	     List<String> narr_cs=new ArrayList<>();
	     int temp_cs=0;
	     String CHECKPOINT_ID="";
     
     
     try {
     	Class.forName("com.mysql.cj.jdbc.Driver");
			 concs=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");			 
				//System.out.println("succesfully connected");			 
				//data base connection to fetch surveyor id 
				PreparedStatement ps1 =concs.prepareStatement("SELECT * FROM CHECKLIST_MASTER WHERE `CAT_ID` LIKE (SELECT MIN(CAT_ID) FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ?)");                                  
				ps1.setString(1, prjName);	
				ResultSet rs1=ps1.executeQuery();	
				while(rs1.next()) {
					CHECKPOINT_ID=rs1.getString("CHECKPOINT_ID");			
				}
				//System.out.println(CHECKPOINT_ID);
				
				String str1[]=CHECKPOINT_ID.split(",");				
				int s1=Integer.parseInt(str1[0]);				
				temp_cs=Integer.parseInt(str1[0]);
				request.setAttribute("min_valueVS", temp_cs);
				min_valueVS=str1[0];
				
				
				   String date = java.time.LocalDate.now().toString();						
		  			String editDate =date+" 00:00:00";
				
				PreparedStatement ps2 =concs.prepareStatement("SELECT DISTINCT(VALUE)  FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `DATETIME` > ?");
				ps2.setString(1,str1[0]);
				 ps2.setString(2,editDate);
				
				ResultSet rs2=ps2.executeQuery();
				
				while(rs2.next()) {
					str=rs2.getString("VALUE");
					narr_cs.add(str);
				}		

		      // arr=Arrays.stream(str.split(","))
		      //        .map(String::trim).collect(Collectors.toList());       
	   
		       rs2.close();
		       ps2.close();        
	           concs.close();
	    
	        	
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
 	ResultSet rs_capi_cs=null;	
 	String id1_cs="(";
 	String vidhansabhaId="";
 	HashMap<String,ArrayList<String>> mapVS=new HashMap<>();
 	
     
     
     try {    	 
    
    	 concs=null;		
    		
         ArrayList<String> task=new ArrayList<>();
         ArrayList<String> checkList=new ArrayList<>();
         HashSet<String> ProjectName=new HashSet<>();
        // System.out.println("DON TILL 1");
         
    
         	Class.forName("com.mysql.cj.jdbc.Driver");
    			 concs=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");			 
    		//	System.out.println("succesfully connected");
    			 
    				//data base connection to fetch surveyor id 
    				//System.out.println(projectName);
    				PreparedStatement ps1 =concs.prepareStatement("SELECT *  FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ? LIMIT 1");
    				ps1.setString(1, projectName);
    				ResultSet rs1=ps1.executeQuery();			
    				  
    			//	while(rs1.next()) {
    			//		String taskId  =rs1.getString("SUBSTRING(TASK_ID, 1, 6)");
    			//		task.add(taskId);					
    			//	}
    			
    			
    			String chkListId="";
    			while(rs1.next()) {
    					 chkListId  =rs1.getString("CHECKLIST_ID");
    					 
    				}
    			//System.out.println("chkListId"+chkListId);
    				
    			rs1.close();
    			ps1.close();
    			concs.close();
    		
    			
    			
    			
    			//Class.forName("com.mysql.cj.jdbc.Driver");
    			con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
    			//System.out.println("connected");
    			ps_sg =con_sg.prepareStatement("SELECT *  FROM `mainapp_project` WHERE `capi_checklist_id` LIKE ?");
    			ps_sg.setString(1,chkListId);	
    			
    			rs_sg=ps_sg.executeQuery();
    			
    			
    			String newId="";
    			while(rs_sg.next()) {
    				newId=rs_sg.getString("id");
					 
				}
    			//System.out.println("newId"+newId);
    			
    		
        rs_sg.close();
        ps_sg.close();
    	 
    	 
    	 
    	 
    	 
		//	Class.forName("com.mysql.cj.jdbc.Driver");
			//con_sg=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");	
			//System.out.println("connected");
			ps_sg =con_sg.prepareStatement("SELECT checkpointid FROM `mainapp_vidhansabhacheckpoint` where project_id LIKE ?");
			ps_sg.setString(1,newId);
			
			//System.out.println(newId);
			
			rs_sg=ps_sg.executeQuery();
			
			while(rs_sg.next()) {
				vidhansabhaId=rs_sg.getString("checkpointid");		
			}
			
			rs_sg.close();
			ps_sg.close();
			con_sg.close();
			
			//System.out.println(newId);
	     	Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");	
    	 
    	//System.out.println("vidhansabhaId"+vidhansabhaId);
    	 
  	   String date = java.time.LocalDate.now().toString();						
  			String editDate =date+" 00:00:00";
  		        //System.out.println(min_valueVS);
  		       // System.out.println(frName);
  		        //fetchig id from capi
  		        
  		   for (int i=0;i<narr_cs.size();i++ ) {
  			   
	  		String frName=narr_cs.get(i);
	  		//System.out.println(frName);
	  		ArrayList<String> arr=new ArrayList<>();
  		        ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME` > ? ORDER BY `DATETIME`");
  		     // System.out.println("min_valueVS "+min_valueVS);
  		        ps_capi.setString(1,min_valueVS);
  		        ps_capi.setString(2,frName);
  		        ps_capi.setString(3,editDate);
  			    rs_capi_cs=ps_capi.executeQuery();
  		         
  				while(rs_capi_cs.next()) {
  						id1_cs+=rs_capi_cs.getString("id1")+",";		
  				}  				
  				id1_cs=id1_cs.substring(0,id1_cs.length()-1)+")";
  				//System.out.println("id1_cs"+id1_cs);
  	   			//System.out.println(id1_cs);
  		        rs_capi_cs.close();
  		        ps_capi.close();
  		        
  		    
  			
  			 //fetching distinct value from capi
  		       ps_capi=con_capi.prepareStatement("SELECT DISTINCT(VALUE) FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `id1` IN "+id1_cs);
  		       ps_capi.setString(1,vidhansabhaId);  			       
  	           rs_capi_cs=ps_capi.executeQuery();  	           
  				while(rs_capi_cs.next()) {
  					String v1=rs_capi_cs.getString("VALUE");  					
  					arr.add(v1);
  				}
  				
  				if(!frName.equals("99-TEST"))mapVS.put(frName,arr);
  				//mapVS.put(frName,arr);
  				id1_cs="(";
  				//arr.add("man"); 
  		   }
  			//	System.out.println(arr);
  			rs_capi_cs.close();
  			ps_capi.close();
	    
  		   	
		} catch (Exception e) {
			e.printStackTrace();
		}

    
	
		for(String a: mapVS.keySet()){
			//System.out.println(a);
			for(int i=0;i<mapVS.get(a).size();i++){
				//System.out.print(mapVS.get(a).get(i)+",");	
				String frName = a;	
				String VALUE=mapVS.get(a).get(i);
	%>
	
	
	
	
		<!--Fetching vishansabha name -->			
	<%
	String vidhanSabhaName="";
	 con_capi=null;
	 ps_capi=null;
	 rs_capi_cs=null;	
	
	ArrayList<String>allCasteName=new ArrayList<>();
	ArrayList<String> allCasteTaken=new ArrayList<>();
	HashMap<String,Integer> map=new HashMap<>();
	HashMap<String,Integer> reqPercentage=new HashMap<>();
	HashMap<String, String> achievedPercentage=new HashMap<>();
	int totalInterview=0;
		
	id1_cs="(";
	
	
		try{			
	
			
	     	Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
			
		String date = java.time.LocalDate.now().toString();						
		String editDate =date+" 00:00:00";
		//editDate = shi=ould be todaysdate - 3	
		String taskId="(";
		String oneTaskId="";
		 //fetching taskId from capi
		
		
		LocalDate todayDate = LocalDate.now();			
		 String finalDate=todayDate.minusDays(2).toString();
		 finalDate=finalDate+" 00:00:00";
		 
		// System.out.println(finalDate);
		// System.out.println(vidhansabhaId);
	       ps_capi=con_capi.prepareStatement("SELECT DISTINCT(TASK_ID) FROM SAVE_SURVEY WHERE CHECKPOINT_ID LIKE ? AND VALUE LIKE '"+VALUE+"' AND DATETIME > ?");
	      // ps_capi.setString(1, VALUE);
	      // SELECT DISTINCT(TASK_ID) FROM SAVE_SURVEY WHERE CHECKPOINT_ID LIKE '77556' AND VALUE LIKE "89-HUZURNAGAR" AND DATETIME > '2023-10-08 00:00:00'
		  ps_capi.setString(1,vidhansabhaId);
		 	//ps_capi.setString(1,VALUE);	     
	       ps_capi.setString(2,finalDate);
		 //  ps_capi.setString(2,id1_cs);		       
           rs_capi_cs=ps_capi.executeQuery();
           
			while(rs_capi_cs.next()) {				
				taskId+=rs_capi_cs.getString("TASK_ID")+",";
				oneTaskId=rs_capi_cs.getString("TASK_ID");
				//System.out.println("one task id"+oneTaskId);
			}			
			taskId=taskId.substring(0,taskId.length()-1)+")";			
			//System.out.println(oneTaskId);			
			
		rs_capi_cs.close();
		ps_capi.close();
		
		
		
		
		//fetvhing all caste name 
		String casteName="";
		 //fetching taskId from capi
	       ps_capi=con_capi.prepareStatement("SELECT DISTINCT (VALUE) FROM SAMPLING1 WHERE TASK_ID LIKE "+oneTaskId+" AND NAME1 LIKE ?");
	       ps_capi.setString(1,VALUE);
	      // ps_capi.setString(2,frName);
		 //  ps_capi.setString(2,id1_cs);		       
          rs_capi_cs=ps_capi.executeQuery();
          
			while(rs_capi_cs.next()) {
				casteName=rs_capi_cs.getString("VALUE");
				allCasteName.add(casteName);
			}			
			//System.out.println(allCasteName);			
			
		rs_capi_cs.close();
		ps_capi.close();
		
		
		
		
		//System.out.println(taskId);	
		String casteTaken="";		
		 //fetching taskId from capi
	       ps_capi=con_capi.prepareStatement("SELECT VALUE, REMAINING_COUNT  FROM `SAMPLING1` WHERE `TASK_ID` IN "+taskId +"AND NAME1 LIKE ?");
	       ps_capi.setString(1,VALUE);
	      // ps_capi.setString(2,frName);
		 //  ps_capi.setString(2,id1_cs);		       
         rs_capi_cs=ps_capi.executeQuery();
         
			while(rs_capi_cs.next()) {
				String v1=rs_capi_cs.getString("VALUE");
				casteTaken=rs_capi_cs.getString("REMAINING_COUNT");
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
			rs_capi_cs.close();
			ps_capi.close();
			
			
			
			//String ="";
			 //fetching taskId from capi
			
		       ps_capi=con_capi.prepareStatement("SELECT VALUE, TOTAL_COUNT  FROM `SAMPLING1` WHERE `TASK_ID` LIKE "+oneTaskId+" AND `NAME1` LIKE ?");
		       ps_capi.setString(1,VALUE);
		       
		      // ps_capi.setString(2,frName);
			 //  ps_capi.setString(2,id1_cs);		       
	         rs_capi_cs=ps_capi.executeQuery();
	         
				while(rs_capi_cs.next()) {
					String v1=rs_capi_cs.getString("VALUE");
					String TOTAL_COUNT=rs_capi_cs.getString("TOTAL_COUNT");
				    int tc=Integer.parseInt(TOTAL_COUNT);	
					reqPercentage.put(v1,tc);			
							
					//allCasteTaken.add(v1+"-"+casteTaken);
				}			
								
				//System.out.println(reqPercentage);		
				rs_capi_cs.close();
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
				rs_capi_cs.close();
				ps_capi.close();
				con_capi.close();				
			}catch(Exception e){
				System.out.println(e);
			}	
		}
	
		
	%>
	
	

	<center>
     
   <div class="tables">
    <%
					response.setContentType("text/html");
    
    %>
	<table class="main-tab" id="main<%=i%><%=a%>">
<br>
<br>
	<% 
					//out.println("<table id='main'>");
					int index=0;
					String headline="FR : "+frName+" (VS : "+VALUE+")";
					String data[]=null;
					allCasteName.add(allCasteName.size()-1,allCasteName.size()+"-"+allCasteName.get(allCasteName.size()-1));
					out.println("<th colspan='6'>"+headline+"</th> ");
					//out.println("<tr><th colspan='6'>"+VALUE+"</th></tr>");
					out.println("<tr ><th>Sr.No</th><th>Caste</th><th>Interview Count</th><th> % Required </th><th> % Achieved </th><th> % Variance</th></tr>");
					
					int slnum=0;

					
					//System.out.println("**************");
				while(index<allCasteName.size()-1){
					if(allCasteName.size()>2){
					String p1=allCasteName.get(index);
					data=p1.split("-");
					
					//System.out.println(Arrays.toString(data));
					//System.out.println("**************");
					//System.out.println(allCasteName);
					
					
					//System.out.println(frName);
					//System.out.println(VALUE);
					//System.out.println(p1);
					
					
					
					if(index==allCasteName.size()-2)p1=allCasteName.get(index+1);
					int count =map.get(p1);
					int d1=reqPercentage.get(p1);
					
					if(d1>3)slnum++;
					
					String d2=achievedPercentage.get(p1);
					
					double oc=Double.valueOf(d2);
					double diff=oc-(double)d1;
					String oc1=String.format("%.1f", diff);
					//System.out.println(oc1);
					//int diff=.parseInt(d2)-d1;
				 //  System.out.println(num+"$$$$$$$$$$$$$$$$$$$$$$$$$$$"+data[1]);
					
				   // num=num+10;
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
                 
%>
      		 
     </div>
     </div>    
    </center>
</div>

	
	
	
	
	<!-- exclude the caste which % req is less than = 3 -->
	<script>
        function highlightCells() {
            var table = document.getElementById("main<%=i%><%=a%>");
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
			console.log(rounded);
			rows[rows.length - 2].cells[5].textContent=rounded;			
			
		}
		highlightCells();
	</script>
	
	
	
	
		<!-- to color the cell  -->
	<script>
        function highlightCells() {
            var table = document.getElementById("main<%=i%><%=a%>");
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
		
	<%		
				
			}		
		}	
	%>
	
	
	
	
   



</body>
</html>