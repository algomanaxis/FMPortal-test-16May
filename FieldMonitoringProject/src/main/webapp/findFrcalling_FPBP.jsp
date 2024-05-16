<%@page import="java.sql.*" %>
<%@page import="org.json.simple.JSONArray" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.parser.JSONParser" %>
<%@page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.util.*" %>
<%@page errorPage="error_page.jsp"%>  



<%
try {
      HttpSession session1=request.getSession(false);  
      String projname=(String)session.getAttribute("projname");  
      String FrName=(String)session.getAttribute("Fr_Name"); 
      
      
      String projNameFP=projname+" "+"FP";
      String projNameBP=projname+" "+"BP";
      /* System.out.println(projname+"_____Akash Chill");
      System.out.println(FrName+"_____Akash Chill"); */
      System.out.println(projNameBP+" Find Page");
      
      
      JSONArray list=new JSONArray();
      Connection con,con1;
      PreparedStatement pat,pat1,pat2,pat3,pat4,pat5,pat6;
      ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6;
      
   
      Class.forName("com.mysql.cj.jdbc.Driver");
      
      String date=request.getParameter("dte");
      /* System.out.println(date); */
      con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA","root","axis@123");
      pat=con.prepareStatement("SELECT CHECKLIST_ID FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ? LIMIT 1 ");
      pat.setString(1, projNameFP);
      rs=pat.executeQuery();
      String checkListId="";
      String checkListIdFP="";
      String checkListIdBP="";
      while(rs.next()){
    	  checkListIdFP=rs.getString("CHECKLIST_ID");
      }
      pat.close();
      rs.close(); 
      /* con.close(); */
      /* System.out.println(checkListId); */
      
      pat=con.prepareStatement("SELECT CHECKLIST_ID FROM `CHECKLIST_MASTER` WHERE `CHECKLIST_NAME` LIKE ? LIMIT 1 ");
      pat.setString(1, projNameBP);
      rs=pat.executeQuery();
      
      while(rs.next()){
    	  checkListIdBP=rs.getString("CHECKLIST_ID");
      }
      pat.close();
      rs.close(); 
      con.close();
      
      
      //Surveygenious data base
      
      con=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb","root","axis@123");
      /* System.out.println("Connected"); */
      pat=con.prepareStatement("SELECT id  FROM `mainapp_project` WHERE `capi_checklist_id` Like ?  ORDER BY `capi_checklist_id` ");
      pat.setString(1,checkListIdFP);
      rs=pat.executeQuery();
      String project_idFP="";
      while(rs.next())
      {
    	  project_idFP=rs.getString("id");
      }
     /*  System.out.println(project_id); */
      
      
      pat.close();
      rs.close();
     
     
      con=DriverManager.getConnection("jdbc:mysql://192.168.1.32:3306/surveygeniusdb","root","axis@123");
      /* System.out.println("Connected"); */
      pat=con.prepareStatement("SELECT id  FROM `mainapp_project` WHERE `capi_checklist_id` Like ?  ORDER BY `capi_checklist_id` ");
      pat.setString(1,checkListIdBP);
      rs=pat.executeQuery();
      String project_idBP="";
      while(rs.next())
      {
    	  project_idBP=rs.getString("id");
      }
     
      pat.close();
      rs.close();
      
      
      // fetch fr checkpoint, gender checkpoint, occupation checkpoint
      String tlcheckpointFP="";
      String gen_checptFP="";
      String occ_checptFP="";
      
      pat1=con.prepareStatement("SELECT *  FROM `mainapp_projectspecificcheckpoints` WHERE `project_id` Like ? ORDER BY `id`   DESC");
      pat1.setString(1,project_idFP);
      rs1=pat1.executeQuery();
      
      while(rs1.next())
      {
    	  tlcheckpointFP=rs1.getString("tlcodecheckpoint");
    	  gen_checptFP=rs1.getString("gendercheckpoint");
    	  occ_checptFP=rs1.getString("occupationcheckpoint");
      }
      
      pat1.close();
      rs1.close();
      
      
      
      String tlcheckpointBP="";
      String gen_checptBP="";
      String occ_checptBP="";
      pat1=con.prepareStatement("SELECT *  FROM `mainapp_projectspecificcheckpoints` WHERE `project_id` Like ? ORDER BY `id`   DESC");
      pat1.setString(1,project_idBP);
      rs1=pat1.executeQuery();
      
      while(rs1.next())
      {
    	  tlcheckpointBP=rs1.getString("tlcodecheckpoint");
    	  gen_checptBP=rs1.getString("gendercheckpoint");
    	  occ_checptBP=rs1.getString("occupationcheckpoint");
      }
      
      pat1.close();
      rs1.close();
      
      
      
      pat.close();
      rs.close();
      con.close();
      
      
      
     String  startdatetime=date+" 00:00:00";
     String enddatetime=date+" 23:59:59";
     
     //save_survey to get total count
     con=DriverManager.getConnection("jdbc:mysql://192.168.1.185:3306/AXISMYINDIA","root","axis@123");
     pat=con.prepareStatement(" SELECT COUNT(*) AS team_count FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME`>=? AND `DATETIME`<= ? ");
     pat.setString(1,tlcheckpointFP);
     pat.setString(2,FrName);
     pat.setString(3,startdatetime);
     pat.setString(4,enddatetime);
     rs=pat.executeQuery();
     String teams_countFP="";
     /* String teams_count=""; */
     
     while(rs.next())
     {
    	 teams_countFP=rs.getString("team_count");
     }
     /* System.out.println(teams_count); */
     
     pat.close();
     rs.close();
     
     
     
     pat=con.prepareStatement(" SELECT COUNT(*) AS team_count FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME`>=? AND `DATETIME`<= ? ");
     pat.setString(1,tlcheckpointBP);
     pat.setString(2,FrName);
     pat.setString(3,startdatetime);
     pat.setString(4,enddatetime);
     rs=pat.executeQuery();
     String teams_countBP="";
     
     while(rs.next())
     {
    	 teams_countBP=rs.getString("team_count");
     }
     /* System.out.println(teams_count); */
     
     pat.close();
     rs.close();
     
     int teams_count=Integer.parseInt(teams_countFP)+Integer.parseInt(teams_countBP);
     
     
     //Female Sampling
     pat1=con.prepareStatement(" SELECT `id1` FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME`>=? AND `DATETIME`<= ? ");
     pat1.setString(1,tlcheckpointFP);
     pat1.setString(2,FrName);
     pat1.setString(3,startdatetime);
     pat1.setString(4,enddatetime);
     rs1=pat1.executeQuery();
     
     ArrayList<String>id1_listFP=new ArrayList();
     /* String allInterviewId="("; */
     String allInterviewId="(";
     while(rs1.next())
     {
    	 allInterviewId+=rs1.getString("id1")+",";
     }
     
     pat1.close();
     rs1.close();
     
     
     
     pat1=con.prepareStatement(" SELECT `id1` FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME`>=? AND `DATETIME`<= ? ");
     pat1.setString(1,tlcheckpointBP);
     pat1.setString(2,FrName);
     pat1.setString(3,startdatetime);
     pat1.setString(4,enddatetime);
     rs1=pat1.executeQuery();
     
     ArrayList<String>id1_listBP=new ArrayList();
     String allInterviewIdBP="(";
     
     while(rs1.next())
     {
    	 allInterviewId+=rs1.getString("id1")+",";
     }
     
     pat1.close();
     rs1.close();
     
     
     
     allInterviewId=allInterviewId.substring(0,allInterviewId.length()-1)+")"; 
     /* allInterviewIdBP=allInterviewIdBP.substring(0,allInterviewIdBP.length()-1)+")";  */
     
     
     pat2=con.prepareStatement("SELECT COUNT(*) AS female FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME`>=? AND `DATETIME`<= ? AND `id1` IN " +allInterviewId);
     pat2.setString(1, gen_checptFP);
     pat2.setString(2, "2-FEMALE");
     pat2.setString(3,startdatetime);
     pat2.setString(4,enddatetime);
     rs2=pat2.executeQuery();
     
     String female_cntFP="";
     
     while(rs2.next())
     {
    	 female_cntFP=rs2.getString("female");
     }
     /* System.out.println(female_cnt); */
     
     pat2.close();
     pat2.close();
     
     
     pat2=con.prepareStatement("SELECT COUNT(*) AS female FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND `VALUE` LIKE ? AND `DATETIME`>=? AND `DATETIME`<= ? AND `id1` IN " +allInterviewId);
     pat2.setString(1, gen_checptBP);
     pat2.setString(2, "2-FEMALE");
     pat2.setString(3,startdatetime);
     pat2.setString(4,enddatetime);
     rs2=pat2.executeQuery();
     
     String female_cntBP="";
     
     while(rs2.next())
     {
    	 female_cntBP=rs2.getString("female");
     }
     String fpbpCheckpoint="("+tlcheckpointFP+","+tlcheckpointBP+")";
     
     pat2.close();
     pat2.close();
     
     
      int female_cnt=Integer.parseInt(female_cntFP)+Integer.parseInt(female_cntBP);
      int female_samp=(female_cnt*100)/(teams_count); 
     
     /* female_samp=female_samp*100; */
     String female_samp_per=(String.valueOf(female_samp))+"%";
     /* System.out.println(fem_samp); */
     
     
     //Small shop and self occupation
     pat3=con.prepareStatement("SELECT COUNT(VALUE)AS sshop_cnt  FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND  VALUE IN ('14-SELF OCCUPATION' ,'9-SMALL SHOP (TEA STALL/PAN SHOP/SALOON/DHABA/ROADSIDE/HAWKERS/VEGETABLE SELLER/FRUIT SELLER)') AND id1 IN" +allInterviewId);
     pat3.setString(1,occ_checptFP);
     
     rs3=pat3.executeQuery();
     String ss_cntFP="";
     String ss_cnt="";
     while(rs3.next())
     {
    	 ss_cntFP=rs3.getString("sshop_cnt");
     }
     pat3.close();
     rs3.close();
     
     
     pat3=con.prepareStatement("SELECT COUNT(VALUE)AS sshop_cnt  FROM `SAVE_SURVEY` WHERE `CHECKPOINT_ID` LIKE ? AND  VALUE IN ('14-SELF OCCUPATION' ,'9-SMALL SHOP (TEA STALL/PAN SHOP/SALOON/DHABA/ROADSIDE/HAWKERS/VEGETABLE SELLER/FRUIT SELLER)') AND id1 IN" +allInterviewId);
     pat3.setString(1,occ_checptBP);
     
     rs3=pat3.executeQuery();
     String ss_cntBP="";
     
     while(rs3.next())
     {
    	 ss_cntBP=rs3.getString("sshop_cnt");
     }
     pat3.close();
     rs3.close();
     
     
     int sm_shop=(Integer.parseInt(ss_cntFP)+Integer.parseInt(ss_cntBP));
     /* System.out.println(ss_cnt+ " System"); */
     int small_shop=((sm_shop*100)/(teams_count));
     String s_cnt=(String.valueOf(small_shop))+"%";
     /* System.out.println(s_cnt); */
     
     
     
     //FR Interview Count
     pat4=con.prepareStatement("SELECT DISTINCT(`EMP_ID`) AS EMP_ID FROM `SAVE_SURVEY` WHERE DATETIME>=? AND DATETIME<=? AND id1 IN"+ allInterviewId);
     pat4.setString(1,startdatetime);
     pat4.setString(2,enddatetime);
     String emp_id="(";
     rs4=pat4.executeQuery();
     int team_cnt=0;
     while(rs4.next())
     {
    	 team_cnt++;
    	 emp_id+=rs4.getString("EMP_ID")+",";
     }
     /* System.out.println(team_cnt+" Satya Prakash"); */
     emp_id=emp_id.substring(0,emp_id.length()-1)+")";
    /*  System.out.println(emp_id); */
     
     String[] Fr_Name =FrName.split("-",2);
     /* System.out.println(Fr_Name[1]); */
     pat5=con.prepareStatement(" SELECT `EMP_ID` FROM `EMP_MASTER` WHERE `EMP_NAME` LIKE ? AND `EMP_ID` IN "+emp_id);
     
     pat5.setString(1,"%"+Fr_Name[1]+"%"); 
     String Fr_ID="";
     
     rs5=pat5.executeQuery();
     while(rs5.next())
     {
    	 Fr_ID=rs5.getString("EMP_ID");
     }
     System.out.println(Fr_ID+" Biramni id"); 
     
     pat6=con.prepareStatement("SELECT COUNT(DISTINCT(`id1`)) AS Fr_Cnt FROM `SAVE_SURVEY` WHERE `EMP_ID` = ?  AND DATETIME > ? AND DATETIME <? ");
     pat6.setString(1,Fr_ID);
     pat6.setString(2,startdatetime);
     pat6.setString(3,enddatetime);
     rs6=pat6.executeQuery();
     /* System.out.println("Reached"); */
     String fr_cnt="";
     while(rs6.next())
     {
    	 fr_cnt=rs6.getString("Fr_Cnt");
     }
     /* System.out.println(fr_cnt); */
     
     
     
     int daily_productivity=teams_count/(team_cnt-1);
     
     /* System.out.println(daily_productivity); */
     
     rs1.close();
     pat1.close();
     rs2.close();
     pat2.close();
     rs3.close();
     pat3.close();
     rs4.close();
     pat4.close();
     rs5.close();
     pat5.close();
     rs6.close();
     pat6.close();
     
     
     
     //Adding result to jason object
     JSONObject obj=new JSONObject();
	  
	  obj.put("teams_count",teams_count);
	  obj.put("female_sampling",female_samp_per);
	  obj.put("small_shop",s_cnt);
	  obj.put("team_cnt",team_cnt);
	  obj.put("fr_cnt",fr_cnt);
	  obj.put("daily_productivity",daily_productivity);
	  
	  list.add(obj);
	  
	  out.println(list.toJSONString());
	  out.flush();
     
      
} catch (Exception e) {
	e.printStackTrace();
}

%>