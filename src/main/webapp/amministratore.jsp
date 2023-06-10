<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
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
<%
  ArrayList<String> simpatizzanti=(ArrayList<String>)request.getAttribute("simpatizzanti");
  Iterator simpaIterator = simpatizzanti.iterator();
  ArrayList<String> aderenti=(ArrayList<String>)request.getAttribute("aderenti");
  Iterator aderIterator = aderenti.iterator();
%>

  <jsp:include page="menu-private.jsp" />

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
        <button class="button" id="mostra-donazioni" onclick="first_print_donations()">Mostra le donazioni
          del
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
          <div id="info-div">
            <div class='visits' id='graph_container' style='height: 300px'></div>
          </div>
        </div>
      </div>
      <img class="close" src="images/x-symbol.svg" onclick="closeInfo()">
    </div>

    <div id="graph-container"></div>
  </main>
  <jsp:include page="phrase.jsp" />
  <jsp:include page="footer.jsp" />

  <script src="https://code.highcharts.com/highcharts.js"></script>

  <script>

    function createChart(xKey, yKey, type) {
      var container = document.getElementById('info-div');

      Highcharts.chart(container, {
        chart: {
          type: type
        },
        title: {
          text: 'Chart Title'
        },
        xAxis: {
          categories: xKey
        },
        yAxis: {
          title: {
            text: 'Value'
          }
        },
        series: [{
          name: 'Series 1',
          data: yKey
        }]
      });
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
      switch (type) {
        case "utenti": Document.getElementById("info-title").innerText = "Utenti iscritti: "; break;
        case "simpatizzanti": Document.getElementById("info-title").innerText = "Simpatizzanti iscritti: "; break;
        case "aderenti": Document.getElementById("info-title").innerText = "Aderenti iscritti: "; break;
      }
      // prende dal db i dati e li stampa con una lista <li>
      var output = '';
      var simpatizzanti = [<% while (simpaIterator.hasNext()) { out.println("'" + simpaIterator.next() + "',"); } %>];
      var aderenti = [<% while (aderIterator.hasNext()) { out.println("'" + aderIterator.next() + "',"); } %>];
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
        show.style.flexDirection = "row";
        show.style.alignContent = "center";
        show.style.gap = "100px";
        hide.style.display = "none";
      }
    }

    function print_visits() {
      console.log("${visitsPath}");
      document.getElementById("info-title").innerHTML = "Visite al sito: "

      let request = new XMLHttpRequest();
      let path = "./visits.json";
      request.open('GET', path, true);
      request.onreadystatechange = function (visits) {
        if (request.readyState === 4 && request.status === 200) {
          visits = JSON.parse(request.responseText);
          }
        let keys = Object.keys(visits).slice(1);
        let values = Object.values(visits).slice(1);

        let output = "<b>Visite totali: </b> " + visits.totalVisits + "<br>";
        output += "<b>Visite per pagina: </b><br>";
        // qui creo i grafici da mostrare
        //showGraph(visits, 'graph_container');
        createChart(keys,values, "column");

      }
      request.send();

    }

    function print_donations() {
      console.log("${visitsPath}");
      document.getElementById("info-title").innerHTML = "Donazioni al sito: "

      let request = new XMLHttpRequest();
      let path = "./donations.json";
      request.open('GET', path, true);
      request.onreadystatechange = function (visits) {
        if (request.readyState === 4 && request.status === 200) {
          donations = JSON.parse(request.responseText);
        }
        let keys = Object.keys(donations);
        let months=[];
        let values = Object.values(donations);
        alert(keys[1]);

        createChart(keys,values, "line");

      }
      request.send();

    }


  </script>


</body>

</html>