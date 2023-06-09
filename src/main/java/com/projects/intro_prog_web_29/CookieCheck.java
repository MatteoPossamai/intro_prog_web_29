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
        System.out.println("Entro in manage Cookie");
        if (checkCookie(cookie, request)){
            System.out.println("Entro nell'if di manage cookie");
            init();
            boolean session = false;
            int i = 1;
            for (Cookie cookieFor : cookie) {
                String query = "SELECT * FROM users WHERE username = '" + cookieFor.getValue() + "'";
                System.out.println("Provo la query " + query);
                Statement stmt = con.createStatement();
                ResultSet res = stmt.executeQuery(query);
                if (res.next()) {
                    String username = cookieFor.getValue();
                    String password = res.getString("password");
                    String userType = res.getString("userType");
                    System.out.println("Mi trovo in CookieCheck e il username è " + username);
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
        System.out.println("Controllo se è presente il cookie 'cookie'");
        boolean returnValue = false;
        for (Cookie cookieFor : cookie) {
            System.out.println("Controllo il cookie " + cookieFor.getName());
            if (cookieFor.getName().equals("cookie")) {
                if (cookieFor.getValue().equals("true")) {
                    System.out.println("Il valore è true");
                    returnValue = true;
                    request.getServletContext().setAttribute("cookie", true);
                } else {
                    System.out.println("Il valore è false");
                    request.getServletContext().setAttribute("cookie", false);
                }
                break;
            }
        }
        System.out.println("Ora ritorno il valore " + returnValue);
        return returnValue;
    }
}
