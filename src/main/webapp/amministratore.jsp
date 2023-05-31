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
      <div id="basic-container">
      <div class="button-container">
        <button class="button" onclick="changeAppearance()">Visualizza gli utenti del sito</button>
        <button class="button" onclick="get('simpatizzanti')">Visualizza i simpatizzanti del sito</button>
        <button class="button" onclick="get('aderenti')">Visualizza gli aderenti al sito</button>
      </div>
      <div class="button-container">
        <button class="button" id="mostra-visite" onclick="print_visits()">Mostra le visite del sito</button>
        <button class="button" id="mostra-donazioni" onclick="print_donations()">Mostra le donazioni del sito</button>
      </div>
      </div>



      <div class="info-container" id="info-container">
        <div class="vertical-buttons">
          <button class="button" onclick="get('utenti')">Visualizza gli utenti del sito</button>
          <button class="button" onclick="get('simpatizzanti')">Visualizza i simpatizzanti del sito</button>
          <button class="button" onclick="get('aderenti')">Visualizza gli aderenti al sito</button>

          <button class="button" id="mostra-visite2" onclick="print_visits()">Mostra le visite del sito</button>
          <button class="button" id="mostra-donazioni2" onclick="print_donations()">Mostra le donazioni del sito</button>
        </div>
        <div class="info">

        </div>

          <img class="close" src="images/x-symbol.svg" onclick="closeInfo()">
      </div>
    </main>
  </t:base>

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

      function closeInfo(){
        var hide = document.getElementById("info-container")
        var show = document.getElementById("basic-container")
        if (hide.style.display === "none") {
          hide.style.display = "block";
        } else {
          show.style.display= "block"
          hide.style.display = "none";
        }
      }

      function changeAppearance() {
        console.log("entro in funzione")
        var hide = document.getElementById("basic-container");
        var show = document.getElementById("info-container");
        if (hide.style.display === "none") {
          hide.style.display = "block";
        } else {
          show.style.display= "block"
          hide.style.display = "none";
        }
      }


    </script>
