package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {
    private static final String url = "jdbc:mysql://localhost:3306/alimama_database";
    private static final String user = "root";
    private static final String pass = "";

    public static Connection getConnection() throws SQLException,ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);

    }
}
