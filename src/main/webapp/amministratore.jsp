<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" %>
  
    
<html>

<head>
  <link rel="icon" href="favicon.ico" type="image/x-icon">
  <link href='https://fonts.googleapis.com/css?family=Lexend' rel='stylesheet'>
  <link href='https://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
  <link href="stylesheets/amministratore.css" rel="stylesheet" type="text/css">
  <link href="stylesheets/global.css" rel="stylesheet" type="text/css">

  <title>Tum4World</title>
</head>


<body>

<script type="text/javascript" src="${pageContext.request.contextPath}/index.js"></script>

  <script>
    fetch("visits", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: 'body=' + encodeURIComponent("Amministratore")
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
        <button class="button" id="mostra-donazioni" onclick="first_print_donations()">Mostra le donazioni del sito</button>
      </div>
    </div>

    <div class="info-container" id="info-container">
      <div class="vertical-buttons">
        <button class="button" onclick="get('utenti')">Visualizza gli utenti del sito</button>
        <button class="button" onclick="get('simpatizzanti')">Visualizza i simpatizzanti del sito</button>
        <button class="button" onclick="get('aderenti')">Visualizza gli aderenti al sito</button>
        <button class=" button" id="mostra-visite2" onclick="print_visits()">Mostra le visite del sito</button>
        <button class="button" id="mostra-donazioni2" onclick="print_donations()">Mostra le donazioni del sito</button>
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

  <script src="https://code.highcharts.com/highcharts.js"></script>

  <script>

    function createChart(xKey, yKey, type, yTitle, chartTitle) {
      var container = document.getElementById('graph-container');

      Highcharts.chart(container, {
        chart: {
          type: type
        },
        title: {
          text: chartTitle
        },
        xAxis: {
          categories: xKey
        },
        yAxis: {
          title: {
            text: yTitle
          }
        },
        series: [{
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
        case "utenti": document.getElementById("info-title").innerHTML = "Utenti iscritti: "; break;
        case "simpatizzanti": document.getElementById("info-title").innerHTML = "Simpatizzanti iscritti: "; break;
        case "aderenti": document.getElementById("info-title").innerHTML = "Aderenti iscritti: "; break;
      }
      // prende dalla servlet i dati e li stampa con una lista <li>
      var output = '';
      var simpatizzanti = [<% while (simpaIterator.hasNext()) { out.println("'" + simpaIterator.next() + "',"); } %>];
      var aderenti = [<% while (aderIterator.hasNext()) { out.println("'" + aderIterator.next() + "',"); } %>];
      if (type === "simpatizzanti" || type === "utenti") {
        if(simpatizzanti.length === 0 ){
            console.log("non ci sono simpa");
            if (type === "simpatizzanti") {
                output += 'Non ci sono simpatizzanti iscritti al momento';
            }
        }
        for (var i = 0; i < simpatizzanti.length; i++) {
            console.log(i + ") simpa:" + simpatizzanti[i] + "-------------------------");
            output += '<li class="user_simpa">' + simpatizzanti[i] + '</li>';
        }
      }
      if (type == "aderenti" || type === "utenti") {
        console.log("********************************* for ade");
        if(aderenti.length === 0){
            console.log("non ci sono simpa");
            if (type === "aderenti") {
                output += 'Non ci sono aderenti iscritti al momento';
            } else if (simpatizzanti.length === 0){
                output+="Non ci sono utenti iscritti al momento";
            }
        }
        for (var i = 0; i < aderenti.length; i++) {
          console.log(i + ") ader:" + aderenti[i] + "-------------------------");
          output += '<li class="user_ader">' + aderenti[i] + '</li>';
        }
      }
      console.log(output);
      document.getElementById('info-div').innerHTML = output;
    }
    function getArrayElementsAsJavaScriptArray(array) {
      let result = '';
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
      get(element);
    }
    function closeInfo() {
      let hide = document.getElementById("info-container")
      let show = document.getElementById("basic-container")
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
      let hide = document.getElementById("basic-container");
      let show = document.getElementById("info-container");
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
      document.getElementById("info-title").innerHTML = "Visite al sito: "
      let request = new XMLHttpRequest();
      let path = "./visits.json";
      request.open('GET', path, true);
      request.onreadystatechange = function (visits) {
        if (request.readyState === 4 && request.status === 200) {
          visits = JSON.parse(request.responseText);
          }
        let numberOfVisits = visits.TotalVisits;

        const totalVisitsKey = 'TotalVisits';

        if (visits.hasOwnProperty(totalVisitsKey)) {
          delete visits[totalVisitsKey];
        }

        let keys = Object.keys(visits);
        let values = Object.values(visits);


        let output = "<b>Visite totali: </b> " + numberOfVisits  + "<br>";
        output += "<div id='graph-container' style='height: 400px'></div>";
        document.getElementById("info-div").innerHTML=output;

        if (visits.hasOwnProperty(totalVisitsKey)) {
          delete visits[totalVisitsKey];
        }

        createChart(keys,values, "column", "visite", "Visite per pagina");
      }
      request.send();

    }

    function print_donations() {
      document.getElementById("info-title").innerHTML = "Donazioni al sito: "
      let request = new XMLHttpRequest();
      let path = "./donations.json";
      request.open('GET', path, true);
      request.onreadystatechange = function (visits) {
        if (request.readyState === 4 && request.status === 200) {
          donations = JSON.parse(request.responseText);
        }

        let keys = Object.keys(donations);
        let values = Object.values(donations);

        let months=[];
        for (let i = 0; i< keys.length; i++){
          switch (keys[i]){
            case '1' : months[i] = 'January'; break;
            case '2' : months[i] = 'February'; break;
            case '3' : months[i] = 'March'; break;
            case '4': months[i] = 'April'; break;
            case '5' : months[i] = 'May'; break;
            case '6' : months[i] = 'June'; break;
            case '7' : months[i] = 'July'; break;
            case '8' : months[i] = 'August'; break;
            case '9' : months[i] = 'September'; break;
            case '10' : months[i] = 'October'; break;
            case '11' : months[i] = 'November'; break;
            case '12' : months[i] = 'December'; break;

            default: alert(i); break;

          }
        }
        let output = "";
        output += "<div id='graph-container' style='height: 300px'></div>";
        document.getElementById("info-div").innerHTML=output;

        createChart(months,values, "line", "euro", "Donazioni annuali");

      }
      request.send();

    }


  </script>


</body>

<jsp:include page="phrase.jsp" />
<jsp:include page="footer.jsp" />


</html>