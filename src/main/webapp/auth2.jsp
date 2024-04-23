
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<%
	if(con==null)
	{
		try
		{
			con = (Connection) application.getAttribute("mycon");
			String query = "select * from admin where name=? and password=?";
			pstmt = con.prepareStatement(query);
		}
		catch (SQLException e) 
		{
			System.out.println("Problem : "+e);
		}
	}
	String name = request.getParameter("tname");
	String pass = request.getParameter("tpass");
	
	pstmt.setString(1, name);
	pstmt.setString(2, pass);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next())
	{
		/* out.print("<h1>Your Name :"+name+"</h1>");
		out.print("<h1>Login Success!!!</h1>");
		out.print("<h1>Welcome To VowTech</h1>"); */
%>
		<jsp:forward page="Adsuccess.jsp" />
<%   
	}
	else
	{
		out.print("<script>");
		out.print("alert('Login Failed!');");
		out.print("</script>");
%>
		<jsp:include page="index.html"/>
<%		
	}
%>

<%!
	Connection con=null;
	PreparedStatement pstmt;
%>
</body>
</html>