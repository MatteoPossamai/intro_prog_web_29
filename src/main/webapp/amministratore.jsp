<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>


    <link href="stylesheets/amministratore.css" rel="stylesheet" type="text/css">   <title>Tum4World</title>

<t:base>

  <script>
      fetch("visits", {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'body='+ encodeURIComponent("amministratore")
      })
  </script>

    <main class="content">

      <h1 class="title">Benvenuto/a Amministratore!</h1>
      <div class="button-container">
        <button class="button" onclick="get('utenti')">Visualizza gli utenti del sito</button>
        <button class="button" onclick="get('simpatizzanti')">Visualizza i simpatizzanti del sito</button>
        <button class="button" onclick="get('aderenti')">Visualizza gli aderenti al sito</button>
      </div>
      <div class="button-container">
        <button class="button" id="mostra-visite" onclick="print_visits()">Mostra le visite del sito</button>
        <button class="button" id="mostra-donazioni" onclick="print_donations()">Mostra le donazioni del sito</button>
      </div>
    </main>
  </t:base>

    <!--
    <div id="popup-profilo" class="amministratore-popup-profilo">
      <div class="amministratore-popup-content">
        <span class="close" onclick="hide('popup-profilo')">&times;</span>
        <p>Informazioni del profilo</p>
      </div>
    </div>
    <div id="popup-cancella" class="amministratore-popup-cancella">
      <div class="amministratore-popup-content">
        <span class="close" onclick="hide('popup-cancella')">&times;</span>
        <p>La cancellazione dal sito è andata a buon fine</p>
      </div>
    </div>
    -->
    <script>
      function print_donations() {
        // prende da derby i dati e li stampa in un grafico
      }
      function print_visits() {
        // prende dal contatore e dal db i dati e li stampa con una lista <li>, 
        // poi crea un grafico per ogni pagina e stampa anche quello
        // crea un pulsante per resettare i contatori
      }
      function get(element) {
        // prende dal db i dati e li stampa con una lista <li>
      }
    </script>
