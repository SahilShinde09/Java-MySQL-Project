<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	if(con==null)
	{
		try
		{
			con = (Connection) application.getAttribute("mycon");
			String query = "insert into student(name,lname,email,phoneNo,password)"
					+ "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
		}
		catch (SQLException e) 
		{
			System.out.println("Problem : "+e);
		}
	}
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String phoneNo = request.getParameter("phno");
	String password = request.getParameter("password");
	
	try {
		pstmt.setString(1, fname);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		pstmt.setString(2, lname);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		pstmt.setString(3, email);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		pstmt.setString(4, phoneNo);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		pstmt.setString(5, password);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	


	try {
		ResultSet rs = pstmt.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	int i = 0;
	try {
		i = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(i>0)
	{
%>
		<jsp:forward page="index.html"/>
<% 
	}
	else
	{
		out.print("<script>");
		out.print("alert('Registration Failed!');");
		out.print("</script>");
	}
%>

<%!
	Connection con;
	PreparedStatement pstmt;
%>
</body>
</html>