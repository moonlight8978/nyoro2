$(document).on('turbolinks:load', function () {
  var $userRatedAlbumsCanvas = $("#userRatedAlbumsChart");
  var userRatedAlbumsChart;

  if ($userRatedAlbumsCanvas.length > 0) {
    let data = $userRatedAlbumsCanvas.data('data');
    let labels = $userRatedAlbumsCanvas.data('labels');

    userRatedAlbumsChart = new Chart($userRatedAlbumsCanvas, {
      type: 'horizontalBar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Votes',
          borderColor: '#00b0f0',
          backgroundColor: '#00b0f0',
          fill: false,
          data: data
        }]
      },
      options: {
        maintainAspectRatio: false,
        layout: {
          padding: {
            top: 0,
            right: 10,
            bottom: 0,
            left: 0
          }
        },
        legend: {
          display: false
        },
        scales: {
          xAxes: [{
            display: false,
            gridLines: {
              display: false,
              drawTicks: true,
              drawOnChartArea: false,
              color: '#E5E5E5'
            },
            ticks: {
              display: false,
              fontColor: '#212529'
            }
          }],
          yAxes: [{
            barPercentage: 1.0,
            categoryPercentage: 0.9,
            gridLines: {
              display: false,
              drawTicks: false,
              drawOnChartArea: false,
              color: '#E5E5E5',
              zeroLineColor: '#E5E5E5'
            },
            ticks: {
              fontColor: '#212529',
              padding: 8,
              maxTicksLimit: 4
            }
          }]
        }
      }
    });
  }
});
