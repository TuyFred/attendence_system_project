<%@ page import="java.sql.*" %>
<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String attendanceDate = request.getParameter("attendance_date");
    String status = request.getParameter("status");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance_management", "root", "");

        String sql = "INSERT INTO attendance (user_id, attendance_date, status) VALUES (?, ?, ?) " +
                     "ON DUPLICATE KEY UPDATE status = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ps.setDate(2, Date.valueOf(attendanceDate));
        ps.setString(3, status);
        ps.setString(4, status);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Attendance updated successfully for user ID: " + userId);
        } else {
            out.println("Failed to update attendance.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) try { ps.close(); } catch (Exception e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>
