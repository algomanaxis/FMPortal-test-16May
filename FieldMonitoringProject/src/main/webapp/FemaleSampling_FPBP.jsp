<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
 <%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@ page import="java.time.LocalDate" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Female Sampling</title>


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
		<%
		String projectName=request.getParameter("projectName");
		String frName=request.getParameter("frName");
		String min_value=request.getParameter("min_value");
		String tempMin[]=min_value.split(",");
		min_value=tempMin[0];
		
		
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
    	 
  	   String date = java.time.LocalDate.now().toString();
 
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
	 			 
	 			 for(int i=0;i<arr.size();i++){
	 				int vsCnt=0;
	 				String vsCheckListId="(";
	 				PreparedStatement ps_female =con.prepareStatement("SELECT *  FROM `SAVE_SURVEY` WHERE `VALUE` LIKE ? AND `id1` IN "+id1);
	 				ps_female.setString(1, arr.get(i));
	 				ResultSet rs1=ps_female.executeQuery();
	 				
	 				while(rs1.next()) {
	 					vsCnt++;
	 					vsCheckListId+= rs1.getString("id1")+",";	 					
	 				}
	 				totalInterview+=vsCnt;
	 				vsCheckListId=vsCheckListId.substring(0,vsCheckListId.length()-1)+")";
	 				map.put(arr.get(i),vsCheckListId);
	 				mapCount.put(arr.get(i),vsCnt);
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
    
    
    	
	 <!--to show name of project -->	
	  <div class="header">
   		 <label  id="headerProject" for="Project"><%=projectName%></label>
  	 </div>

  	 
  	<!--to show frname of project -->	
	  <div class="header">
   		 <label  id="headerfR"  for="frname">FR : <%=frName%></label>
  	 </div>
	
	<div>
	<div>
	<center>
     
   <div class="tables">
    <%
					response.setContentType("text/html");
					out.println("<table id='main'>");
					int index=1;	
					out.println("<tr ><th>Sr.No</th><th>VidhanSabha Name </th><th>Female percentage</th><th>Total Interview Taken</th></tr>");
			
				for(String tempVsName : femalePercentage.keySet()){						
						out.println("<tr><td >" + index + "</td><td>" +tempVsName + "</td><td>"+femalePercentage.get(tempVsName)+"%</td><td>"+mapCount.get(tempVsName)+"</td></tr>");
		                 index++;
				}
				
				out.println("<tr><td colspan='3'>Total interviews conducted up to today</td><td>" +totalInterview + "</td></tr>");
	            
%>

      		 
     </div>
     </div>    
    </center>
</div>
    
		

</body>
</html>