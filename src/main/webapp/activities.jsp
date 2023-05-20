<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <link href="stylesheets/activities.css" rel="stylesheet" type="text/css">

    <h1 class="title">Attivita'</h1>
    <div class="content">
    <main>
        <p class="description"> La nostra associazione da molti anni porta avanti vari progetti di utilita' varia ecc ecc </p>
        <div class="activities-container">
        <section class="activity" id="1">
            <a href="activity.jsp">
                <img src="./images/placeholder.jpeg" alt="immagine progetto 1" height="150px" width="150px">
            </a>
            <h2>Progetto 1</h2>
            <p class="text">Descrizione progetto 1Descrizione progetto 1Descrizione progetto 1Descrizione progetto 1</p>
        </section>

            <section class="activity" id="2">
                <a href="activity.jsp">
                    <img src="./images/placeholder.jpeg" alt="immagine progetto 2" height="150px" width="150px">
                </a>
                <h2>Progetto 2</h2>
                <p class="text">Descrizione progetto 2Descrizione progetto 1Descrizione progetto 1Descrizione progetto 1</p>
            </section>

            <section class="activity" id="3">
                <a href="activity.jsp">
                    <img src="./images/placeholder.jpeg" alt="immagine progetto 3" height="150px" width="150px">
                </a>
                <h2>Progetto 3</h2>
                <p class="text">Descrizione progetto 3Descrizione progetto 1Descrizione progetto 1Descrizione progetto 1</p>
            </section>
        </div>
    </main>
    </div>
</t:base>
