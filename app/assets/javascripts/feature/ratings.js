$(document)
  .on('change', '.b-feature-rate input', async function (event) {
    let $form = $(this.form);
    $form.addClass('active');
    let star = parseInt($(this).val()) || '-';
    setTimeout(async () => {
      try {
        let response = await submitRating($form.attr('action'), $form.serialize());
        $('#userRatedStar').html(response.data.user);
        $('#avgRatedStar').html(response.data.avg);
      } catch (error) {
        // $("input[name='feature_rate[star]'][value='5']").attr('checked', 'checked');
      } finally {
        $form.removeClass('active');
        $('#rateForm').dropdown('toggle');
      }
    }, 3000);
  });

function submitRating(url, data) {
  return axios({
    method: 'post',
    url: url,
    data: data,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  });
}

$(document).on('turbolinks:load', function () {
  var $rateCanvas = $("#rateChart");
  var rateChart;

  if ($rateCanvas.length > 0) {
    let data = $rateCanvas.data('data');
    let labels = $rateCanvas.data('labels');

    rateChart = new Chart($rateCanvas, {
      type: 'horizontalBar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Votes',
          borderColor: '#47BFBD',
          backgroundColor: '#47BFBD',
          fill: false,
          data: data
        }]
      },
      options: {
        maintainAspectRatio: false,
        layout: {
          padding: {
            top: 0,
            right: 0,
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
