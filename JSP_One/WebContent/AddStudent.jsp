<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add student</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%
// Create empty new variable
String message = null;
String id = request.getParameter("ID");
String name = request.getParameter("Name");
String depart = request.getParameter("Department");

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

PreparedStatement stmt = null;
Connection connection = null;

try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);

		stmt= connection.prepareStatement("insert into student values(?,?,?)");
		stmt.clearParameters();
		stmt.setString(1, id);
		stmt.setString(2, name);
		stmt.setString(3, depart);
		
		// Run the query
		stmt.executeUpdate();
		//connection.commit();
		out.println("<p> <b> A new student have been successfully registered !</b></p>");
		
		// Close database connection
		stmt.close();
		connection.close();
		
} catch (SQLException ex) {
out.println("<p><b> Could not be registered due to a system error. </b></p><p>" + ex.getMessage()+ "</p>");
   stmt.close();
   connection.close();

}
%>
</body>
</html>