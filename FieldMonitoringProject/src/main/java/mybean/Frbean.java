package mybean;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;


import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import jakarta.servlet.http.HttpServletResponse;


public class Frbean {
	
	
	
	

	Connection con = null;
	Statement st = null;
	
	

	
	
	
	private static String url = "jdbc:mysql://localhost:3306/survey_monitor";
	private static String user = "";
	private static String pass = "";

	private String Fr_Name;
	private String Proj_Name;
	private String Dates;
	private String reportdate1;
	private String col_1;
	private String col_2;
	private String col_3;
	private String col_4;
	private String col_5;
	private String col_6;
	private String col_7;
	private String col_8;
	private String col_9;
	private String col_10;
	private String col_11;
	private String col_12;
	private String col_13;
	private String col_14;
	private String col_15;
	private String col_16;
	private String col_17;
	private String col_18;
	private String col_19;
	private String col_20;
	private String col_21;
	private String review;
	private String username;
	private String password;
	

	public String getFr_Name() {
		return Fr_Name;
	}

	public void setFr_Name(String fr_Name) {
		Fr_Name = fr_Name;
	}

	public String getProj_Name() {
		return Proj_Name;
	}

	public void setProj_Name(String proj_Name) {
		Proj_Name = proj_Name;
	}

	public String getDates() {
		return Dates;
	}

	public void setDates(String dates) {
		Dates = dates;
	}

	public String getCol_1() {
		return col_1;
	}

	public void setCol_1(String col_1) {
		this.col_1 = col_1;
	}

	public String getCol_2() {
		return col_2;
	}

	public void setCol_2(String col_2) {
		this.col_2 = col_2;
	}

	public String getCol_3() {
		return col_3;
	}

	public void setCol_3(String col_3) {
		this.col_3 = col_3;
	}

	public String getCol_4() {
		return col_4;
	}

	public void setCol_4(String col_4) {
		this.col_4 = col_4;
	}

	public String getCol_5() {
		return col_5;
	}

	public void setCol_5(String col_5) {
		this.col_5 = col_5;
	}

	public String getCol_6() {
		return col_6;
	}

	public void setCol_6(String col_6) {
		this.col_6 = col_6;
	}

	public String getCol_7() {
		return col_7;
	}

	public void setCol_7(String col_7) {
		this.col_7 = col_7;
	}

	public String getCol_8() {
		return col_8;
	}

	public void setCol_8(String col_8) {
		this.col_8 = col_8;
	}

	public String getCol_9() {
		return col_9;
	}

	public void setCol_9(String col_9) {
		this.col_9 = col_9;
	}

	public String getCol_10() {
		return col_10;
	}

	public void setCol_10(String col_10) {
		this.col_10 = col_10;
	}

	public String getCol_11() {
		return col_11;
	}

	public void setCol_11(String col_11) {
		this.col_11 = col_11;
	}

	public String getCol_12() {
		return col_12;
	}

	public void setCol_12(String col_12) {
		this.col_12 = col_12;
	}

	public String getCol_13() {
		return col_13;
	}

	public void setCol_13(String col_13) {
		this.col_13 = col_13;
	}

	public String getCol_14() {
		return col_14;
	}

	public void setCol_14(String col_14) {
		this.col_14 = col_14;
	}

	public String getCol_15() {
		return col_15;
	}

	public void setCol_15(String col_15) {
		this.col_15 = col_15;
	}

	public String getCol_16() {
		return col_16;
	}

	public void setCol_16(String col_16) {
		this.col_16 = col_16;
	}

	public String getCol_17() {
		return col_17;
	}

	public void setCol_17(String col_17) {
		this.col_17 = col_17;
	}

	public String getCol_18() {
		return col_18;
	}

	public void setCol_18(String col_18) {
		this.col_18 = col_18;
	}

	public String getCol_19() {
		return col_19;
	}

	public void setCol_19(String col_19) {
		this.col_19 = col_19;
	}

	public String getCol_20() {
		return col_20;
	}

	public void setCol_20(String col_20) {
		this.col_20 = col_20;
	}

	public String getCol_21() {
		return col_21;
	}

	public void setCol_21(String col_21) {
		this.col_21 = col_21;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getReportdate1() {
		return reportdate1;
	}

	public void setReportdate1(String reportdate1) {
		this.reportdate1 = reportdate1;
	}

	int i = 0;

	public int insertData(String name, String projname, String date,String reportdate, String row1, String row2, String row3, String row4,
			String row5, String row6, String row7, String row8, String row9, String row10, String row11, String row12,
			String row13, String row14, String row15, String row16, String row17, String row18, String row19,
			String row20, String row21, String review) {
		try {
			
			
			user=username;
			pass=password;		
		
			
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			st = con.createStatement();
			//System.out.println("$$$$$" + name);

			i = st.executeUpdate(
					"INSERT INTO fr_register(fr_name,Project_Name,dates,reportDate,col_1,col_2,col_3,col_4,col_5, col_6,col_7,col_8,col_9,col_10,col_11,col_12,col_13,col_14,col_15,col_16, col_17,col_18,col_19,col_20,col_21,review) VALUES('"
							+ name + "','" + projname + "','" + date + "','" + reportdate + "','" + row1 + "','" + row2 + "' ,'" + row3
							+ "','" + row4 + "','" + row5 + "','" + row6 + "','" + row7 + "','" + row8 + "','" + row9
							+ "' ,'" + row10 + "','" + row11 + "','" + row12 + "','" + row13 + "','" + row14 + "','"
							+ row15 + "',' " + row16 + "','" + row17 + "','" + row18 + "','" + row19 + "','" + row20
							+ "','" + row21 + "',' " + review + "')");

			con.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	

	

	/*
	 * public ArrayList<Frbean> selectById(long id) { ArrayList<Frbean> frdata=new
	 * ArrayList<Frbean>(); ResultSet resultset=null; try {
	 * Class.forName("com.mysql.jdbc.Driver"); con =
	 * DriverManager.getConnection(url,user,pass); st = con.createStatement();
	 * resultset=st.
	 * executeQuery("SELECT (fr_name,Project_Name,dates,col_1,col_2,col_3,col_4,col_5, col_6,col_7,col_8,col_9,col_10,col_11,col_12,col_13,col_14,col_15,col_16, col_17,col_18,col_19,col_20,col_21,review) FROM fr_register WHERE id=id"
	 * ); Frbean frbeannew=new Frbean();
	 * frbeannew.setFr_Name(resultset.getString("fr_name"));
	 * frbeannew.setProj_Name(resultset.getString("Project_Name"));
	 * frbeannew.setDates(resultset.getString("dates"));
	 * frbeannew.setFr_id(resultset.getString("fr_id"));
	 * 
	 * frdata.add(frbeannew); con.close(); st.close(); }catch(Exception e) {
	 * e.printStackTrace(); } return frdata;
	 * 
	 * }
	 */

}
