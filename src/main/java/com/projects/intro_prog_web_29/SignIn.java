package com.projects.intro_prog_web_29;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "signin", value = "/signin")
public class SignIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // Get all the data from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String data_nascita = request.getParameter("data_nascita");
        String telefono = request.getParameter("telefono");
        String password_check = request.getParameter("password_check");

        System.out.println("Username: " + username);
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Data di nascita: " + data_nascita);
        System.out.println("Telefono: " + telefono);
        System.out.println("Password check: " + password_check);

    }
}
