package com.dev.logDetails;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Condition
 */
@WebServlet("/masterjiDataSubmit")
public class Masterji_Data extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			
		  String state =request.getParameter("state"); 
		  String name=request.getParameter("name"); 
		  String phone  =request.getParameter("phone"); 
		  String age =request.getParameter("age");
		  String maseterji =request.getParameter("maseterji"); 
		  String recruiter =request.getParameter("recruiter"); 
		  String surveyor =request.getParameter("surveyor"); 
		  String feedback =request.getParameter("feedback"); 
		  String remark  =request.getParameter("remark");
		String webPage="RMP/"+state+"/"+name+"-"+phone;
		
		

		HttpSession session =request.getSession();	
		
		RequestDispatcher rq=null;
		Connection con=null;	
		String dept=(String)session.getAttribute("dept");
		String date=(String)session.getAttribute("date");
		
		response.setContentType("text/html");
		String username="";
		String password="";
		String logInTime=(String)session.getAttribute("logInTime");
		String userName=(String) session.getAttribute("name");
		String logOutTime =java.time.LocalTime.now().toString();
		String difference="";		
		
		try {
        String time1 =logInTime.substring(0,8);
        String time2 =logOutTime.substring(0,8);

        SimpleDateFormat simpleDateFormat= new SimpleDateFormat("HH:mm:ss");

		  
		    Date date1 = simpleDateFormat.parse(time1);
		    Date date2 = simpleDateFormat.parse(time2);		
		  
		    long differenceInMilliSeconds= Math.abs(date2.getTime() - date1.getTime());		
		    long differenceInHours = (differenceInMilliSeconds / (60 * 60 * 1000)) % 24;
		    long differenceInMinutes= (differenceInMilliSeconds / (60 * 1000)) % 60;
		    long differenceInSeconds = (differenceInMilliSeconds / 1000) % 60;
		
		   difference= differenceInHours + "h " + differenceInMinutes + "m "+ differenceInSeconds + "s ";
		
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		
		
	       try {
	            String fileName = "/config/config.xml";
	            InputStream ins = getServletContext().getResourceAsStream(fileName);
	            if (ins == null) {
	                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
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
	                     password = passElement.getTextContent();
	                     //System.out.print(username+" "+password);
	                }
	            }            
	                  
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/survey_monitor?useSSL=false",username, password);			
		
			PreparedStatement ps=con.prepareStatement("INSERT INTO sm_login_logs (date,name,dept,webPage,logOutTime,duration,logInTime) VALUES(?,?,?,?,?,?,?)");	
			ps.setString(1, date);
			ps.setString(2, userName);
			ps.setString(3, dept);
			ps.setString(4, webPage);
			ps.setString(5, logOutTime);
			ps.setString(6, difference);
			ps.setString(7, logInTime.substring(0,8));			
			int cnt=ps.executeUpdate();	
		
		
		
		

		
			/*
			 * String state =request.getParameter("state"); String
			 * name=request.getParameter("name"); String phone
			 * =request.getParameter("phone"); String age =request.getParameter("age");
			 * String maseterji =request.getParameter("maseterji"); String recruiter
			 * =request.getParameter("recruiter"); String surveyor
			 * =request.getParameter("surveyor"); String feedback
			 * =request.getParameter("feedback"); String remark
			 * =request.getParameter("remark");
			 */
		  
		  
			/*
			 * out.print("name :" +name); out.print("state :" +state); out.print("phone :"
			 * +phone); out.print("age :" +age); out.print("maseterji :" +maseterji);
			 * out.print("recruiter :" +recruiter); out.print("surveyor :" +surveyor);
			 * out.print("feedback :" +feedback); out.print("remark :" +remark);
			 */
		  
		  
		  
		  
		    RequestDispatcher rd=null;
			response.setContentType("text/html");        

			
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://192.168.0.212:3306/checklistdb?useSSL=false","root","axis@123");
		        ps=con.prepareStatement("UPDATE `Masterji_DB` SET Remarks=?,Feedback=?  WHERE RespondentName=? AND Phone_Number =? AND State=?");
		        ps.setString(1,remark);
		        ps.setString(2,feedback);
		        ps.setString(3,name);
		        ps.setString(4,phone);
		        ps.setString(5,state);
		     
		        int rs=ps.executeUpdate();
		        
		        if(rs!=0) {
		        	
		        }else {
		        	 System.out.print("data not inserted");
		        }
		      
		        
		        rd=request.getRequestDispatcher("allData_masterji.jsp");
		        rd.forward(request, response);
		       
		        ps.close();
		        con.close();
		        
		      

		    } catch(Exception e){
			    e.printStackTrace();	    	
			    }
			    finally {
			    	try {
			    	con.close();
			    	} catch(SQLException e){
			    		e.printStackTrace();
			    	}

			    }

	}

}
