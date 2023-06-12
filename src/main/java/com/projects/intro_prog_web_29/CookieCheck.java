package com.projects.intro_prog_web_29;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;

public class CookieCheck {
    static String dbURL = "jdbc:derby://localhost:1527/Mydb";
    static String user = "App";
    static String password = "pw";
    static Connection con;


    public static void init() {
        // Initialize the database connection for the entire servlet
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static void destroy() {
        try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void manageCookie(Cookie[] cookie, HttpServletRequest request) throws SQLException {
        if (checkCookie(cookie, request)){
            init();
            boolean session = false;
            int i = 1;
            for (Cookie cookieFor : cookie) {
                String query = "SELECT * FROM users WHERE username = '" + cookieFor.getValue() + "'";
                Statement stmt = con.createStatement();
                ResultSet res = stmt.executeQuery(query);
                if (res.next()) {
                    String username = cookieFor.getValue();
                    String password = res.getString("password");
                    String userType = res.getString("userType");
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("password", password);
                    request.getSession().setAttribute("userType", userType);
                    break;
                }
                if(i++ == cookie.length){
                    session = true;
                }
            }
            destroy();
            request.setAttribute("invalidate", session);
        }
    }

    public static boolean checkCookie(Cookie[] cookie, HttpServletRequest request) {
        boolean returnValue = false;
        if(cookie == null)
        {
            request.getSession().invalidate();
        }
        for (Cookie cookieFor : cookie) {
            if (cookieFor.getName().equals("cookie")) {
                if (cookieFor.getValue().equals("true")) {
                    returnValue = true;
                }
                break;
            }
        }
        return returnValue;
    }
}
