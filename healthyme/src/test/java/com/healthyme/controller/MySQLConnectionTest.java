package com.healthyme.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = 
    		"jdbc:mysql://127.0.0.1:3308/healthyme?serverTimezone=Asia/Seoul&useSSL=false";
    private static final String USER = "root";
    private static final String PW = "hkit1234";
    
    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);
        
        try(Connection conn = DriverManager.getConnection(URL, USER, PW)) {
        	System.out.println("Okay");
        	System.out.println(conn);
        	
        } catch(Exception e) {
        	System.out.println("Error");
            e.printStackTrace();
        }
    }

	
	

}
