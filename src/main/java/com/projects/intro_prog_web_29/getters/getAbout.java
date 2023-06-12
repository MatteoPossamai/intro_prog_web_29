package com.projects.intro_prog_web_29.getters;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "getAbout", value = "/chi-siamo")
public class getAbout extends HttpServlet {

    /*
    *  Getter per la pagina chi-siamo.jsp, per mantenere il paradigma
    *  MVC
    * */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/about.jsp");
        rd.forward(request,response);
    }

}
