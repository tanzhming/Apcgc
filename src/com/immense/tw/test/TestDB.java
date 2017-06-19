package com.immense.tw.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Properties;

public class TestDB {

/*	private static final String SQLSERVER_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String SQLSERVER_URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Apcgc";*/


    public static void main(String[] args) {
        try {
        	Properties properties=new Properties();
        	File file=new File("src/jdbc.properties");
        	properties.load(new FileInputStream(file));
        	String jdbc_driver = properties.getProperty("jdbc_driver");
        	String jdbc_url=properties.getProperty("jdbc_url");
        	String jdbc_username=properties.getProperty("jdbc_username");
        	String jdbc_password=properties.getProperty("jdbc_password");
        	
            /*Class.forName(SQLSERVER_DRIVER).newInstance();
            String url = SQLSERVER_URL;*/
        	Class.forName(jdbc_driver).newInstance();
            Connection con = DriverManager.getConnection(jdbc_url, jdbc_username, jdbc_password);
//        	Connection con = DriverManager.getConnection(url, "sa", "111111");
            Statement st = con.createStatement();
            String sql = " select * from test_tb";
            ResultSet rs = st.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(rs.getString(i) + "\t");
                }
                System.out.println();
            }
            rs.close();
            st.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

