package com.projects.intro_prog_web_29;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "auth", urlPatterns = {"/amministratore.jsp", "/aderente.jsp", "/simpatizzante.jsp"})
public class AuthFilter implements Filter {
    protected FilterConfig config;

    public void init(FilterConfig config) throws ServletException {this.config = config;}

    public void destroy() {this.config = null;}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hreq=(HttpServletRequest) request;
        HttpSession session = hreq.getSession(false);

        // Get from the URL the jsp page we are in
        String page = hreq.getRequestURI().substring(hreq.getContextPath().length());


        if(session == null || session.getAttribute("username") == null){
            request.setAttribute("error", "Non sei loggato, effettua il login per accedere a questa pagina");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }else{
            String role = (String) session.getAttribute("userType");
            String page_url = AuthBasic.redirect_pages.get(role);
            if(!page.equals(page_url)){
                request.setAttribute("error", "Non hai i permessi per accedere a questa pagina");
                request.getRequestDispatcher(page_url).forward(request,response);
                return;
            }
        }

        chain.doFilter(request,response);
    }
}
