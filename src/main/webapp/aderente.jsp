<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <link href="stylesheets/aderente.css" rel="stylesheet" type="text/css">
    <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
    <title>Tum4World</title>
</head>
<body>
<script>
    fetch("visits", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'body='+ encodeURIComponent("aderente")
    })
</script>
<jsp:include page="menu-private.jsp"/>

<main class="content">
<div>
    <h1 class="title">Benvenuto/a Aderente!</h1>
    <div style="display: flex; gap: 100px">
    <button class="button" onclick="show('popup-profilo')">Visualizza i tuoi dati</button>
    <button class="button" id="elimina-iscrizione" value="Cancella la mia iscrizione" onclick="show('popup-cancella')">Cancella la mia iscrizione</button>
    </div>
    </div>
    <div>
    <h2>Scegli a quali attività vuoi iscriverti!</h2>

    <form class="aderente-form" method="post">
        <table class="aderente-table">
            <tr>
                <td>
                    <img src="https://www.geometrian.it/wp-content/uploads/2016/12/image-placeholder-500x500.jpg"
                         alt="immagine progetto 1" height="300px" width="300px" onclick="checkCheckbox('attivita1')" class="image">
                    <br>
                    <label class="aderente-label" for="attivita1"></label><input type="checkbox" id="attivita1" name="Attività 1" value="Attività 1">
                </td>

                <td>
                    <img src="https://www.geometrian.it/wp-content/uploads/2016/12/image-placeholder-500x500.jpg"
                         alt="immagine progetto 2" height="300px" width="300px" onclick="checkCheckbox('attivita2')" class="image">
                    <br>
                    <label class="aderente-label" for="attivita2"></label><input type="checkbox" id="attivita2" name="Attività 2" value="Attività 2">
                </td>

                <td>
                    <img src="https://www.geometrian.it/wp-content/uploads/2016/12/image-placeholder-500x500.jpg"
                         alt="immagine progetto 3" height="300px" width="300px" onclick="checkCheckbox('attivita3')" class="image">
                    <br>
                    <label class="aderente-label" for="attivita3"></label><input type="checkbox" id="attivita3" name="Attività 3" value="Attività 3">
                </td>
            </tr>
        </table>
        <button type="submit" value="Iscriviti" class="button">Iscriviti</button>
        <%
            String[] selected = request.getParameterValues("option");
            if (selected != null) {
                out.println("Ti sei iscritto alle seguenti attività:");
                for (String option : selected) {
                    out.println("<li>" + option + "</li>");
                }
            } else {
                out.println("<p>No options selected.</p>");
            }
        %>
    </form>
    </div>
    <form class="aderente-form">
        <label>Effettua una donazione (euro)</label>
        <input type="number" value="0">
        <input type="submit" value="Dona">
    </form>
</main>
<jsp:include page="phrase.jsp" />
<jsp:include page="footer.jsp"/>
<div id="popup-profilo" class="aderente-popup-profilo">
    <div class="aderente-popup-content">
        <span class="close" onclick="hide('popup-profilo')">&times;</span>
        <p>Informazioni del profilo</p>
    </div>
</div>
<div id="popup-cancella" class="aderente-popup-cancella">
    <div class="aderente-popup-content">
        <span class="close" onclick="hide('popup-cancella')">&times;</span>
        <p>La cancellazione dal sito è andata a buon fine</p>
    </div>
</div>
<script>
    function checkCheckbox(checkboxId) {
        document.getElementById(checkboxId).checked = document.getElementById(checkboxId).checked === false;
    }
    function show(element) {
        document.getElementById(element).style.display = "block";

    }
    function hide(element) {
        document.getElementById(element).style.display = "none";
    }
</script>
</body>
</html>
