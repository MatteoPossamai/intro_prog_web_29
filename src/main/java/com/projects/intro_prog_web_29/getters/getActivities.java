package com.projects.intro_prog_web_29.getters;

import com.projects.intro_prog_web_29.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "getActivities", value = "/activities")
public class getActivities extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] titles = new String[]{"Mensa", "Edilizia", "Corsi di formazione"};

        String previewMensa =  "Offriamo un servizio di Mensa e ci impegnamo a garantire pasti sani e nutrienti a coloro che si trovano in difficoltà economica";;

        String previewEdilizia = "Offriamo un servizio di edilizia comunitaria,  dedicato alla costruzione di edifici utili come scuole e abitazioni. Il nostro team di esperti lavora in collaborazione con le comunità per sviluppare progetti su misura che soddisfino le loro esigenze specifiche.";
        String descriptionEdilizia = "Benvenuti al nostro servizio di edilizia comunitaria, offerto dalla nostra organizzazione non profit. Siamo dedicati a lavorare con le comunità per costruire edifici utili come scuole e abitazioni, al fine di migliorare la qualità della vita delle persone.\n" +
                "\n" +
                "Sappiamo che una comunità prospera ha bisogno di infrastrutture solide e accessibili. Perciò, collaboriamo strettamente con le comunità per comprendere le loro esigenze specifiche e sviluppare progetti su misura che rispondano alle loro necessità.\n" +
                "\n" +
                "La nostra organizzazione è composta da un team di esperti edilizi, architetti e ingegneri dedicati, che lavorano con passione per realizzare progetti di costruzione di alta qualità. Ci assicuriamo che ogni edificio sia costruito secondo gli standard più elevati e che sia sicuro, funzionale ed efficiente dal punto di vista energetico.\n" +
                "\n" +
                "La costruzione di scuole è una delle nostre priorità, poiché riconosciamo l'importanza dell'istruzione per il futuro di una comunità. Siamo determinati a fornire spazi educativi adeguati e sicuri, dove gli studenti possano imparare e crescere in un ambiente favorevole.\n" +
                "\n" +
                "Oltre alle scuole, ci impegniamo anche nella costruzione di abitazioni per le persone che ne hanno bisogno. Sappiamo che una casa stabile e sicura è fondamentale per la stabilità e il benessere delle famiglie. Lavoriamo per fornire abitazioni accessibili e di qualità, che creino un ambiente accogliente e promuovano il senso di appartenenza alla comunità.";
        String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laborLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laborLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laborLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor";
        String imageSource = "src/main/webapp/images/placeholder.jpeg";

        Activity a1 = new Activity();
        Activity a2 = new Activity();
        Activity a3 = new Activity();

        this.createActivity(a1,titles[0],previewMensa,description, imageSource);
        this.createActivity(a2,titles[1],previewEdilizia,description, imageSource);
        this.createActivity(a3,titles[2],previewMensa,description, imageSource);
        request.setAttribute("activity1",a1);
        request.setAttribute("activity2",a2);
        request.setAttribute("activity3",a3);
        RequestDispatcher
                rd=getServletContext().getRequestDispatcher("/activities.jsp");
        rd.forward(request,response);

    }

    public void createActivity(Activity activity, String title, String preview, String description, String imageSource){
        activity.setTitle(title);
        activity.setPreview(preview);
        activity.setDescription(description);
        activity.setImageSource(imageSource);
    }
}
