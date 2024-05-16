<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error_page.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<link href="css/fr_caling.css" rel="stylesheet">
<title>Select any One</title>
<!-- <script type="text/javascript">
  alert("Fr Report Added");
</script> -->
</head>
<body>
    <div style="margin: 20px;">
        <div class="text-center" style="padding-top: 10px; padding-bottom: 10px;">
        <img src="Image/Picture1.jpg" width="350" height="80" class="center" alt="Responsive image">
    </div>
    <%
		String prjName=request.getParameter("projectName");		
	%>	
	<div class="container">
	<center>
    <Form action="CheckValueFRCalling.jsp" method="post">
       <table class="table table-hover table-bordered">
       <%-- <%request.getSession().setAttribute("projectName", prjName); %> --%>
       <%-- <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" > --%>
       <!-- <h2>Do You Want to add another FR:</h2> -->
       <thead >
                    <th colspan="9" class="text-center" style="background-color: #990099; color: white;">Do You Want to add another FR</th>
       </thead>
       <tbody>
       <tr>
       <td width="30%"><input type="radio" name="flg" value="yes" />Yes</td>
       <td width="30%"><input type="radio" name="flg" value="no" />No</td> 
       </tr>
       </tbody>
       <!-- <a href="frName.jsp">Yes</a>
       <a href="index.jsp">No</a> -->
       <br/><br/>
       
       </table>
       <input type="hidden" id="valueProject" name="projectName" value="<%=prjName%>" >
       <div class="text-center" >
               <button type="submit" class="btn btn-hover" style="background-color: #990099; color: white;">Submit</button>
       </div>
    </Form>
    </center>
    </div>
    
</body>
</html>