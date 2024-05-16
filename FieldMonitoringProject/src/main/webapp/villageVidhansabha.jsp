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


<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.

	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%>

   <%@page errorPage="error_page.jsp"%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select VidhanSabha</title>




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
	  <a class="active" href="#home">Village Sampling</a>
	  <div id="rightNavBar">
	   <a href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
	</div>




			<% 
			String frName = request.getParameter("frName");
			String projectName = request.getParameter("projectName");
			String projectNameopp = request.getParameter("projectNameopp");
			String min_value=request.getParameter("min_value");
			String VALUE=request.getParameter("vsName");
			String vidhansabhaId=request.getParameter("vidhansabhaId");	
			String vidhansabhaIdopp=request.getParameter("vidhansabhaIdopp");
			 String[] villageArr=null;
			%>
			
			

	<!--Fetching vishansabha name -->			
	<%
	String vidhanSabhaName="";
	Connection con_capi=null;
	PreparedStatement ps_capi=null;
	ResultSet rs_capi=null;	
	String vsNumber="";
	
	String[] str=VALUE.split("-");
	vsNumber=str[0];
	String vsName=str[1];
	System.out.println(vsName+ " hi this is vs name");
	
	
	ArrayList<String>capitar=new ArrayList<>();
	ArrayList<String>capicnt=new ArrayList<>();
	ArrayList<String>capivill=new ArrayList<>();
	ArrayList<String>villageTargetlis=new ArrayList<>();
	ArrayList<String>villageTarget=new ArrayList<>();
	ArrayList<String>allVillage2=new ArrayList<>();
	ArrayList<String>allVillage=new ArrayList<>();
	ArrayList<String>allVillageCount=new ArrayList<>();
	ArrayList<String>allVillageCount1=new ArrayList<>();
	ArrayList<String>allVillageCountopp=new ArrayList<>();
	ArrayList<String>allCasteName=new ArrayList<>();
	ArrayList<String> allCasteTaken=new ArrayList<>();
	HashMap<String,Integer> map=new HashMap<>();
	HashMap<String,Integer> reqPercentage=new HashMap<>();
	HashMap<String, String>villagecntmap1=new HashMap<>();
	HashMap<String, String>villagecntmap2=new HashMap<>();
	HashMap<String, String>villagecntmap=new HashMap<>();
	HashMap<String, String>villagetarmap=new HashMap<>();
	int totalInterview=0;
	int vsCount=0;	
	String id1="(";
	
	
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
		 
		 // find number of vidhansabha
		 String vsSubcheckpoint=vidhansabhaId+"."+vsNumber;
		 String vsSubcheckpointopp=vidhansabhaIdopp+"."+vsNumber;
		 ps_capi=con_capi.prepareStatement("SELECT * FROM `CHECKPOINT1` WHERE `CHECKPOINT1_ID` LIKE ? ORDER BY `CPID` ASC");
		 ps_capi.setString(1,vsSubcheckpoint);
		 rs_capi=ps_capi.executeQuery();
		 String villageList="";
		 while(rs_capi.next())
		 {
			 villageList=rs_capi.getString("VALUE");
		 }
		 villageArr=villageList.split(",");
		
		 for(String i:villageArr)
		 {
			 allVillage.add(i);
		 }
		 String vill="";
		 for(int i=0;i<villageArr.length;i++)
		 {
			 vill =villageArr[i];
			 String[] tempvill=vill.split("-");
			 if(tempvill.length>1)
			 {	 
				 String villa=tempvill[1]+"-"+tempvill[2];
				 allVillage2.add(villa);
			 }
			 else{
				 allVillage2.add(vill);
			 }
		 } 
		 rs_capi.close();
		 ps_capi.close();
		 /* System.out.println(allVillage2+ " Village2"); */
		 /* System.out.println(vsSubcheckpoint+" "+vsSubcheckpointopp); */
		 ps_capi=con_capi.prepareStatement("SELECT COUNT(*) as count FROM SAVE_SURVEY WHERE CHECKPOINT_ID LIKE '"+vsSubcheckpoint+"' AND VALUE LIKE ? AND DATETIME > ?");
		 for(int i=0;i<villageArr.length;i++)
		 {
			 ps_capi.setString(1,villageArr[i]);
			 ps_capi.setString(2,finalDate);
			 rs_capi=ps_capi.executeQuery();
			 while(rs_capi.next())
			 {
				 String count=rs_capi.getString("count");
				 
				 allVillageCount1.add(count);
				 villagecntmap1.put(allVillage2.get(i),count);
			 }
		 }
