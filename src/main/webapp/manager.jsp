<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .content {
            margin: 50px auto;
            max-width: 800px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001a;
        }
        .form-control {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container content">
        <h3 class="text-center">Manage Users</h3>

        <!-- Form to Add New User -->
        <form action="manager.jsp" method="POST">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
            <button type="submit" name="addUser" class="btn btn-primary w-100"><i class="fas fa-user-plus"></i> Add User</button>
        </form>

        <hr>

        <!-- Display Existing Users -->
        <h4>Existing Users</h4>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // Database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance_management", "root", "");

                        // Handle new user addition
                        if (request.getParameter("addUser") != null) {
                            String newUsername = request.getParameter("username");
                            String newEmail = request.getParameter("email");

                            String insertSql = "INSERT INTO users (username, email, role) VALUES (?, ?, 'user')";
                            pstmt = conn.prepareStatement(insertSql);
                            pstmt.setString(1, newUsername);
                            pstmt.setString(2, newEmail);
                            pstmt.executeUpdate();
                        }

                        // Display existing users
                        String selectSql = "SELECT * FROM users";
                        pstmt = conn.prepareStatement(selectSql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            int userId = rs.getInt("user_id");
                            String username = rs.getString("username");
                            String email = rs.getString("email");
                            String role = rs.getString("role");
                %>
                <tr>
                    <td><%= userId %></td>
                    <td><%= username %></td>
                    <td><%= email %></td>
                    <td><%= role %></td>
                    <td>
                        <form action="manager.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="user_id" value="<%= userId %>">
                            <button type="submit" name="deleteUser" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Clean up resources
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
