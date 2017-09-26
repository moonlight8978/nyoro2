// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function (event) {
  var dbEditDayCanvas = $("#editChart");
  var dbEditDayChart;
  
  if (dbEditDayCanvas.length) {
    let data = dbEditDayCanvas.data('data');
    let labels = dbEditDayCanvas.data('labels');
    
    dbEditDayChart = new Chart(dbEditDayCanvas, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'Total of edit',
          borderColor: '#fff',
          backgroundColor: '#06BCD2',
          fill: false,
          data: data
        }]
      },
      options: {
        legend: {
          display: false,
        },
        layout: {
          padding: {
            top: 15,
            right: 40,
            bottom: 15,
            left: 15
          }
        },
        scales: {
          xAxes: [{
            gridLines: { 
              display: false
            },
            ticks: { 
              fontColor: '#fff'
            }
          }],
          yAxes: [{
            gridLines: { 
              color: '#46D9E9',
              drawTicks: false,
              tickMarkLength: 11,
              zeroLineColor: '#46D9E9'
            },
            ticks: { 
              fontColor: '#fff',
              padding: 10,
              maxTicksLimit: 4
            }
          }]
        }
      }
    });
  }
  
  var $dbEditMonthCanvas = $("#editChartMonth");
  var dbEditMonthChart;
  
  if ($dbEditMonthCanvas.length > 0) {
    let data = $dbEditMonthCanvas.data('data');
    let labels = $dbEditMonthCanvas.data('labels');
    
    dbEditMonthChart = new Chart($dbEditMonthCanvas, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Total of edit',
          borderColor: '#47BFBD',
          backgroundColor: '#47BFBD',
          fill: false,
          data: data
        }]
      },
      options: {
        layout: {
          padding: {
            top: 30,
            right: 15,
            bottom: 15,
            left: 15
          }
        },
        legend: {
          display: false
        },
        scales: {
          xAxes: [{
            gridLines: { 
              drawTicks: true,
              drawOnChartArea: false,
              color: '#E5E5E5'
            },
            ticks: {
              fontColor: '#212529'
            }
          }],
          yAxes: [{
            gridLines: { 
              drawTicks: true,
              drawOnChartArea: false,
              color: '#E5E5E5',
              zeroLineColor: '#E5E5E5'
            },
            ticks: {
              fontColor: '#212529',
              padding: 5,
              maxTicksLimit: 4
            }
          }]
        }
      }
    });
  }
  
  var $browserCanvas = $("#browserChart");
  var browserChart;
  
  if ($browserCanvas.length > 0) {
    browserChart = new Chart($browserCanvas, {
      type: 'radar',
      data: {
        labels: ['Chrome', 'Firefox', 'IE', 'Safari', 'Others'],
        datasets: [{
          borderColor: 'white',
          borderWidth: 2,
          pointBackgroundColor: '#0A7A64',
          pointBorderColor: '#fff',
          pointBorderWidth: 2,
          fill: false,
          data: [20, 20, 10, 15, 15]
        }]
      },
      options: {
        layout: {
          padding: {
            top: 0,
            bottom: 15,
            left: 15,
            right: 15
          }
        },
        legend: {
          display: false
        },
        scale: {
          gridLines: { 
            color: '#008376'
          },
          angleLines: {
            color: '#77DBCF'
          },
          ticks: {
            display: false,
            maxTicksLimit: 3,
            min: 0
          },
          pointLabels: {
            fontColor: 'white',
            fontSize: 11
          }
        }
      }
    });
  }
});