/* 		 System.out.println(villagecntmap1+" This is count");
		 System.out.println(allVillageCount1+" This is count"); */
		 rs_capi.close();
		 ps_capi.close(); 
	
		 
		 ps_capi=con_capi.prepareStatement("SELECT COUNT(*) as count FROM SAVE_SURVEY WHERE CHECKPOINT_ID LIKE '"+vsSubcheckpointopp+"' AND VALUE LIKE ? AND DATETIME > ?");
		 for(int i=0;i<villageArr.length;i++)
		 {
			 ps_capi.setString(1,villageArr[i]);
			 ps_capi.setString(2,finalDate);
			 rs_capi=ps_capi.executeQuery();
			 while(rs_capi.next())
			 {
				 String count=rs_capi.getString("count");
				 
				 allVillageCountopp.add(count);
				 villagecntmap2.put(allVillage2.get(i),count);
			 }
		 }
		 
		 /* System.out.println(allVillageCountopp+" This is count");  */
		 
		 rs_capi.close();
		 ps_capi.close();
		 
			
		 
		 for(int i=0;i<allVillageCountopp.size();i++)
		 {
			 int a=Integer.parseInt(allVillageCount1.get(i)); 
			 int b=Integer.parseInt(allVillageCountopp.get(i)); 
			 int c=a+b;
			 String cnt=String.valueOf(c);
			 allVillageCount.add(cnt);
			 villagecntmap.put(allVillage2.get(i),cnt);
			 /* System.out.println(c); */
		 }
		 
		 
		 
		 
		/* System.out.println(allVillageCount+" This is count");  */
		rs_capi.close();
		ps_capi.close();
		con_capi.close();	
		
		/* System.out.println("Hii..."); */
		con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.251:3306/FPBP?useSSL=false","root","axis@123");
		/* System.out.println("Connected... ");*/
		ps_capi=con_capi.prepareStatement("SELECT * FROM `VILLAGE_SAMPLING` WHERE vs_no LIKE ? AND `vs_name` LIKE ? ");
		ps_capi.setString(1,vsNumber);
		ps_capi.setString(2,vsName);
		rs_capi=ps_capi.executeQuery();
		
		while(rs_capi.next())
		{
			 String tab_lis=rs_capi.getString("tab_list");
			 String tar=rs_capi.getString("target");
			 
			 villageTarget.add(tar);
			 villagetarmap.put(tab_lis,tar);
		}
		
		
		 /* for(int i=0;i<allVillage2.size();i++)
		 {
			
			 ps_capi.setString(1,vsNumber);
			 ps_capi.setString(2,allVillage2.get(i));
			 
			 rs_capi=ps_capi.executeQuery();
			 while(rs_capi.next())
			 {
				 String tab_lis=rs_capi.getString("tab_list");
				 String tar=rs_capi.getString("target");
				 
				 villageTarget.add(tar);
				 villagetarmap.put(tab_lis,tar);
			 }
		 }  */
		/* System.out.println(villagetarmap);
		System.out.println(allVillage2); */
		/* System.out.println(villageTarget); */
		rs_capi.close();
		ps_capi.close();
		con_capi.close();
			
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
		
	
	%>
	      
	
	
	 <!--to show name of project -->	
	  <div class="header">
	  
   		 <label  id="headerProject" for="Project"><%=projectName%></label>
  	 </div>
  	 
  	 
  	<!--to show vishansabha of project -->	
	  <div class="header">
   		 <label id="vsName" for="vishansabha">VS : <%=VALUE%></label>
  	 </div>
  	 
  	<!--to show frname of project -->	
	  <div class="header">
   		 <label  id="headerfR"  for="frname">FR : <%=frName%></label>
  	 </div>
  	 
	
	<div class="topright"> &bull; LIVE</div>  
	
	<div>
	<div>
	<center>
     
   <div class="tables">
   
   <%
   
		   for (Map.Entry<String, String> me : villagetarmap.entrySet()) { 
		
		      String villtar=me.getKey();
		      String tar=me.getValue();
		      String villcapi="";
		      String cntcapi="";
		      if(villagecntmap.containsKey(villtar))
		      {
		    	  cntcapi=villagecntmap.get(villtar);
		    	  capivill.add(villtar);
			      capicnt.add(cntcapi);
			      capitar.add(tar);
		      }
		      else{
		    	  continue;
		      }
		  } 
          System.out.println(capivill);
          System.out.println(capicnt);
         System.out.println(allVillageCount);
   %>
   
   
    <%
					response.setContentType("text/html");
					out.println("<table id='main'>");
					int index=0;
					String data[]=null;
					
					/* allVillage2.add(allVillage2.size()-1,allVillage2.size()+"-"+allVillage2.get(allVillage2.size()-1));	 */			
					out.println("<tr ><th>Sr.No</th><th>Village</th><th>Interview Count</th><th>Target</th><th> % Required </th><th> % Achieved </th><th> % Variance</th></tr>");
					
					
                     
					 System.out.println(allVillage2.size()+" This is while loop size " + villageTarget.size()+ " "+villageArr.length); 
					//System.out.println("**************");
					/* System.out.println(allVillage); */
					String count="";
					String tempvillage="";
					int n=capicnt.size()-1; 
					int m=villageTarget.size();
					int mn = Math. min(n,m); 
					/* int sr=0; */
				while(index<=mn){
					int sr=index+1;
					
						/* count=allVillageCount.get(index);
						
						tempvillage=villageArr[index];
						String[] temp= tempvillage.split("-");
						String village=temp[1]+"-"+temp[2]; */
						
						
						count=capicnt.get(index);
						String village=capivill.get(index);
						/* String target=villageTarget.get(index); */
						String target=capitar.get(index);
						
						out.println("<tr><td >" + sr + "</td><td>" + village+ "</td><td>" + count + "</td><td>" + target + "</td><td>" + 5 + "%</td><td>" + 5 + "%</td><td>" + 5 + "%</td></tr>");
						index++; 
					
				}
				int ind=index+1;
				out.println("<tr><td >" + ind + "</td><td>Other</td><td>" + allVillageCount.get(allVillageCount.size()-1) + "</td><td>0</td><td>" + 5 + "%</td><td>" + 5 + "%</td><td>" + 5 + "%</td></tr>");
				out.println("<tr><td colspan='2' style='font-weight: bold;'>Total</td><td style='font-weight: bold;'>"+5+"</td><td style='font-weight: bold;' >100%</td><td style='font-weight: bold;' >100%</td><td style='font-weight: bold;'>100%</td><td style='font-weight: bold;' > 0.0%</td></tr>"); 
                 
