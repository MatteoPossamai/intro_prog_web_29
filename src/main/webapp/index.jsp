<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<div class="content">
<br class="title">
<div class="text-image">
    <img src="./images/placeholder.jpeg" class="image" alt="template_image">
    <div style="margin-top: 90px">
        <h1>La nostra missione</h1>
        <p class="text">
            Benvenuti nel sito di Tum4world, un'associazione no profit impegnata nel fornire aiuto umanitario e beneficienza nelle zone dell'Africa centromeridionale. Siamo mossi da una profonda passione per fare la differenza e lavoriamo instancabilmente per migliorare le vite delle persone che vivono in comunità svantaggiate.
            <br><br>
            La nostra missione è semplice ma potente: combattere la povertà estrema, alleviare la sofferenza e promuovere lo sviluppo sostenibile in queste regioni. Attraverso progetti mirati, forniamo assistenza medica, cibo, acqua potabile, educazione e supporto per l'empowerment delle donne.
            <br><br>
            Crediamo fermamente che ogni individuo meriti un futuro dignitoso e che l'aiuto umanitario possa fare una differenza duratura. Collaboriamo con le comunità locali, i partner internazionali e i volontari per creare un impatto positivo e sostenibile.
            <br><br>
            Unisciti a noi in questa missione di speranza e solidarietà. Insieme possiamo costruire un mondo più giusto e equo per tutti. Esplora il nostro sito per saperne di più sui nostri progetti, scoprire come puoi contribuire e unirti alla nostra causa. Grazie per il tuo sostegno.
        </p>

    </div>
</div>

<div class="cta">
    <img src="./images/placeholder.jpeg" class="logo" alt="template_image">
    <div class="button-container">
        <button id="download" class="button index-button">Vuoi saperne di piu?</button>
    </div>
</div>
</div>

    <script>

        document.getElementById('download').addEventListener('click', function() {
            let fileUrl = "./images/TUM4World.pdf";

            let link = document.createElement('a');
            link.href = fileUrl;
            link.download = 'filename.pdf';

            link.dispatchEvent(new MouseEvent('click'));
        });
    </script>
</t:base>
