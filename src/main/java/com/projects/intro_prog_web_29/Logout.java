package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "logout", value = "/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the current user session, if it exists and invalidate it
        if(request.getSession(false) != null){
            request.getSession(false).invalidate();
        }
        request.getRequestDispatcher("/home").forward(request, response);
    }

}