<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@page errorPage="error_page.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



</head>
<body>
       	
       <%
           String s=request.getParameter("flg");
           if(s.equals("yes")){
        	    /* RequestDispatcher rd=request.getRequestDispatcher("/frName.jsp");
        	   rd.forward(request,response); */
        	   /* request.getSession().getAttribute("projname");
        	   request.getSession().setAttribute("projname", request.getSession().getAttribute("projname"));*/
        	   
        	  response.sendRedirect("http://192.168.1.147:8080/FieldMonitoringProject/frNameFRCalling.jsp?project="+request.getSession().getAttribute("projname")+"");//
        	   
        	//   response.sendRedirect("http://192.168.1.198:8080/FieldMonitoringProject/frNameFRCalling.jsp?project="+request.getSession().getAttribute("projname")+"");
        	   
           }
           else{
        	   /* RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
        	   rd.forward(request,response); */
        	   response.sendRedirect("indexFRCalling.jsp"); 
           }
       
       %>
</body>
</html>