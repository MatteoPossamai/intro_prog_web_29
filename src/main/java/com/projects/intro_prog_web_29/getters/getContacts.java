package com.projects.intro_prog_web_29.getters;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
/*
 *  Getter per la pagina contact.jsp, per mantenere il paradigma
 *  MVC
 * */
@WebServlet(name = "getContacts", value = "/contatti")
public class getContacts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/contact.jsp");
        rd.forward(request,response);
    }

}
