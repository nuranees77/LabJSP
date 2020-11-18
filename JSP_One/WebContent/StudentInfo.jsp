<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Info</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("ID");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC";
String dbName = "db1";
String userId = "root";
String password = "system";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;

try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);

		// Create a statement to retrieve objects
		Statement s = connection.createStatement();

		// Retrieve results from the table
		ResultSet rs = s.executeQuery ("Select * from student where id=" + id);
		
		// Print columns headers
		ResultSetMetaData rsmd =rs.getMetaData();
		int i =rsmd.getColumnCount( );
		
		for(int j=1; j<=i; j++) {
			out.print(rsmd.getColumnName(j)+"\t");
			out.print("\n");
		}
		
		// Print records
		while(rs.next( ) ) {
			out.println();
			for(int j=1; j<=i; j++)
			{
				out.print ( rs.getString( j)+"\t");
			}
		}
		
		// Close database connection
		connection.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<form action="AddStudent.html">
<p>
<input type="submit" value="add student"><br/>
</p>
</form>
</body>
</html>