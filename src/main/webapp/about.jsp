<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>

    <link href="stylesheets/chi-siamo.css" rel="stylesheet" type="text/css">
    <h1 id="title" class="title"></h1>
    <div class="content">
    <div class="text-image">
        <img src="./images/img1.jpg" class="image">
        <p class="text">
            Tum4world nasce dall'incontro di un gruppo di persone unite dalla volontà comune di fare la differenza nelle zone dell'Africa centromeridionale. Nel lontano anno 2003, un piccolo nucleo di individui con una grande voglia di auitare si riunì e decise di fondare un'organizzazione no profit con un obiettivo: maggior benessere nelle comunità più bisognose.
            <br><br>
            Negli anni successivi, Tum4world ha vissuto una crescita costante, ampliando la sua portata e aumentando il numero di progetti. Grazie alla dedizione e all'impegno dei nostri volontari, siamo riusciti a raggiungere e assistere un numero sempre maggiore di persone, migliorando le loro condizioni di vita e offrendo speranza per un futuro migliore.
        </p>
    </div>

        <div class="text-image">
            <p id="text-1" class="text">

            </p>
            <img src="./images/img2.jpg" class="image">
        </div>

        <div class="text-image">
            <img src="./images/img3.jpg" class="image">
            <p class="text">
                La trasparenza e l'accountability sono valori fondamentali per Tum4world. Siamo impegnati a gestire in modo responsabile e accurato le risorse che ci vengono affidate. Pubblichiamo regolarmente rapporti finanziari e rendiconti delle attività, al fine di mantenere la fiducia dei nostri sostenitori e di dimostrare l'impatto concreto che otteniamo grazie alla loro generosità.
                <br><br>
                Guardando al futuro, Tum4world continuerà a impegnarsi per costruire un mondo più giusto ed equo per tutti, mantenendo fede alla nostra missione e all'impegno nei confronti delle comunità africane.
            </p>
        </div>

        <div class="text-image">
            <p id="text-3" class="text">
            </p>
            <img src="./images/img4.jpg" class="image">
        </div>

    </div>



    <script>
        let filePath = './content.json'
        let request = new XMLHttpRequest();
        request.open('GET',filePath,true);

        request.onreadystatechange = function (){
            let titleElement = document.getElementById("title");
            let textElements = [];

            if (request.readyState === 4 && request.status === 200){
                let jsonData = JSON.parse(request.responseText).aboutUsContent;
                let title = jsonData.title;
                titleElement.innerHTML = title;

                let textData = jsonData.textContent;
                for (var i = 0; i<4; i++) {
                    textElements[i] = document.getElementById("text-" + i);
                    textElements[i].name;
                    textElements[i].innerHTML = textData[i];
                }

            }
        };
        request.send();

    </script>
</t:base>
