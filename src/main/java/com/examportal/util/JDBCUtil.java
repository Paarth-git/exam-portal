package com.examportal.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {

    private static final String URL =
            "jdbc:mysql://localhost:3306/examportal?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    private static final String USER = "root";  
    private static final String PASS = "sspptmkk";  

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("DB CONNECTED: " + conn);
            return conn;
        } catch (Exception e) {
            System.out.println("DB CONNECTION ERROR → " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

}
