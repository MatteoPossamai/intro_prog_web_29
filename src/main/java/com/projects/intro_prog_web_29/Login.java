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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con;
        try{
            // Connect to the database to check if the user exists
            System.out.println(System.getProperty("java.class.path"));
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/rubbish");

            // Query the database to get the user
            String query = "SELECT * FROM users WHERE username = '" + username + "'";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);

            // Get the user result of the query
            // If the user doesn't exist, res.next() will return false
            String db_password = res.getString("password");
            boolean password_correct = password.equals(db_password);
            String userType = res.getString("userType");

            if (res.next() && password_correct) {
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
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
    }

}
