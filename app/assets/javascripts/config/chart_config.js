const barChartOptions = {
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
};
