<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <style>
            .simpatizzante-popup-cancella {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
            }

            .simpatizzante-popup-profilo {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
            }

            .simpatizzante-popup-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <link href="stylesheets/simpatizzante.css" rel="stylesheet" type="text/css">
        <link href="stylesheets/global.css" rel="stylesheet" type="text/css">
        <title>Tum4World</title>
    </head>
    <body>
    <jsp:include page="menu-private.jsp"/>

    <main>

        <h1>Benvenuto/a Simpatizzante!</h1>
        <button class="simpatizzante-button" onclick="show('popup-profilo')">Visualizza i tuoi dati</button>

        <h2>Scegli a quali attività vuoi iscriverti!</h2>

        <form class="simpatizzante-form" method="post">
            <table class="simpatizzante-table">
                <tr>
                    <td>
                        <img src="https://www.geometrian.it/wp-content/uploads/2016/12/image-placeholder-500x500.jpg"
                             alt="immagine progetto 1" height="300px" width="300px" onclick="checkCheckbox('attivita1')" class="image">
                        <br>
                        <label class="simpatizzante-label" for="attivita1"></label><input type="checkbox" id="attivita1" name="Attività 1" value="Attività 1">
                    </td>

                    <td>
                        <img src="https://www.geometrian.it/wp-content/uploads/2016/12/image-placeholder-500x500.jpg"
                             alt="immagine progetto 2" height="300px" width="300px" onclick="checkCheckbox('attivita2')" class="image">
                        <br>
                        <label class="simpatizzante-label" for="attivita2"></label><input type="checkbox" id="attivita2" name="Attività 2" value="Attività 2">
                    </td>

                    <td>
                        <img src="https://www.geometrian.it/wp-content/uploads/2016/12/image-placeholder-500x500.jpg"
                             alt="immagine progetto 3" height="300px" width="300px" onclick="checkCheckbox('attivita3')" class="image">
                        <br>
                        <label class="simpatizzante-label" for="attivita3"></label><input type="checkbox" id="attivita3" name="Attività 3" value="Attività 3">
                    </td>
                </tr>
            </table>
            <button type="submit" value="Iscriviti" class="simpatizzante-button">Iscriviti</button>
        </form>
        <button class="simpatizzante-button" id="elimina-iscrizione" value="Cancella la mia iscrizione" onclick="show('popup-cancella')">Cancella la mia iscrizione</button>
    </main>
    <jsp:include page="phrase.jsp" />
    <jsp:include page="footer.jsp"/>
    <div id="popup-profilo" class="simpatizzante-popup-profilo">
        <div class="simpatizzante-popup-content">
            <span class="close" onclick="hide('popup-profilo')">&times;</span>
            <p>Informazioni del profilo</p>
        </div>
    </div>
    <div id="popup-cancella" class="simpatizzante-popup-cancella">
        <div class="simpatizzante-popup-content">
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
