<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" %>
  <html>

  <head>
    <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
    <link href="stylesheets/amministratore.css" rel="stylesheet" type="text/css">
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
        body: 'body=' + encodeURIComponent("amministratore")
      })
    </script>
    <jsp:include page="menu-private.jsp" />

    <%
      ArrayList<String> simpatizzanti=(ArrayList<String>)request.getAttribute("simpatizzanti");
      Iterator simpaIterator = simpatizzanti.iterator();
      ArrayList<String> aderenti=(ArrayList<String>)request.getAttribute("aderenti");
      Iterator aderIterator = aderenti.iterator();
      float[] donations = (float[]) request.getAttribute("donations");
      Map<String, Integer> visits = (Map<String, Integer>) request.getAttribute("visits");
      //Iterator visitsIterator = visits.iterator();
    %>
      <main class=" content">

      <h1 class="title">Benvenuto/a Amministratore!</h1>
      <div id="basic-container">
        <div class="button-container">
          <button class="button" onclick="firstClick('utenti')">Visualizza gli utenti del sito</button>
          <button class="button" onclick="firstClick('simpatizzanti')">Visualizza i simpatizzanti del
            sito</button>
          <button class="button" onclick="firstClick('aderenti')">Visualizza gli aderenti al sito</button>
        </div>
        <div class="button-container">
          <button class="button" id="mostra-visite" onclick="first_print_visits()">Mostra le visite del
            sito</button>
          <button class="button" id="mostra-donazioni" onclick="first_print_donations()">Mostra le donazioni del
            sito</button>
        </div>
      </div>

      <div class="info-container" id="info-container">
        <div class="vertical-buttons">
          <button class="button" onclick="get('utenti')">Visualizza gli utenti del sito</button>
          <button class="button" onclick="get('simpatizzanti')">Visualizza i simpatizzanti del sito</button>
          <button class="button" onclick="get('aderenti')">Visualizza gli aderenti al sito</button>
            <button class=" button" id="mostra-visite2" onclick="print_visits()">Mostra le visite del
              sito</button>
              <button class="button" id="mostra-donazioni2" onclick="print_donations()">Mostra le donazioni del
                sito</button>
          </div>
        <div class="super-info">
          <div class="info">
            <h2 id="info-title"></h2>
            <div id="info-div"></div>
          </div>
        </div>
          <img class="close" src="images/x-symbol.svg" onclick="closeInfo()">
        </div>
        </main>
        <jsp:include page="phrase.jsp" />
        <jsp:include page="footer.jsp" />

        <script>
          function print_donations() {
            // prende da derby i dati e li stampa in un grafico
          }
          function print_visits() {
            // prende dal contatore e dal db i dati e li stampa con una lista <li>, 
            // poi crea un grafico per ogni pagina e stampa anche quello
            // crea un pulsante per resettare i contatori
            var totalVisits = '${totalVisits}';
            document.getElementById('info-div').innerHTML = "total visits: " + totalVisits;

          }
          function first_print_visits() {
            changeAppearance();
            print_visits();
          }
          function first_print_donations() {
            changeAppearance();
            print_donations();
          }
          function get(type) {
            // prende dal db i dati e li stampa con una lista <li>
            var output = '';
            var simpatizzanti = [<% while(simpaIterator.hasNext()) { out.println("'"+ simpaIterator.next() +"',");} %>];
            var aderenti =  [<% while(aderIterator.hasNext()) { out.println("'"+ aderIterator.next() +"',");} %>];
            if (type === "simpatizzanti" || type === "utenti") {
              console.log("********************************* for simpa");
              for (var i = 0; i < simpatizzanti.length; i++) {
                //
                console.log(i + ") simpa:" + simpatizzanti[i] + "-------------------------");
                output += '<li class="user_simpa">' + simpatizzanti[i] + '</li>';
              }
            }
            if (type == "aderenti" || type === "utenti") {
              console.log("********************************* for ade");
              for (var i = 0; i < aderenti.length; i++) {
                //
                console.log(i + ") ader:" + aderenti[i] + "-------------------------");
                output += '<li class="user_ader">' + aderenti[i] + '</li>';
              }
            }
            console.log(output);
            document.getElementById('info-div').innerHTML = output;
          }

          function getArrayElementsAsJavaScriptArray(array) {
            var result = '';
            for (var i = 0; i < array.length; i++) {
              result += "'" + array[i] + "'";
              if (i < array.length - 1) {
                result += ', ';
              }
            }
            return result;
          }

          function firstClick(element) {
            changeAppearance();
            get(element)
          }

          function closeInfo() {
            var hide = document.getElementById("info-container")
            var show = document.getElementById("basic-container")
            if (hide.style.display === "none") {
              hide.style.display = "flex";
              hide.style.flexDirection = "row";
            } else {
              show.style.display = "block"
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
              show.style.display = "flex";
              show.style.flexDirection="row";
              show.style.alignContent = "center";
              show.style.gap = "100px";
              hide.style.display = "none";
            }
          }


        </script>
  </body>

  </html>