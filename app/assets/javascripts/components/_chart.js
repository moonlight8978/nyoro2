/**
 * This is abstract class for Charts
 */
class ChartByChartJS {
  /**
   * constructor - description
   *
   * @param  {Object} options       chart options
   * @param  {String} options.note  note class name or id, ex `'.note'`, `'#note'`
   * @param  {String} options.label chart label
   * @param  {String} options.label chart label
   * @param  {String} options.dataLabels data label
   * @param  {String} options.dataLabels data label
   */
  constructor(options) {
    this.note = options.note;
    this.label = options.label || '';
    this.dataLabels = options.dataLabels;
    this.data = options.data;
    this.padding = {
      top: options.padding.split(' ')[0] || 30,
      right: options.padding.split(' ')[1] || 15,
      bottom: options.padding.split(' ')[2] || 15,
      left: options.padding.split(' ')[3] || 15,
    };
  }

  draw() {
    let $note = $(this.note);
    if ($note.length) {
      this.chart = new Chart(dbEditDayCanvas, this.config);
    }
  }

  chartConfig() {
    return {
      type: this.type,
      data: {
        labels: this.dataLabels,
        datasets: [{
          label: this.label,
          borderColor: '#fff',
          backgroundColor: '#06BCD2',
          fill: false,
          data: this.data
        }]
      },
      options: this.options
    };
  }
}

class BarChart extends ChartByChartJS {
  constructor(options) {
    super(options);
    this.type = "bar";
    this.options = Object.assign({}, barChartOptions, {
      layout: {
        padding: {
          top: this.padding.top,
          right: this.padding.right,
          bottom: this.padding.bottom,
          left: this.padding.left
        }
      },
      scales: {
        xAxes: [{
          gridLines: {
            color: this.gridColor,
            zeroLineColor: this.gridColor
          },
          ticks: {
            fontColor: this.color,
          }
        }],
        yAxes: [{
          gridLines: {
            color: this.gridColor,
            zeroLineColor: this.gridColor
          },
          ticks: {
            fontColor: this.color,
          }
        }]
      }
    });
    this.config = chartConfig();
  }
}
