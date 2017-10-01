// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function (event) {
  var dbEditDayCanvas = $("#userEditChart");
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
          borderColor: '#43A1F0',
          borderWidth: 3,
          backgroundColor: '#BFDCFA',
          pointBorderWidth: 3,
          pointBackgroundColor: '#fff',
          fill: true,
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
            right: 15,
            bottom: 15,
            left: 15
          }
        },
        scales: {
          xAxes: [{
            gridLines: { 
              color: '#B6D9F8',
              drawTicks: false,
              tickMarkLength: 5,
              drawOnChartArea: false,
              zeroLineColor: '#B6D9F8'
            },
            ticks: { 
              display: false
            }
          }],
          yAxes: [{
            gridLines: { 
              color: '#B6D9F8',
              drawTicks: false,
              tickMarkLength: 5,
              drawOnChartArea: false,
              zeroLineColor: '#B6D9F8'
            },
            ticks: { 
              display: false
            }
          }]
        }
      }
    });
  }
  
  var $dbCommentDayCanvas = $("#userCommentChart");
  var dbCommentDayChart;
  
  if ($dbCommentDayCanvas.length) {
    let data = $dbCommentDayCanvas.data('data');
    let labels = $dbCommentDayCanvas.data('labels');
    
    dbCommentDayChart = new Chart($dbCommentDayCanvas, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: '編集',
          borderColor: '#43A1F0',
          borderWidth: 3,
          backgroundColor: '#BFDCFA',
          pointBorderWidth: 3,
          pointBackgroundColor: '#fff',
          fill: true,
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
            right: 15,
            bottom: 15,
            left: 15
          }
        },
        scales: {
          xAxes: [{
            gridLines: { 
              color: '#B6D9F8',
              drawTicks: false,
              tickMarkLength: 5,
              drawOnChartArea: false,
              zeroLineColor: '#B6D9F8'
            },
            ticks: { 
              display: false
            }
          }],
          yAxes: [{
            gridLines: { 
              color: '#B6D9F8',
              drawTicks: false,
              tickMarkLength: 5,
              drawOnChartArea: false,
              zeroLineColor: '#B6D9F8'
            },
            ticks: { 
              display: false
            }
          }]
        }
      }
    });
  }
});