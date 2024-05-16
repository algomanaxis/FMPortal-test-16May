package myserv;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mybean.Frbean;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/**
 * Servlet implementation class FrController
 */
@WebServlet("/insert")
public class FrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String username="";
		String password="";
		
		
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

	                }
	            }
	        } catch (Exception e) {
	        	 e.printStackTrace();
	        }
		

		
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        HttpSession session1=request.getSession();
        String projname=(String) session1.getAttribute("projname");
		/* System.out.println(projname+"new project"); */
		
		  
		 
		  
        HttpSession datesession=request.getSession(false);  
        String strDate=(String) datesession.getAttribute("CurDateQQQ");
		/* System.out.println(date+" date one"); */
		/*
		 * String strDate=date.toString(); System.out.println("CurDateQQQ"+strDate);
		 */
		/*
		 * Date date = curdate; SimpleDateFormat formatter = new
		 * SimpleDateFormat("dd/MM/yyyy"); String strDate= formatter.format(date);
		 */
     
       
        
	//	System.out.println(strDate + "  Akash date nahi aa rha");
        
        String name=request.getParameter("frname");
		/* System.out.println("FR Names:  "+"-------"+ name); */
        String date=request.getParameter("Date");
        String row1=request.getParameter("row1");
		/* System.out.println("Interview count for yesterday"+"   "+row1); */
        
        String row2=request.getParameter("row2");
		/* System.out.println("Gender Sampling achieved(Female-30%)"+"    "+row2); */
        
        String row3=request.getParameter("row3");
		/* System.out.println("Number of listed village covered"+"    "+row3); */
		
		String row4=request.getParameter("row4");
		/* System.out.println("Small shop+Self occupation"+"    "+row4); */
		
		String row5=request.getParameter("row5");
		/*
		 * System.out.println("Noted down all Villages/Halts issue & reported"+"    "
		 * +row5);
		 */
		
		String row6=request.getParameter("row6");
		/*
		 * System.out.println("Popular candidate & candidate performance reported"
		 * +"    "+row6);
		 */
		
		String row7=request.getParameter("row7");
		/*
		 * System.out.println("Informed FR how to deployed team in village halt"+"    "
		 * +row7);
		 */
		
		String row8=request.getParameter("row8");
		/* System.out.println("Village correction reported for VS"+"    "+row8); */
		
		String row9=request.getParameter("row9");
		/* System.out.println("VS Map verification reported for VS"+"    "+row9); */
		
		String row10=request.getParameter("row10");
		/* System.out.println("Any tab Issue"+"    "+row10); */
		
		String row11=request.getParameter("row11");
		/*
		 * System.out.println("All Interview form sync in tab of all Surveyors"+"    "
		 * +row11);
		 */
		
		String row12=request.getParameter("row12");
		/*
		 * System.out.println("Any Car/bikes/vechile problem/issue faced"+"    "+row12);
		 */
		
		String row13=request.getParameter("row13");
		/*
		 * System.out.println("Any Villagers/Police issue faced for the day"+"    "
		 * +row13);
		 */
		
		String row14=request.getParameter("row14");
		/* System.out.println("Any Surveyor issue"+"    "+row14); */
		
		String row15=request.getParameter("row15");
		/* System.out.println("Team count 1+5"+"    "+row15); */
		
		String row16=request.getParameter("row16");
		/* System.out.println("FR Interview count"+"    "+row16); */
		
		String row17=request.getParameter("row17");
		/* System.out.println("Daily Productivity"+"    "+row17); */
		
		String row18=request.getParameter("row18");
		/*
		 * System.out.println("Masterji/Gyani Insan survey/Interview Count"+"    "+row18
		 * );
		 */
		
		String row19=request.getParameter("Summary");
		/* System.out.println("Summary of Discussion"+"    "+row19); */
		
		if(row19.contains("'"))
		{
			row19=row10.replace("'", "");
		}
		
		String row20=request.getParameter("action_req");
		/* System.out.println("Further action required"+"    "+row20); */
		
		if(row20.contains("'"))
		{
			row20=row20.replace("'", "");
		}
		
		String row21=request.getParameter("Feedback");
		/* System.out.println("Feedback given by (Name & Sign)"+"    "+row21); */
		
		String review=request.getParameter("review");
		
		
		Frbean frbean=new Frbean();
		
		frbean.setFr_Name(name);
		frbean.setProj_Name(projname);
		frbean.setDates(strDate);
		frbean.setReportdate1(date);
		frbean.setUsername(username);
		frbean.setPassword(password);
		frbean.setCol_1(row1);
		frbean.setCol_2(row2);
		frbean.setCol_3(row3);
		frbean.setCol_4(row5);
		frbean.setCol_5(row5);
		frbean.setCol_6(row6);
		frbean.setCol_7(row7);
		frbean.setCol_8(row8);
		frbean.setCol_9(row9);
		frbean.setCol_10(row10);
		frbean.setCol_11(row11);
		frbean.setCol_12(row12);
		frbean.setCol_13(row13);
		frbean.setCol_14(row14);
		frbean.setCol_15(row15);
		frbean.setCol_16(row16);
		frbean.setCol_17(row17);
		frbean.setCol_18(row18);
		frbean.setCol_19(row19);
		frbean.setCol_20(row20);
		frbean.setCol_21(row21);
		frbean.setReview(review);
		if(projname!="" && name!="" && row21!="" && review!="")
		  frbean.insertData(name,projname, strDate,date, row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12, row13, row14, row15, row16, row17, row18, row19, row20, row21, review);
		out.println("<script type=\"text/javascript\">");
        out.println("var choice = confirm('Data inserted successfully! Do you want to add another FR');");
        out.println("if (choice) {");
        out.println("var projectName = '" + projname + "';");
        out.println("window.location.href = 'frNameFRCalling_FPBP.jsp?project=' + projectName;"); // Redirect to selectfr.jsp if Yes is selected
        out.println("} else {");
        
        out.println("window.location.href = 'indexFRCalling.jsp';"); // Redirect to index.jsp if No is selected
        out.println("}");
        out.println("</script>");
	}

	private DateFormat SimpleDateFormat(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}
