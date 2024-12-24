<%@ page import="java.io.*, java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%
    // Set the content type to PDF
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=\"users_report.pdf\"");

    // Create a Document instance
    Document document = new Document();
    try {
        // Create PdfWriter instance
        PdfWriter.getInstance(document, response.getOutputStream());

        // Open the document
        document.open();

        // Add document title
        document.add(new Paragraph("Users Report"));
        document.add(new Paragraph("Generated on: " + new java.util.Date()));
        document.add(new Paragraph(" "));

        // Create a table with the number of columns matching your data
        PdfPTable table = new PdfPTable(4); // Adjust to match the number of columns you want

        // Add table headers
        table.addCell("ID");
        table.addCell("Username");
        table.addCell("Email");
        table.addCell("Role");

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/attendance_management";
        String dbUsername = "root";
        String dbPassword = "";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, dbUsername, dbPassword);
            statement = connection.createStatement();
            String query = "SELECT * FROM users"; // Modify according to your table structure
            resultSet = statement.executeQuery(query);

            // Iterate through the result set and add data to the table
            while (resultSet.next()) {
                table.addCell(String.valueOf(resultSet.getInt("user_id"))); // Adjust column name if necessary
                table.addCell(resultSet.getString("username"));
                table.addCell(resultSet.getString("email"));
                table.addCell(resultSet.getString("role"));
            }

            // Add table to the document
            document.add(table);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the document
        document.close();
    }
%>
