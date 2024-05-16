<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*, java.net.*" %>
<%-- <%@ page import="information.AttendanceInfo" %> --%>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendace</title>
</head>
<body>



     
     <%
    class AttendanceInfo{
//    		int empId;
    		String regionalOffice;
    		String imgUrl;
    		String project;
    		String inTime;
    		String outTime;
    		String id1;    		
    		
    		
//    		public AttendanceInfo(int empId, String regionalOffice, String imgUrl, String project, String inTime,String outTime, String id1) {
//    			super();
//    			//this.empId = empId;
//    			this.regionalOffice = regionalOffice;
//    			this.imgUrl = imgUrl;
//    			this.project = project;
//    			this.inTime = inTime;
//    			this.outTime = outTime;
//    			this.id1 = id1;
//    		}
    		
//    		public int getEmpId() {
//    			return empId;
//    		}
//    		public void setEmpId(int empId) {
//    			this.empId = empId;
//    		}

    		public String getRegionalOffice() {
    			return regionalOffice;
    		}

    		public void setRegionalOffice(String regionalOffice) {
    			this.regionalOffice = regionalOffice;
    		}
    		public String getImgUrl() {
    			return imgUrl;
    		}
    		public void setImgUrl(String imgUrl) {
    			this.imgUrl = imgUrl;
    		}
    		public String getProject() {
    			return project;
    		}
    		public void setProject(String project) {
    			this.project = project;
    		}
    		public String getInTime() {
    			return inTime;
    		}
    		public void setInTime(String inTime) {
    			this.inTime = inTime;
    		}
    		public String getOutTime() {
    			return outTime;
    		}
    		public void setOutTime(String outTime) {
    			this.outTime = outTime;
    		}
    		public String getId1() {
    			return id1;
    		}
    		public void setId1(String id1) {
    			this.id1 = id1;
    		}
    	
    		@Override
    		public String toString() {
    			return "information [regionalOffice=" + regionalOffice + ", imgUrl=" + imgUrl
    					+ ", project=" + project + ", inTime=" + inTime + ", outTime=" + outTime + ", id1=" + id1 + "]";
    		}
     }
     
     
     
	 Connection con=null;
     ArrayList<String> task=new ArrayList<>();
     ArrayList<String> checkList=new ArrayList<>();
     HashSet<String> ProjectName_=new HashSet<String>();
     List<String> ProjectName=new ArrayList<>();
     HashSet<Integer> set=new HashSet<>();
     
    HashMap<Integer, AttendanceInfo> map=new HashMap<>();
     
     try {
     	Class.forName("com.mysql.cj.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA?useSSL=false","root","axis@123");			 
		//	System.out.println("succesfully connected");
			 
				//data base connection to fetch surveyor id 
				PreparedStatement ps1 =con.prepareStatement("SELECT  EMP_ID  FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` IN ('14438','14439','14441') AND `DATETIME` >= '2024-04-06 00:00:00' and  `DATETIME` <= '2024-04-06 23:59:59' ORDER BY `SID`  ASC");
				ResultSet rs1=ps1.executeQuery();			
				
				while(rs1.next()) {
					String emp_id =rs1.getString("EMP_ID");
					int temp=Integer.parseInt(emp_id);
					set.add(temp);
				}
				
				System.out.println(set);
				
				rs1.close();
				ps1.close();
				/* detail.add(new AttendanceInfo()); */
				
		 		for(int a:set){
						map.put(a,new AttendanceInfo());					
				} 
				
				
				
				
					
				/* for(int i=0;i<task.size();i++) {
					String a=task.get(i);					
					PreparedStatement ps2 =con.prepareStatement("SELECT DISTINCT(CHECKLIST_ID) FROM `ASSIGNED_SURVEY` WHERE `TASK_ID`="+a);
					ResultSet rs2=ps2.executeQuery();
					while(rs2.next()) {
						String checkId  =rs2.getString("CHECKLIST_ID");
						checkList.add(checkId);					
					}
				}						
						
				
								
				for(int i=0;i<checkList.size();i++) {
					String a=checkList.get(i);
					//System.out.println(a);
					PreparedStatement ps3 =con.prepareStatement("SELECT MAX(CHK_ID) AS CHK_ID, CHECKLIST_NAME FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_ID` ="+a+" GROUP BY `CHECKLIST_NAME`");
					ResultSet rs3=ps3.executeQuery();
					while(rs3.next()) {
						String pname  =rs3.getString("CHECKLIST_NAME");
						ProjectName_.add(pname);					
					}
				}
				
				ProjectName = new ArrayList<String>(ProjectName_); 
			    Collections.sort(ProjectName);  */
				
	 			 rs1.close();
	 			ps1.close();
	             con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
     %>
</body>
</html>