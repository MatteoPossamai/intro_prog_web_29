package com.projects.intro_prog_web_29;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Properties;

/*
 *  Servlet per la simulazione dell'invio email
 * */

@WebServlet(name = "EmailHandler", value = "/EmailHandler")
public class EmailHandler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*
        * Le prossime linee prendono dal form nei contatti tutte le
        * informazioni necessarie
        * */

        String from = request.getParameter("from");
        String to = "tum4world@nessunonoluogonoesiste.com";
        String subject = request.getParameter("subject");
        String textMessage = request.getParameter("content");

        String smtpHost = "tum4SMTP";
        int port = 587;

        /*
        * Proprieta' che andrebbero utilizzate da Session per poi utilizzare
        * il protocollo SMTP
        * */

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "false"); //smtp non avra' bisogno di autenticazione
        properties.put("mail.smtp.ssl.enable", "true"); //smtp utilizzera' smtp
        properties.put("mail.smtp.user", "user");
        properties.put("mail.smtp.host", smtpHost); //setting dell'host e della port
        properties.put("mail.smtp.port", port);


        try {
            Session session = Session.getInstance(properties);
            Message message = new MimeMessage(session);

            InternetAddress fromAddress = new InternetAddress(from);
            InternetAddress toAddress = new InternetAddress(to);
            message.setFrom(fromAddress);
            message.setRecipient(MimeMessage.RecipientType.TO, toAddress);
            message.setSubject(subject);
            message.setText(textMessage);

            RequestDispatcher
                    rd=getServletContext().getRequestDispatcher("/invio-confermato.jsp");
            rd.forward(request,response);


        } catch (MessagingException e){
            RequestDispatcher
                    rd=getServletContext().getRequestDispatcher("/invio-confermato.jsp");
            rd.forward(request,response);

        }


        RequestDispatcher
                rd=getServletContext().getRequestDispatcher("/invio-confermato.jsp");
        rd.forward(request,response);

    }
}