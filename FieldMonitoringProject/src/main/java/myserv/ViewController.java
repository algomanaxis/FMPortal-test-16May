package myserv;

import java.io.IOException;
import java.util.ArrayList;

import information.AttendanceInfo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class viewController
 */
@WebServlet("/viewform")
public class ViewController extends HttpServlet {
	private final long serialVersionUID = 1L;
	
	//ArrayList<AttendanceInfo> sdf=new ArrayList<>();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		  long id = Integer.parseInt(request.getParameter("ID"));
		
			
		  HttpSession session=request.getSession();  
	      session.setAttribute("ID",id);  
		  response.sendRedirect("frviewFRCalling.jsp"); 
		
	}

}
