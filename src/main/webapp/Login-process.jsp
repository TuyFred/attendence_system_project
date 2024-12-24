<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" %>

<% 
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String dbUsername = null;
    String dbPassword = null;
    boolean validUser = false;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver class
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance_management", "root", ""); // Replace with your DB URL, username, and password

        // SQL query to check credentials
        PreparedStatement ps = con.prepareStatement("SELECT username, password FROM admins WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            dbUsername = rs.getString("username");
            dbPassword = rs.getString("password");

            // Check if passwords match (you can hash the password and compare it)
            if (password.equals(dbPassword)) {
                validUser = true;
            }
        }

        // Close the database connection
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Database connection problem: " + e.getMessage());
    }

    if (validUser) {
        // Redirect to dashboard or homepage if valid user
        HttpSession Session = request.getSession();
        session.setAttribute("username", dbUsername);
        response.sendRedirect("admin.jsp"); // Redirect to the dashboard page
    } else {
        // Redirect back to the login page with an error message
        request.setAttribute("error", "Invalid username or password.");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
%>





