<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.attendence.dbConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Report</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome -->
    <style>
        body {
            background-color: #eef2f3; /* Light gray */
            font-family: Arial, sans-serif;
            display: flex;
            min-height: 100vh;
            margin: 0;
            flex-direction: column;
        }
        .sidebar {
            background-color: #002147; /* Navy blue */
            padding: 20px;
            min-width: 220px;
            height: 100%;
            position: fixed;
        }
        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            display: block;
            margin: 10px 0;
        }
        .sidebar a:hover {
            background-color: #004080; /* Darker blue */
            padding-left: 10px;
            transition: all 0.3s;
        }
        .container {
            margin-left: 240px; /* Space for sidebar */
            margin-top: 50px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff; /* White */
        }
        h3 {
            margin-bottom: 20px;
            color: #002147; /* Navy blue */
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            text-align: center;
        }
        th {
            background-color: #002147; /* Navy blue */
            color: #ffffff; /* White */
        }
        .footer {
            background-color: #002147; /* Navy blue */
            color: #ffffff; /* White */
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
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

<div class="container">
    <h3><i class="fas fa-file-alt"></i> Generate Attendance Report</h3>
    <form action="generateReport.jsp" method="GET" class="form-inline mb-3">
        <label for="report_date" class="mr-2">Select Date:</label>
        <input type="date" name="report_date" id="report_date" class="form-control mr-2" required>
        <button type="submit" class="btn btn-primary">Generate Report</button>
    </form>

    <%
    String reportDate = request.getParameter("report_date");
    if (reportDate != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = com.attendence.dbConnection.getConnection();
            String sql = "SELECT users.username, attendance.status FROM attendance " +
                         "JOIN users ON attendance.user_id = users.user_id " +
                         "WHERE attendance.attendance_date = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reportDate);
            rs = pstmt.executeQuery();

            out.print("<table class='table table-striped table-bordered'><thead><tr><th>Username</th><th>Status</th></tr></thead><tbody>");
            while (rs.next()) {
                String username = rs.getString("username");
                String status = rs.getString("status");
                out.print("<tr><td>" + username + "</td><td>" + status + "</td></tr>");
            }
            out.print("</tbody></table>");

            // Button for downloading PDF
            out.print("<form action='downloadReport.jsp' method='POST'>");
            out.print("<input type='hidden' name='report_date' value='" + reportDate + "' />");
            out.print("<button type='submit' class='btn btn-success'><i class='fas fa-file-download'></i> Download PDF</button>");
            out.print("</form>");

        } catch (Exception e) {
            e.printStackTrace();
            out.print("<div class='alert alert-danger'>Error generating report.</div>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
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
