package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "signin", value = "/signin")
public class Signin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // Get all the data from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String data_nascita = request.getParameter("data_nascita");
        String telefono = request.getParameter("telefono");
        String password_check = request.getParameter("password_check");

        Connection con = null;
        try{
            con = DriverManager.getConnection("jdbc:derby://127.0.0.1:1527/rubbish");
            String query = "SELECT * FROM users WHERE username = '" + username + "'";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);
            boolean username_exists = res.next();

            if (username_exists) {
                request.setAttribute("error", "Username already exists");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }  else {
                query = "INSERT INTO users VALUES ('" + username + "', '" + email + "', '" + password + "', '" + data_nascita + "', '" + telefono + "', 'SI ')";
                stmt.executeUpdate(query);
                request.getRequestDispatcher("/registrazione_confermata.jsp").forward(request, response);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
