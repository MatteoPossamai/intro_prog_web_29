package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fake database for testing purpose
        String[][] users = {
                {"admin", "admin", "AM"},
                {"simp", "simp", "SI"},
                {"ader", "ader", "AD"}
        };

        // Get the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        try{
            con = DriverManager.getConnection("jdbc:derby://127.0.0.1:1527/rubbish");
            String query = "SELECT * FROM users WHERE username = '" + username + "'";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);

            // Get the user result of the query
            // If the user doesn't exist, res.next() will return false
            String db_password = res.getString("password");
            boolean password_correct = password.equals(db_password);
            String userType = res.getString("userType");

            if (res.next() && password_correct) {
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("userType", userType);
                response.sendRedirect(request.getContextPath() + AuthBasic.redirect_pages.get(userType));
            } else {
                // If the username and password are incorrect, redirect to the login page
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
