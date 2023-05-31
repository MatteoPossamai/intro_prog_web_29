<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>


    <script>
        fetch("visits", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'body='+ encodeURIComponent("about")
        })
    </script>

    <link href="stylesheets/chi-siamo.css" rel="stylesheet" type="text/css">

    <h1 class="title">Chi siamo</h1>
    <div class="content">
    <div class="text-image">
        <img src="./images/placeholder.jpeg" class="image">
        <p class="text">
            Tum4world nasce dall'incontro di un gruppo di persone unite dalla volontà comune di fare la differenza nelle zone dell'Africa centromeridionale. Nel lontano anno 2003, un piccolo nucleo di individui con una grande voglia di auitare si riunì e decise di fondare un'organizzazione no profit con un obiettivo: maggior benessere nelle comunità più bisognose.
            <br><br>
            Negli anni successivi, Tum4world ha vissuto una crescita costante, ampliando la sua portata e aumentando il numero di progetti. Grazie alla dedizione e all'impegno dei nostri volontari, siamo riusciti a raggiungere e assistere un numero sempre maggiore di persone, migliorando le loro condizioni di vita e offrendo speranza per un futuro migliore.
        </p>
    </div>

        <div class="text-image">
            <p class="text">
                Abbiamo affrontato situazioni di emergenza umanitaria, fornendo assistenza immediata a vittime di conflitti armati, carestie e disastri naturali. Abbiamo anche sviluppato progetti a lungo termine, concentrandoci sull'accesso all'istruzione, alla salute, all'acqua potabile e al sostegno economico per le comunità locali.
                <br><br>
                Ogni successo che abbiamo raggiunto è stato possibile grazie al sostegno generoso di donatori, partner internazionali e volontari che credono nella nostra causa. La loro fiducia e il loro impegno ci spingono a continuare a lavorare duramente per cambiare la realtà di molte persone.

            </p>
            <img src="./images/placeholder.jpeg" class="image">
        </div>

        <div class="text-image">
            <img src="./images/placeholder.jpeg" class="image">
            <p class="text">
                La trasparenza e l'accountability sono valori fondamentali per Tum4world. Siamo impegnati a gestire in modo responsabile e accurato le risorse che ci vengono affidate. Pubblichiamo regolarmente rapporti finanziari e rendiconti delle attività, al fine di mantenere la fiducia dei nostri sostenitori e di dimostrare l'impatto concreto che otteniamo grazie alla loro generosità.
                <br><br>
                Guardando al futuro, Tum4world continuerà a impegnarsi per costruire un mondo più giusto ed equo per tutti, mantenendo fede alla nostra missione e all'impegno nei confronti delle comunità africane.
            </p>
        </div>

        <div class="text-image">
            <p class="text">
                Guardando avanti, Tum4world si impegna a continuare a crescere e ad adattarsi alle sfide che emergono nelle comunità africane. Siamo consapevoli che il nostro lavoro è una goccia nell'oceano, ma crediamo che ogni singolo aiuto possa fare la differenza nella vita di una persona. Con determinazione, passione e il sostegno di persone come te, continueremo a costruire un futuro migliore per le popolazioni dell'Africa centromeridionale, offrendo speranza, dignità e opportunità di crescita a chi ne ha bisogno.
                <br><br>
                Grazie per il tuo sostegno.
            </p>
            <img src="./images/placeholder.jpeg" class="image">
        </div>

    </div>


</t:base>
