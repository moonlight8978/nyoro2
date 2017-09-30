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
            top: 0,
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
              maxTicksLimit: 6
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
            top: 0,
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
              maxTicksLimit: 6
            }
          }]
        }
      }
    });
  }
});