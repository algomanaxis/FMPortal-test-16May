<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*, java.net.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element, org.w3c.dom.NodeList" %>
<%@page errorPage="error_page.jsp"%>  



<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<link href="css/fr_caling.css" rel="stylesheet">
<title>FR Calling Report</title>

<style type="text/css">
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
    
     <%
     /* int ID=67; */
    /* HttpSession session1=request.getSession(false);*/
   /* System.out.println(session1.getAttribute("ID").toString());*/
    /* Long ID=Long.parseLong(session.getAttribute("ID").toString()); */
    /* System.out.println(ID+"$$$$");  */
    String ID=request.getParameter("ID");
    /* System.out.println(ID + "   Akash the debugger"); */
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/survey_monitor";
	String user = username;
	String pass = password;
	String Fr_id=null;
	String Fr_Name=null;
	String reportDate=null;
	String Proj_Name=null;
	String Dates=null;
	String col_1=null;
	String col_2=null;
	String col_3=null;
	String col_4=null;
	String col_5=null;
	String col_6=null;
	String col_7=null;
	String col_8=null;
	String col_9=null;
	String col_10=null;
	String col_11=null;
	String col_12=null;
	String col_13=null;
	String col_14=null;
	String col_15=null;
	String col_16=null;
	String col_17=null;
	String col_18=null;
	String col_19=null;
	String col_20=null;
	String col_21=null;
	String review=null;
	Class.forName("com.mysql.cj.jdbc.Driver");

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>
     
     
     
     <div style="margin: 20px;">
        <div class="text-center" style="padding-top: 10px; padding-bottom: 10px;">
        <img src="Image/Picture1.jpg" width="350" height="80" class="center" alt="Responsive image">
    </div>

    <div class="container">
         
        <form id="myform" method="" action=""> 
            
            <table class="table table-hover table-bordered">

                <thead >
                    <th colspan="9" class="text-center" style="background-color: #990099; color: white;">FR Calling Report</th>
                </thead>
                <%
						try {
                            /* System.out.println(ID+"try"); */
							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "SELECT * FROM fr_register WHERE id="+ID;
							resultSet = statement.executeQuery(sql);
							  while(resultSet.next()){ 
								/* Fr_id=resultSet.getString("fr_id"); */
								Fr_Name=resultSet.getString("fr_name");
								Proj_Name=resultSet.getString("Project_Name");
								Dates=resultSet.getString("dates");
								reportDate=resultSet.getString("reportDate");
								col_1=resultSet.getString("col_1");
								col_2=resultSet.getString("col_2");
								col_3=resultSet.getString("col_3");
								col_4=resultSet.getString("col_4");
								col_5=resultSet.getString("col_5");
								col_6=resultSet.getString("col_6");
								col_7=resultSet.getString("col_7");
								col_8=resultSet.getString("col_8");
								col_9=resultSet.getString("col_9");
								col_10=resultSet.getString("col_10");
								col_11=resultSet.getString("col_11");
								col_12=resultSet.getString("col_12");
								col_13=resultSet.getString("col_13");
								col_14=resultSet.getString("col_14");
								col_15=resultSet.getString("col_15");
								col_16=resultSet.getString("col_16");
								col_17=resultSet.getString("col_17");
								col_18=resultSet.getString("col_18");
								col_19=resultSet.getString("col_19");
								col_20=resultSet.getString("col_20");
								col_21=resultSet.getString("col_21");
								review=resultSet.getString("review");
								
							  }
							  /* System.out.println(col_19);
							  System.out.println(col_20);
							  System.out.println(col_21); */
				%>
                
                <tbody>
                    <tr>
                        <th scope="row"></th>
                        <td colspan="1" >Project Name:  <%=Proj_Name %></td>
                        <td colspan="1" >Date: <%=Dates %></td>
                        
                  </tr>
                </tbody>
                  
                    <thead>
                      <tr>
                        <th scope="col">Sr.</th>
                        <th scope="col">FR Check list during Survey</th>
                        <th scope="col" colspan="2">SH/RC/FR Names</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                            <th scope="row"></th>
                            <td colspan="1" ></td>
                            <td colspan="2" ><%=Fr_Name %></td>
                            
                      </tr>
                      
                      <tr>
                        <th scope="row"></th>
                        <td colspan="1" >Date of Report</td>
                        <td colspan="2" >
                          <%=reportDate %>
                          
                        </td>
                        
                      </tr>
                      
                      <tr>
                        <th scope="row">1</th>
                        <td colspan="1" >Interview count for yesterday</td>
                        <td colspan="2" ><%=col_1 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td colspan="1" >Gender Sampling achieved(Female-30%)</td>
                        <td colspan="2" ><%=col_2 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td colspan="1" >Number of listed village covered</td>
                        <td colspan="2" ><%=col_3 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">4</th>
                        <td colspan="1" >Small shop+Self occupation</td>
                        <td colspan="2" ><%=col_4 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">5</th>
                        <td colspan="1" >Noted down all Villages/Halts issue & reported</td>
                        <td colspan="2" ><%=col_5 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">6</th>
                        <td colspan="1" >Popular candidate & candidate performance reported</td>
                        <td colspan="2" ><%=col_6 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">7</th>
                        <td colspan="1" >Informed FR how to deployed team in village halt</td>
                        <td colspan="2" ><%=col_7 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">8</th>
                        <td colspan="1" >Village correction reported for VS</td>
                        <td colspan="2" ><%=col_8 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">9</th>
                        <td colspan="1" >VS Map verification reported for VS</td>
                        <td colspan="2" ><%=col_9 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">10</th>
                        <td colspan="1" >Any tab Issue</td>
                        <td colspan="2" ><%=col_10 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">11</th>
                        <td colspan="1">All Interview form sync in tab of all Surveyors</td>
                        <td colspan="2" ><%=col_11 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">12</th>
                        <td colspan="1" >Any Car/bikes/vechile problem/issue faced</td>
                        <td colspan="2" ><%=col_12 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">13</th>
                        <td colspan="1" >Any Villagers/Police issue faced for the day</td>
                        <td colspan="2" ><%=col_13 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">14</th>
                        <td colspan="1" >Any Surveyor issue</td>
                        <td colspan="2" ><%=col_14 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">15</th>
                        <td colspan="1">Team count 1+5</td>
                        <td colspan="2" ><%=col_15 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">16</th>
                        <td colspan="1" >FR Interview count</td>
                        <td colspan="2" ><%=col_16 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">17</th>
                        <td colspan="1" >Daily Productivity</td>
                        <td colspan="2" ><%=col_17 %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">18</th>
                        <td colspan="1" >Masterji/Gyani Insan survey/Interview Count</td>
                        <td colspan="2" ><%=col_18 %></td>
                        
                      </tr>


                      
                      
                    </tbody>

                    <tbody>
                        <tr>
                            
                            <td  colspan="2">Summary of Discussion</td>
                            <td colspan="2"><%=col_19 %></td>
                            

                          <tr>
                            
                            <td  colspan="2">Further action required</td>
                            <td colspan="2"><%=col_20 %></td>
                            
                          </tr>

                          <tr>
                            
                            <td  colspan="2">Feedback given by (Name & Sign)</td>
                            <td colspan="2"><%=col_21 %></td>
                            
                          </tr>
                          
                       <tr >
                        <th colspan="4">
                         <label for="reviews">Give Your Review: </label>
                          <%=review %>
                       </th>
            
                      </tr>
                          
                    </tbody>
                  
               <%
							
				    } catch (Exception e) {
						e.printStackTrace();
					  }
			   %>
            </table>
            
			<div class="back_button"  >
                <button type="button" onclick="history.back()" name="back" class="btn btn-hover"  style="background-color: #990099; color: white;">Go Back</button>
             </div><br>
        </form> 

    </div>
    
</body>
</html>