<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%

String user=request.getParameter("user");
session.putValue("user",user);
String pwd=request.getParameter("pwd");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
"root","root");
Statement st= con.createStatement();
int i = st.executeUpdate("insert into users ( user, pwd,fname, lname, email) values ('"+user+"','"+pwd+"','"+fname+"','"+lname+"','"+email+"')");
if (i > 0) {
        
       out.print("Registration Successfull!"+"<a href='index.html'>Go to Login</a>");
    } else {
        response.sendRedirect("index.html");
    }
%>