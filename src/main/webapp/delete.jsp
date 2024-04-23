<%@page import="java.sql.*"%>
<%@page import="jakarta.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java1051", "root", "");
	if(request.getParameter("delete")!=null)
	{
		Statement stmt = con.createStatement();
		int i = stmt.executeUpdate("delete from student where roll = "+request.getParameter("roll"));
		if(i==1)
		{
		%>
			<jsp:forward page="studentDetails.jsp" />
		<%
		}
	}
	%>
</body>
</html>