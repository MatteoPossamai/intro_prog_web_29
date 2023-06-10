document.addEventListener("DOMContentLoaded", function() {
  // Retrieve or define your JSON data
  var jsonData = [
      { "x": 1, "y": 5 },
      { "x": 2, "y": 10 },
      { "x": 3, "y": 8 },
      // Add more data points as needed
  ];

  Highcharts.chart('graph_container', {
      chart: {
          type: 'line'
      },
      title: {
          text: 'Visite per pagina'
      },
      xAxis: {
          title: {
              text: 'Pagina'
          }
      },
      yAxis: {
          title: {
              text: 'Visite'
          }
      },
      series: [{
          name: 'Data',
          data: visits.map(function(point) {
              return [point.first, point.second];
          })
      }]
  });
});