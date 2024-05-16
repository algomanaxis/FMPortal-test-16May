<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.text.SimpleDateFormat"%>
   <%@page import="java.util.Date"%>
   <%@page import="java.time.LocalDate"%>
   <%@page errorPage="error_page.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<link href="css/fr_caling.css" rel="stylesheet">
<title>FR Calling Report</title>
<style>
      select {
        width: 100%;
        height:40px;
      }

      select option {
        width: 100%;
        height:40px;
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
		String prjName=request.getParameter("projectName");	
     
	%>
	<%
		String frname=request.getParameter("frName");		
	%>
	<%
                HttpSession session2=request.getSession();  
                session2.setAttribute("Fr_Name",frname);  
                
    %>
    <%
          Date date = new Date();
	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	     String strDate= formatter.format(date);
	     
	     /* LocalDate strDate = LocalDate.now(); */
	    // System.out.println("page one "+strDate); 
	     HttpSession datesession=request.getSession();  
	     datesession.setAttribute("CurDateQQQ",strDate); 
    %>
	
     <div style="margin: 20px;">
        <div class="text-center" style="padding-top: 10px; padding-bottom: 10px;">
        <img src="Image/Picture1.jpg" width="350" height="80" class="center" alt="Responsive image">
    </div>

    <div class="container">

        <form id="myform" method="post" action="insert" >
            
            <table class="table table-hover table-bordered">

                <thead >
                    <th colspan="9" class="text-center" style="background-color: #990099; color: white;">FR Calling Report</th>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row"></th>
                        <td colspan="1" >Project Name: <%=prjName%></td>
                        <td colspan="1" >Date: <%=strDate%></td>
                        <!-- <td colspan="1" >FR ID<input  type="text"   name="fr_id" value=""></td> -->
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
                            <td colspan="2" ><%=frname%></td>
                            
                      </tr>
                      <tr>
                        <th scope="row"></th>
                        <td colspan="1" >Select date to get data</td>
                        <td colspan="2" >
                          <form id="datecheck">
                            <input  type="date"   name="Date" id="date" required  max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" >
                            <button type="button" class="btn btn-info"  id="save" onclick="search()">Find</button> 
                          </form>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">1</th>
                        <td colspan="1" >Interview count for yesterday</td>
                        <td colspan="2" ><input  type="text"   name="row1" id="row1" value="" ></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td colspan="1" >Gender Sampling achieved(Female-30%)</td>
                        <td colspan="2" ><input  type="text"   name="row2" id="row2" value="" ></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td colspan="1" >Number of listed village covered</td>
                        <td colspan="2" ><input  type="text"   name="row3" id="row3" value="" required></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">4</th>
                        <td colspan="1" >Small shop+Self occupation</td>
                        <td colspan="2" ><input  type="text"   name="row4" id="row4" value=""></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">5</th>
                        <td colspan="1" >Noted down all Villages/Halts issue & reported</td>
                        <td colspan="2" >
                        <select name="row5" id="row5" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">6</th>
                        <td colspan="1" >Popular candidate & candidate performance reported</td>
                        <td colspan="2" >

                        <select name="row6" id="row6" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">7</th>
                        <td colspan="1" >Informed FR how to deployed team in village halt</td>
                        <td colspan="2" >
                        <select name="row7" id="row7" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">8</th>
                        <td colspan="1" >Village correction reported for VS</td>
                        <td colspan="2" >
                        <select name="row8" id="row8" >
                        <option value="No Correction Applicable">No Correction Applicable</option>
                        <option value="Correction Applicable">Correction Applicable</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">9</th>
                        <td colspan="1" >VS Map verification reported for VS</td>
                        <td colspan="2" >
                        <select name="row9" id="row9" >
                        <option value="Map Verified">Map Verified</option>
                        <option value="Map Not Verified">Map Not Verified</option>
                        </select></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">10</th>
                        <td colspan="1" >Any tab Issue</td>
                        <td colspan="2" >
                        <select name="row10" id="row10" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">11</th>
                        <td colspan="1">All Interview form sync in tab of all Surveyors</td>
                        <td colspan="2" >
                        <select name="row11" id="row11" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">12</th>
                        <td colspan="1" >Any Car/bikes/vechile problem/issue faced</td>
                        <td colspan="2" >
                        <select name="row12" id="row12" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">13</th>
                        <td colspan="1" >Any Villagers/Police issue faced for the day</td>
                        <td colspan="2" >
                        <select name="row13" id="row13" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">14</th>
                        <td colspan="1" >Any Surveyor issue</td>
                        <td colspan="2" >
                        <select name="row14" id="row14" >
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                        </select>
                        </td>
                        
                      </tr>
                      <tr>
                        <th scope="row">15</th>
                        <td colspan="1">Team count 1+5</td>
                        <td colspan="2" ><input  type="text"   name="row15" id="row15" value="" ></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">16</th>
                        <td colspan="1" >FR Interview count</td>
                        <td colspan="2" ><input  type="text"   name="row16" id="row16" value=""></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">17</th>
                        <td colspan="1" >Daily Productivity</td>
                        <td colspan="2" ><input  type="text"   name="row17" id="row17" value="" ></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">18</th>
                        <td colspan="1" >Masterji/Gyani Insan survey/Interview Count</td>
                        <td colspan="2" ><input  type="text"   name="row18" id="row18" value="" required></td>
                        
                      </tr>


                      
                      
                    </tbody>

                    <tbody>
                        <tr>
                            
                            <td  colspan="2">Summary of Discussion</td>
                            <td><textarea style="outline :none ; border:none;width:200;  type="text" cols="60" type="text" name="Summary" id="Summary" "></textarea></td>
                            

                          <tr>
                            
                            <td  colspan="2">Further action required</td>
                            <td><textarea style="outline :none ; border:none;width:200;  type="text" cols="60" type="text" name="action_req" id="action_req" "></textarea></td>
                            
                          </tr>

                          <tr>
                            
                            <td  colspan="2">Feedback given by (Name & Sign)</td>
                            <td colspan="2"><input  type="text"   name="Feedback" value="<%=session.getAttribute("name")%>" required></td>
                            
                          </tr>
                          
                       <tr >
                        <th colspan="4">
                         <label for="reviews">Give Your Review:</label>
                           <select name="review" id="review" >
                            <option value="Feedback">FeedBack</option>
                            <option value="Warning">Warning</option>
                            <option value="Action">Action</option>
                         </select>
                       </th>
            
                      </tr>
                          
                    </tbody>
                  
                  
            </table>
            <input type="hidden" id="valueId" name="frname" value="<%=frname%>">   
            <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >
            <input type="hidden" id="date" name="date" value="<%= (new java.util.Date()).toLocaleString()%>" >
            <%request.getSession().setAttribute("projname", prjName); %>
            <div class="text-center" >
               <button type="submit" class="btn btn-hover" style="background-color: #990099; color: white;">Submit</button>
           </div>
        </form>

    </div>
     
     <script src="jquery/jquery.js" type="text/javascript"></script>
     <script src="jquery/jquery.min.js" type="text/javascript"></script>
      
      <script>
        function search()
         {
        	 $.ajax({
        		 type:"post",
        		 url:"findFRCalling.jsp",
        		 data:{"dte":$("#date").val()},
        		 success:function(msg)
        		 {
        			 console.log(msg);
        			 var obj=JSON.parse(msg);
        			 /* if(val(obj[0].teams_count==null)
        			{
        				 alert("Did Not work yesterday");
        			}  */
        			 /* else{ */
        			 $("#row1").val(obj[0].teams_count);
        			 $("#row2").val(obj[0].female_sampling);
        			 $("#row4").val(obj[0].small_shop);
        			 $("#row15").val(obj[0].team_cnt);
        			 $("#row16").val(obj[0].fr_cnt);
        			 $("#row17").val(obj[0].daily_productivity);
        			/*  } */
        			
        		 },
        		 error:function(xhr)
        		 {
        			 alert("error");
        		 }
        	 });
         }  
         
         
      </script> 
     
     
</body>
</html>