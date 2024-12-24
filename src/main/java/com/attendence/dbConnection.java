package com.attendence;
import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnection {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/attendance_management";
    private static final String USER = "root"; // Your DB username
    private static final String PASS = ""; // Your DB password

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }
}
