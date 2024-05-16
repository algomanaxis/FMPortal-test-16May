<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<% 


	if(session.getAttribute("name")==null){
		response.sendRedirect("index.jsp");
	}
%>
<%@page errorPage="error_page.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sampling Page FPBP</title>
    <script src="pdf.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>


<style type="text/css">

*{
    margin:0;
    padding: 0;
    font-family: Verdana;

}

body{
    height: 75vh;    
    place-items: center;
    width: 100%;

}

#container{
	margin: 0px 20px 30px;

}

table{
    box-shadow: -1px 12px 12px -6px rgba(0, 0, 0, 0.5);
    width: 95%;	
	justify-content: center;
	text-align: center;	
	margin-right:10px;
    margin-left:5px;

}

table, td, th{
    padding: 10px;
    border: 1px solid lightgray;
    border-collapse: collapse;
    text-align: center;

}



tr:nth-child(1){
    background-color: #990099;
    color:white;
    font-size: 150%;
}

tr:nth-child(2){
    background-color:   #eee1ff;
     color: #990099;
    font-size: 12px;
}

tr:nth-child(3){
    background-color:   #eee1ff;
     color: #990099;
    font-size: 12px;
}



#title{
	display: flex;
	justify-content: center; 
	margin-bottom:20px;

}

#total{
	font-weight: bold;
	    background-color:   #eee1ff;
     color: #990099;
}



#imagePro{
display:flex;
justify-content: center;
margin-bottom:20px;

}

#imagePro img {
  max-width: 15%; /* Adjust this value to control the image size */
  height: auto; /* Maintain aspect ratio */
}



#btn{


display: flex;
justify-content: center; /* Center horizontally */
align-items: center; /* Center vertically */
background-color:#990099;
text-decoration: none;
border-radius: 5px;
color:white;
margin-left:45%;
padding : 10px 50px;
cursor : pointer;

		
}


#btn:hover {
	background-color: #0056b3; /* Darker background color on hover */
	transform: scale(1.05); /* Slightly scale up the button on hover */
}

		.topnav {
		  overflow: hidden;
		  background-color: #990099;
		   margin-bottom:50px;
		 
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


<body id="download"> 


	<!-- Navigation-->
	<div class="topnav">
	  <a class="active" href="#home">SAMPLING REPORT</a>
	  <div id="rightNavBar">	  
	  <a  id ="user12" href="logout" >Welcome,&nbsp;<%=session.getAttribute("name")%>!</a>
	  <a href="logout">Logout</a>
	  <a href="modulePage.jsp">Home</a>
	  </div>
	</div>

<div id="container">


     <div id="imagePro">
		  <img src="AxisLogo.jpg" alt="AxisMyIndia_logo">
	 </div>
	 
	 
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
	String addX="%1";
	String addY="%1";
	for(String sfx: prjSuffix){

%>



<%
        String prjName=request.getParameter("projectName");
		finalPrjName=prjName;
		prjName=prjName+" "+sfx;
		
		//System.out.println(prjName);

		String date=request.getParameter("inputDate");
		
		 editedDate=date.substring(8,10)+"-"+date.substring(5,7)+"-"+date.substring(0,4);
		
		
%>



	<div id =title><h2><%=prjName%>(<%=editedDate%>)<h2></div>



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
				// System.out.println(newId);				 
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
			//System.out.println(tlcodecheckpoint);
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
		
				 
				// System.out.println(count);
				 
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
				 
				 
				 String endDate=date+" "+"23:59:59";
				 date=date+" "+"00:00:00";
		
				 
				 
				 
				 ps=con.prepareStatement("SELECT *  FROM `SAVE_SURVEY` WHERE `DATETIME` >=? AND  `DATETIME` <= ? AND CHECKPOINT_ID=?");
			     ps.setString(1,date);
			     ps.setString(2,endDate);
				 ps.setString(3,tlcodecheckpoint);
				 rs=ps.executeQuery();				 
				 while(rs.next()){
					 specificInterviewId.add(rs.getString("id1"));	 
				 }				 
				// System.out.println(specificInterviewId.size());				 
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
				 
				// System.out.println(frNameList); //fr name array
				 
				 
				 
				 
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
					 
					 
					//System.out.println("***"+countOverAllId);
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
				 
		
				// System.out.println("Fr name : "+frNameList);
				// System.out.println("interview count : "+interviewCount);
				// System.out.println("Female percent :"+femalepercent);
				///System.out.println("overl all Female percent :"+femaleOverAllPercent);				 				
				// System.out.println("shop percent "+shopPercentArray);
				// System.out.println("over all shop percent "+overAllShopPercentArray);
				// System.out.println("farmer percent :"+allFarmerPercent);
				// System.out.println("over all farmer percent  :"+famerOverAllPercent);
				// System.out.println("Dont Know Percentage  :"+dontknowFrWise.get(0));				
				// System.out.println("Over all Dont Know Percentage  :"+overAllDontknowFrWise.get(0));
				 
			
				
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
			</div>
			
</center>





</div>
<!-- <div><button id ="btn">Download</button></div> -->



<% 
	String dept=(String)session.getAttribute("dept");
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
			            	console.log(rsize);
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



</body>
</html>