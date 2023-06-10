<%--
  Created by IntelliJ IDEA.
  User: ivan
  Date: 10/06/23
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Testing</title>
</head>
<body>
<h1>asd</h1>
<div id="container" style="width:100%; height:400px;"></div>
</body>
</html>

<script src="https://code.highcharts.com/highcharts.js"></script>


<script>
    iLikeDick();

    function iLikeDick(){
  document.addEventListener('DOMContentLoaded', function () {
    const chart = Highcharts.chart('container', {
      chart: {
        type: 'bar'
      },
      title: {
        text: 'Fruit Consumption'
      },
      xAxis: {
        categories: ['Apples', 'Bananas', 'Oranges']
      },
      yAxis: {
        title: {
          text: 'Fruit eaten'
        }
      },
      series: [{
        name: 'Jane',
        data: [1, 0, 4]
      }, {
        name: 'John',
        data: [5, 7, 3]
      }]
    });
  });

  let chart; // globally available
  document.addEventListener('DOMContentLoaded', function() {
    chart = Highcharts.stockChart('container', {
      rangeSelector: {
        selected: 1
      },
      series: [{
        name: 'USD to EUR',
        data: usdtoeur // predefined JavaScript array
      }]
    });
  })
    };
</script>
