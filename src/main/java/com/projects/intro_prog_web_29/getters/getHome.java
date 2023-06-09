package com.projects.intro_prog_web_29.getters;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
/*
 *  Getter per la pagina index.jsp, per mantenere il paradigma
 *  MVC
 * */
@WebServlet(name = "getHome", value = "/home")
public class getHome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request,response);
    }

}
