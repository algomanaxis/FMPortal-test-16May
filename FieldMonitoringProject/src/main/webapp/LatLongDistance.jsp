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

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LatLong Calculation</title>
</head>
<body>


<%
String prjName=request.getParameter("project");
String selectedDate=request.getParameter("inputDate");
//System.out.println(prjName);
//System.out.println(selectedDate);
%>

  
	<%	
	//System.out.println(prjName);
	Connection con_capi=null;
	Connection con_sur=null;
	PreparedStatement ps_capi=null;
	ResultSet rs_capi=null;
	PreparedStatement ps_sur=null;
	ResultSet rs_sur=null;
	String checkPointid="";
	String allInterviewId="(";
	String checkListId="";
	String prj_id_sur="";
	String tlCheckPointId="";
	String vsCheckPointId="";
	ArrayList<String> params=new ArrayList<>();
	ArrayList<String> TlName=new ArrayList<>();
	ArrayList<String> SurveyorName=new ArrayList<>();
	ArrayList<Double> latArr=new ArrayList<>();
	ArrayList<Double> longArr=new ArrayList<>();
	
	
		try{	
			Class.forName("com.mysql.cj.jdbc.Driver");
			con_capi=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");
			//String query="SELECT `CHECKPOINT_ID` FROM `CHECKLIST_MASTER` where `CHECKLIST_NAME`="+prjName;
			ps_capi=con_capi.prepareStatement("SELECT `CHECKPOINT_ID` FROM `CHECKLIST_MASTER` where `CHECKLIST_NAME`=?");
			ps_capi.setString(1, prjName);
			rs_capi=ps_capi.executeQuery();
			
			
			while(rs_capi.next()){
				checkPointid=rs_capi.getString("CHECKPOINT_ID");
				break;
			}
			
			rs_capi.close();
			ps_capi.close();
			String FrCheckPointArray[]=checkPointid.split(",");
			String FrChkPntId=FrCheckPointArray[0];		
			
			 String now= selectedDate+" "+"00:00:00";
			 String end=selectedDate+" "+"11:59:59";
			 //System.out.println(now);
			// System.out.println(end);
			 
			 
			 ps_capi=con_capi.prepareStatement("SELECT * FROM `SAVE_SURVEY` where `CHECKPOINT_ID` LIKE ? AND `DATETIME` > ? AND DATETIME < ?");
			 
			 ps_capi.setString(1,FrChkPntId );
			 ps_capi.setString(2, now);
			 ps_capi.setString(3, end);
			 
			 rs_capi =ps_capi.executeQuery();			 
			 while(rs_capi.next()){
				 allInterviewId+=rs_capi.getString("id1")+","; 
			 }
			 rs_capi.close();
			 ps_capi.close();
			 
			 allInterviewId=allInterviewId.substring(0,allInterviewId.length()-1)+")";
			// System.out.println("allInterviewId" +allInterviewId);
			 
			 
			 ps_capi=con_capi.prepareStatement("SELECT CHECKLIST_ID FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ? LIMIT 1");
			 ps_capi.setString(1,prjName);
			 rs_capi =ps_capi.executeQuery();			 
			 while(rs_capi.next()){
				 checkListId=rs_capi.getString("CHECKLIST_ID");
			 }
			 rs_capi.close();
			 ps_capi.close();
			 con_capi.close();
			 
			 
			//****************************************************survey genius connection *****************************************************************************
			 con_sur=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb?useSSL=false","root","axis@123");
			 ps_sur=con_sur.prepareStatement("SELECT `ID` FROM mainapp_project WHERE `capi_checklist_id` LIKE ?");
			 ps_sur.setString(1,checkListId);
			 rs_sur=ps_sur.executeQuery();				
				
			 while(rs_sur.next()){
				 prj_id_sur=rs_sur.getString("ID");				
			 }			 
			 rs_sur.close();
			 ps_sur.close();
			 
			 
			 
			 ps_sur=con_sur.prepareStatement("SELECT `tlcodecheckpoint` FROM `mainapp_projectspecificcheckpoints` WHERE `project_id` = ?");
			 ps_sur.setString(1,prj_id_sur);
			 rs_sur=ps_sur.executeQuery();		
			 while(rs_sur.next()){
				 tlCheckPointId=rs_sur.getString("tlcodecheckpoint");
				 break;
			 }
			 
			 
			 
			 ps_sur=con_sur.prepareStatement("SELECT `checkpointid` FROM mainapp_vidhansabhacheckpoint WHERE project_id =?");
			 ps_sur.setString(1,prj_id_sur);
			 rs_sur=ps_sur.executeQuery();		
			 while(rs_sur.next()){
				 vsCheckPointId=rs_sur.getString("checkpointid");
				 break;
			 }			 
			 
			 
			 
			 ps_sur=con_sur.prepareStatement("SELECT `params` FROM mainapp_surveyresponse WHERE `uid` IN "+allInterviewId);	
			 rs_sur=ps_sur.executeQuery();		
			 while(rs_sur.next()){
				 params.add(rs_sur.getString("params"));
			 }
			 
			// System.out.println(params);
			 System.out.println("********************************************************************************************************");
					 
			 for(int ind=0;ind<params.size();ind++){
			 String clean[]=params.get(ind).replace("[", ",").replace("]", ",").replace("\"", "").split(",");	
			 
			 for(int i=0;i<clean.length;i++){				 
				 if(clean[i].contains("startlong")){
						 String temp[]=clean[i].split(": ");
						//System.out.println(temp[0]+" "+temp[1]);
						double temp1=Double.valueOf(temp[1]);				
						longArr.add(temp1);
				 }else if(clean[i].contains("startlat")){
							 String temp[]=clean[i].split(": ");						 
								 double temp1=Double.valueOf(temp[1]);				
								 latArr.add(temp1);
				}
				 
				 
				 if(clean[i].contains("surveyor")){
					 String temp[]=clean[i].split(": ");
					 SurveyorName.add(temp[1]);
				 }
				 
				 
				 if(clean[i].contains("tldetails")){
					 String temp[]=clean[i].split(": ");
					 TlName.add(temp[1]);
				 }				 
			 }
			 
			 //tldetails
			 //surveyor 
			 
			 }
			 
			 System.out.println(latArr.size());
			 System.out.println(longArr.size());
			 System.out.println(SurveyorName.size());
			 System.out.println(TlName.size());
			 
			 
			 String res[]=new String[latArr.size()];
			 for(int i=0;i<res.length;i++){
				 for(int j=i+1;j<res.length;j++){
					 if(latArr.get(i)>0.0 && latArr.get(j)>0.0 && longArr.get(i)>0.0 && longArr.get(j)>0.0){
					 double dist=distance(latArr.get(i),latArr.get(j),longArr.get(i),longArr.get(j));
					 if(dist<30.0){
						 System.out.println("frName:"+TlName.get(i)+" "+SurveyorName.get(i)+" "+SurveyorName.get(j)+" "+dist);
					 }
					 }
				 }
			 }
			 
			 System.out.println("DONE");			 
			//System.out.println(prj_id_sur);
		}catch(SQLException e){
			e.printStackTrace();
		}finally{			
			try{				
				rs_sur.close();
				ps_sur.close();
				con_sur.close();
				
				rs_capi.close();
				ps_capi.close();
				con_capi.close();				
			}catch(Exception e){
				System.out.println(e);
			}			
		}	
	%>
	
		<%!public static double distance(double lat1, double lat2, double lon1, double lon2) {
		    final int R = 6371; // Radius of the earth
		    double latDistance = Math.toRadians(lat2 - lat1);
		    double lonDistance = Math.toRadians(lon2 - lon1);
		    double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
		            + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
		            * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
		    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		    double distance = R * c * 1000; // convert to meters

		 return distance;
		}
		%>
</body>
</html>