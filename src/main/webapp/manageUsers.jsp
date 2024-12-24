<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
            background-color: #f4f4f4; /* Light gray for a clean background */
            font-family: Arial, sans-serif;
            display: flex;
            min-height: 100vh;
            margin: 0;
            flex-direction: column;
        }
        .sidebar {
            background-color: #003366; /* Dark blue */
            padding: 20px;
            min-width: 200px;
            height: 100vh;
            position: fixed;
        }
        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            display: block;
            margin: 15px 0;
            transition: background-color 0.3s;
        }
        .sidebar a:hover {
            background-color: #004080; /* Slightly lighter blue */
            padding-left: 10px;
        }
        .container-content {
            margin-left: 220px;
            padding: 30px;
            flex: 1;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            margin-top: 20px;
        }
        .footer {
            background-color: #003366; /* Dark blue */
            color: #ffffff;
            text-align: center;
            padding: 15px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .btn-primary {
            background-color: #0056b3; /* Custom blue */
            border: none;
        }
        .btn-primary:hover {
            background-color: #004494; /* Darker blue on hover */
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h4 class="text-white">Admin Dashboard</h4>
        <a href="manageUsers.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="recordAttendance.jsp"><i class="fas fa-calendar-check"></i> View Attendance Records</a>
        <a href="#"><i class="fas fa-chart-line"></i> Attendance Analysis</a>
        <a href="#"><i class="fas fa-cogs"></i> Settings</a>
        <a href="generateReport.jsp"><i class="fas fa-file-alt"></i> Generate Report</a>
    </div>

    <div class="container-content">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Manage Users</h3>
            <button class="btn btn-success" onclick="window.location.href='downloadPDF.jsp'">
                <i class="fas fa-file-download"></i> Download PDF
            </button>
        </div>

        <form action="manageUsers.jsp" method="POST" class="mb-3">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
            <button type="submit" name="addUser" class="btn btn-primary mt-2 w-100"><i class="fas fa-user-plus"></i> Add User</button>
        </form>

        <input type="text" id="searchInput" onkeyup="filterTable()" class="form-control mb-3" placeholder="Search for users...">

        <table class="table table-bordered" id="userTable">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance_management", "root", "");
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
                        <form action="manageUsers.jsp" method="POST" style="display:inline;">
                            <input type="hidden" name="user_id" value="<%= userId %>">
                            <button type="submit" name="deleteUser" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></button>
                        </form>
                        <a href="updateUser.jsp?user_id=<%= userId %>&username=<%= username %>&email=<%= email %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i></a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        function filterTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toUpperCase();
            const table = document.getElementById("userTable");
            const tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                const td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    const textValue = td.textContent || td.innerText;
                    tr[i].style.display = textValue.toUpperCase().indexOf(filter) > -1 ? "" : "none";
                }
            }
        }
    </script>
</body>
</html>
