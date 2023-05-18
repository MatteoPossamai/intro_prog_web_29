package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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

        // Check if the username and password are correct
        boolean isCorrect = false;
        String userType = "";

        // Query the database to check if the username and password are correct

        for (String[] user : users) {
            if (user[0].equals(username) && user[1].equals(password)) {
                isCorrect = true;
                userType = user[2];
            }
        }

        if (isCorrect) {
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("userType", userType);
            response.sendRedirect(request.getContextPath() + AuthBasic.redirect_pages.get(userType));
        } else {
            // If the username and password are incorrect, redirect to the login page
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

}
