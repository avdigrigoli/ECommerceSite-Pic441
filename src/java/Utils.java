package com.picturehouse.picturehouse441;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Utils {

    private static final String jdbcURL = "jdbc:sqlserver://pic441.database.windows.net:1433;database=pic441;user=USERNAME;password=PASSWORD;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "root";

    public static Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(jdbcURL);
            System.out.println("Database is connected");
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("NO DATABASE CONNECTION");
        }
        return connection;
    }

}
