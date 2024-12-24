<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.attendence.dbConnection" %>
<%@ page import="com.attendence.emailUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Record Attendance</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #e9f2f9; /* Light blue background */
            font-family: Arial, sans-serif;
            display: flex;
            min-height: 100vh;
            margin: 0;
            flex-direction: column;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            background-color: #ffffff; /* White background for content */
        }
        h3 {
            margin-bottom: 20px;
            color: #004085; /* Dark blue text for headings */
            font-size: 1.5rem; /* Adjusted font size */
        }
        label {
            font-weight: bold;
            color: #003366; /* Slightly darker blue for labels */
        }
        .attendance-status {
            margin-bottom: 10px;
        }
        button {
            margin-top: 15px;
            background-color: #007bff; /* Bootstrap primary button color */
            border: none;
        }
        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        .alert {
            margin-top: 20px;
        }
        .sidebar {
            background-color: #004085; /* Dark blue sidebar */
            padding: 20px;
            min-width: 200px;
            height: 100%;
            position: fixed;
        }
        .sidebar a {
            color: #ffffff; /* White text for sidebar links */
            text-decoration: none;
            display: block;
            margin: 10px 0;
        }
        .sidebar a:hover {
            background-color: #0056b3; /* Lighter blue on hover */
            padding-left: 10px;
            transition: all 0.3s;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
            flex: 1;
        }
        .footer {
            background-color: #004085; /* Dark blue footer */
            color: #ffffff;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001a;
            margin-bottom: 20px;
        }
        .card .card-body {
            display: flex;
            align-items: center;
        }
        .card i {
            font-size: 2rem;
            margin-right: 15px;
            color: #003366; /* Dark blue for icons */
        }
        .chart-container {
            width: 100%;
            margin-top: 20px;
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
        <a href="generateReport.jsp"><i class="fas fa-cogs"></i> Generate Report</a>
    </div>

    <div class="container">
        <h3><i class="fas fa-user-check"></i> Record Attendance</h3>
        <form action="recordAttendance.jsp" method="POST">
            <input type="hidden" name="action" value="recordAttendance">
            <div class="form-group">
                <label for="attendance_date"><i class="fas fa-calendar-alt"></i> Date:</label>
                <input type="date" name="attendance_date" id="attendance_date" class="form-control" required>
            </div>
            <hr>
            <h4><i class="fas fa-list-alt"></i> Mark Attendance</h4>
            <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                conn = com.attendence.dbConnection.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM users";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int userId = rs.getInt("user_id");
                    String username = rs.getString("username");
            %>
                    <div class="attendance-status">
                        <label><%= username %>:</label>
                        <select name="status_<%= userId %>" class="form-control form-control-sm">
                            <option value="Present">Present</option>
                            <option value="Absent">Absent</option>
                            <option value="Late">Late</option>
                        </select>
                    </div>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            %>
                <div class="alert alert-danger">Error loading users.</div>
            <%
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
            %>
            <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-paper-plane"></i> Submit Attendance</button>
        </form>

        <%
        if ("recordAttendance".equals(request.getParameter("action"))) {
            String attendanceDate = request.getParameter("attendance_date");
            try {
                conn = com.attendence.dbConnection.getConnection();
                String sql = "INSERT INTO attendance (user_id, attendance_date, status) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE status = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                for (String paramName : request.getParameterMap().keySet()) {
                    if (paramName.startsWith("status_")) {
                        int userId = Integer.parseInt(paramName.substring(7));
                        String status = request.getParameter(paramName);

                        pstmt.setInt(1, userId);
                        pstmt.setString(2, attendanceDate);
                        pstmt.setString(3, status);
                        pstmt.setString(4, status);
                        pstmt.addBatch();

                        String userEmail = ""; 
                        if ("Absent".equals(status)) {
                            com.attendence.emailUtils.sendEmail(userEmail, "Attendance Notification", "You were marked absent today. Please provide a reason.");
                        }
                    }
                }

                pstmt.executeBatch();
                out.print("<div class='alert alert-success'>Attendance recorded successfully.</div>");
            } catch (Exception e) {
                e.printStackTrace();
                out.print("<div class='alert alert-danger'>Error recording attendance.</div>");
            } finally {
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        }
        %>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
