<%@ page import="java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*, java.io.*, com.attendence.emailUtils" %>
<%@ page import="com.attendence.dbConnection" %>
<%@ page contentType="application/pdf" %>
<%
    String reportDate = request.getParameter("report_date");
    if (reportDate != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = com.attendence.dbConnection.getConnection();
            String sql = "SELECT users.username, attendance.status, users.email FROM attendance " +
                         "JOIN users ON attendance.user_id = users.user_id " +
                         "WHERE attendance.attendance_date = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reportDate);
            rs = pstmt.executeQuery();

            // Setting up PDF document
            Document document = new Document();
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=attendance_report_" + reportDate + ".pdf");
            // Use ServletOutputStream instead of JspWriter
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Adding content to PDF
            document.add(new Paragraph("Attendance Report for " + reportDate));
            document.add(Chunk.NEWLINE);

            PdfPTable table = new PdfPTable(3); // 3 columns
            table.addCell("Username");
            table.addCell("Status");
            table.addCell("Email");

            while (rs.next()) {
                String username = rs.getString("username");
                String status = rs.getString("status");
                String email = rs.getString("email");
                table.addCell(username);
                table.addCell(status);
                table.addCell(email);

                // Check for absence and send notification
                if ("Absent".equalsIgnoreCase(status)) {
                    String subject = "Attendance Notification";
                    String body = "Dear " + username + ",\n\nWe noticed you were absent on " + reportDate +
                                  ". Please let us know the reason for your absence.\n\nBest Regards,\nAttendance Team";
                    emailUtils.sendEmail(email, subject, body);
                }
            }
            document.add(table);
            document.close();
            // No need to flush out as the response is handled automatically
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
