<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update details</title>

</head>
<body>


<% 

	String rollno = request.getParameter("rollno");
	String name = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String phoneNo = request.getParameter("phoneNo");
	
	if(rollno!=null)
	{
		con = null;
		pstmt = null;
		int rollNO = Integer.parseInt(rollno);
		
		try
		{
			con = (Connection) application.getAttribute("mycon");
			String query = "Update student set roll=?,name=?,lname=?,email=?,phoneNo=? where roll="+rollno;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rollno);
			pstmt.setString(2, name);
			pstmt.setString(3, lname);
			pstmt.setString(4, email);
			pstmt.setString(5, phoneNo);
			
			int i = pstmt.executeUpdate();
			if(i>0)
			{
			%>
				<jsp:forward page="studentDetails.jsp"/>
			<% 
			}
			else
			{
				out.println("Not Updated");
			}
		}
		catch(SQLException query)
		{
		request.setAttribute("error", query);
		out.println(query);
		}
	}

%>
</body>
<%!
	Connection con;
	PreparedStatement pstmt;
	String query;
%>
</html>





