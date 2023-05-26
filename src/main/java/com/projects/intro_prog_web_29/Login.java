package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {

    String dbURL = "jdbc:derby://localhost:1527/Mydb";
    String user = "App";
    String password = "pw";
    Connection con;

    public void init() {
        // Initialize the database connection for the entire servlet
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection(dbURL, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
        try {
            con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con;
        try{
            // Query the database to get the user
            String query = "SELECT * FROM users WHERE username = '" + username + "'";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(query);

            // Check if the user exists and if the password is correct
            boolean password_correct = false;
            String userType = "";
            if(res.next()){
                String password_db = res.getString("password");
                password_correct = password.equals(password_db);
                userType = res.getString("userType");
            }

            if (password_correct) {
                // If the user exists and the password provided is correct, then log the user in
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("userType", userType);
                response.sendRedirect(request.getContextPath() + AuthBasic.redirect_pages.get(userType));
            } else {
                // If the username and password are incorrect, redirect to the login page
                // with an error message, to let the user know that the username or password is incorrect
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

}