%>
      		 
     </div>
     </div>    
    </center>
</div>

	
	
	
	
	<!-- exclude the caste which % req is less than = 3 -->
	<script>
        function highlightCells() {
            var table = document.getElementById("main");
            var rows = table.getElementsByTagName("tr");                    
			/* var allCasteLessThan5=""; */
			let countPerc=0;
			let interviewCount=0;
			let achievedPerc=0;
            let totaltarget=200;
            let temptar=0;
			for (let r = 1; r < rows.length-1; r++) {	
				let val=Number(rows[r].cells[2].textContent);
				interviewCount+=Number(rows[r].cells[2].textContent);
				/* totaltarget+=Number(rows[r].cells[3].textContent); */
				/* if(val===0)
				{
					totaltarget+=0;
				}
				else{
					totaltarget+=Number(rows[r].cells[3].textContent);
				} */
		}
			/* console.log(temptar); */
			console.log(interviewCount);
			console.log(totaltarget);
			rows[rows.length - 1].cells[1].textContent=interviewCount;
			rows[rows.length - 1].cells[2].textContent=totaltarget;
			
			/* for(ler r=1;r<row.length-1;r++){
				let reqPer=((Number(rows[r].cells[3].textContent))/totaltarget)*100;
				rows[r].cells[4].textContent=10;
			}  */
			
			for (let r = 1; r < rows.length - 1; r++) {
	            let reqPer = Math.round((Number(rows[r].cells[3].textContent) / totaltarget) * 100);
	            let achPer=Math.round((Number(rows[r].cells[2].textContent) / interviewCount) * 100);
	            rows[r].cells[4].textContent = reqPer+"%"; // Assuming you want to display reqPer with 2 decimal places
	            rows[r].cells[5].textContent = achPer+"%";
	        }
			
			for (let r = 1; r < rows.length - 1; r++) {
				// Convert cell values to numbers, and check for NaN (Not-a-Number)
			    let value5 = parseFloat(rows[r].cells[5].textContent);
			    let value4 = parseFloat(rows[r].cells[4].textContent);

			    // Check if values are valid numbers
			    if (!isNaN(value5) && !isNaN(value4)) {
			        // Perform subtraction and assign result to cell 6
			        let val=(value5 - value4);
			        rows[r].cells[6].textContent = val;
			    } else {
			        // Handle cases where cell content is not a valid number
			        rows[r].cells[6].textContent = "Error: Invalid input";
			    }
	        }
			
        }
		highlightCells();
	</script>
	
	
	
	
		<!-- to color the cell  -->
	<script>
        function highlightCells() {
            var table = document.getElementById("main");
            var rows = table.getElementsByTagName("tr");                    

			var num=1;
			for (let r = 1; r < rows.length - 1; r++) {	
				//console.log(rows[r].cells[5].textContent.charAt(0));
		
				if (!isNaN(value6)) {
		            // Add % symbol to the value
		           

					if (Number(rows[r].cells[6].textContent)<-5 ) {
						
						//rows[r].cells[5].style.background = "Red";
						rows[r].cells[6].style.color = "Red";						
						rows[r].cells[6].style.fontWeight = "bold";
						rows[r].cells[1].style.fontWeight = "bold";
						
					}else if(Number(rows[r].cells[6].textContent)>5){
						rows[r].cells[6].style.color = "Green";
						rows[r].cells[6].style.fontWeight = "bold";
					}	
					
					
				} else {
		            // Handle cases where cell content is not a valid number
		            rows[r].cells[6].textContent = "Error: Invalid input";
		        }
			}
		}

		highlightCells();
	</script>
	
	

		

	
	
</body>
</html>