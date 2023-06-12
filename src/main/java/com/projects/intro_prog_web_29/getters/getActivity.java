package com.projects.intro_prog_web_29.getters;

import com.projects.intro_prog_web_29.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/*
 *  Getter per la pagina activity.jsp, per mantenere il paradigma
 *  MVC
 * */
@WebServlet(name = "getActivity", value = "/getActivity")
public class getActivity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activityID = request.getParameter("activityID");
        //System.out.println(activityID);
        Activity activity = new Activity();
        String previewMensa = "Offriamo un servizio di Mensa e ci impegnamo a garantire pasti sani e nutrienti a coloro che si trovano in difficoltà economica";
        String descriptionMensa = "Benvenuti al nostro servizio di Mensa, fornito dalla nostra azienda non profit. Siamo impegnati nel fornire pasti sani e nutrienti a coloro che si trovano in situazioni di difficoltà economica, garantendo che nessuno venga lasciato indietro quando si tratta di avere accesso a cibo di qualità.\n" +
                "\n" +
                "La nostra Mensa è stata creata con l'obiettivo di affrontare il problema della fame e della malnutrizione nelle comunità più bisognose. Sappiamo che molte persone lottano ogni giorno per mettere cibo sulla loro tavola, e vogliamo essere una risorsa affidabile per aiutare a colmare questa lacuna.\n" +
                "\n" +
                "Cosa offriamo? Ogni giorno, prepariamo pasti sani, bilanciati e gustosi che sono adatti alle esigenze nutrizionali delle persone che serviamo. I nostri chef esperti lavorano con ingredienti freschi e di alta qualità per creare piatti che non solo soddisfano l'appetito, ma forniscono anche i nutrienti essenziali per una dieta equilibrata.";

        String previewEdilizia = "Offriamo un servizio di edilizia comunitaria,  dedicato alla costruzione di edifici utili come scuole e abitazioni. Il nostro team di esperti lavora in collaborazione con le comunità per sviluppare progetti su misura che soddisfino le loro esigenze specifiche.";
        String descriptionEdilizia = "Benvenuti al nostro servizio di edilizia comunitaria, offerto dalla nostra organizzazione non profit. Siamo dedicati a lavorare con le comunità per costruire edifici utili come scuole e abitazioni, al fine di migliorare la qualità della vita delle persone.\n" +
                "\n" +
                "Sappiamo che una comunità prospera ha bisogno di infrastrutture solide e accessibili. Perciò, collaboriamo strettamente con le comunità per comprendere le loro esigenze specifiche e sviluppare progetti su misura che rispondano alle loro necessità.\n" +
                "\n" +
                "La nostra organizzazione è composta da un team di esperti edilizi, architetti e ingegneri dedicati, che lavorano con passione per realizzare progetti di costruzione di alta qualità. Ci assicuriamo che ogni edificio sia costruito secondo gli standard più elevati e che sia sicuro, funzionale ed efficiente dal punto di vista energetico.";

        String previewCorsi = "Offriamo un servizio non profit di corsi rivolto alle comunità africane, con l'obiettivo di fornire opportunità educative e di formazione. I nostri corsi sono adattati alle specifiche esigenze delle comunità e coprono diverse aree tematiche. ";
        String descriptionCorsi = "Benvenuti al nostro servizio non profit di corsi dedicato alle comunità africane. Siamo impegnati a fornire opportunità educative e di formazione per aiutare le persone a sviluppare le proprie competenze, ampliare le loro prospettive e promuovere lo sviluppo sostenibile delle comunità.\n" +
                "\n" +
                "Riconosciamo l'importanza dell'istruzione e della formazione come strumenti fondamentali per l'empowerment individuale e collettivo. Perciò, offriamo una vasta gamma di corsi che coprono diverse aree tematiche, come alfabetizzazione, competenze professionali, imprenditorialità, salute e benessere, e altro ancora.\n" +
                "\n" +
                "I nostri corsi sono progettati per essere accessibili e adattati alle specifiche esigenze delle comunità africane. Siamo consapevoli delle barriere culturali, linguistiche ed economiche che possono limitare l'accesso all'istruzione, e ci sforziamo di superarle fornendo corsi in lingue locali, utilizzando metodi di insegnamento interattivi e offrendo borse di studio o agevolazioni economiche a coloro che ne hanno bisogno.\n" +
                "\n" +
                "Ci preoccupiamo anche di garantire che i nostri corsi siano pertinenti e utili per le comunità. Perciò, lavoriamo in stretta collaborazione con esperti locali, leader comunitari e organizzazioni partner per identificare le esigenze specifiche e sviluppare programmi formativi che rispondano alle sfide e alle opportunità del contesto africano.";

        if(activityID.equals("1")){
                    createActivity(activity,"Mensa", previewMensa, descriptionMensa, "images/act-1.jpg");
        } else if(activityID.equals("2") ){
            createActivity(activity,"Edilizia", previewEdilizia, descriptionEdilizia, "images/act-2.jpeg");
        } else if (activityID.equals("3")){
            createActivity(activity,"Corsi di formazione", previewCorsi, descriptionCorsi, "images/act-3.jpeg");
        }


        request.setAttribute("activity",activity);


        request.getRequestDispatcher("/activity.jsp").forward(request,response);


    }

    public void createActivity(Activity activity, String title, String preview, String description, String imageSource){
        activity.setTitle(title);
        activity.setPreview(preview);
        activity.setDescription(description);
        activity.setImageSource(imageSource);
    }

}
