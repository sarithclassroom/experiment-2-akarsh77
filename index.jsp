<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
try {

	// Load (and therefore register) the MySQL Driver
	Class.forName("com.mysql.jdbc.Driver");

	// Get a Connection to the database
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");

	// Create a Statement object
	stmt = con.createStatement();

	// Execute an SQL query, get a ResultSet
	rs = stmt.executeQuery("SELECT * FROM users where user='"+username+"' and pwd ='"+userpass+"'");

	if(rs.next()){
				out.print("Welcome, "+username);
				out.print(" Login Successfull!!");	
			}
			else{
				out.print("Sorry username or password error "+"<a href='index.html'>Try again here</a>");
				
			}
}
		catch(ClassNotFoundException e) {
		out.println("Couldn't load database driver: " + e.getMessage());
		}

		catch(SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
		}

		finally {
		// Always close the database connection.
		try {
			if (con != null) con.close();
		}
		catch (SQLException ignored) { }
		}
%>