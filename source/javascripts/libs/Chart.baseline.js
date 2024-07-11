(function(Chart) {
  'use strict';

  var MODEL_KEY = '$baseline';

    Chart.defaults.global.plugins.baseline = {
      color: '#e7e7e7',
      width: 4
    };
    Chart.plugins.register({
      id: 'baseline',

      beforeInit: function(chart, options) {
        //debugger
        chart[MODEL_KEY] = {
          options: options
        };
      },

      afterDatasetsDraw: function(chart, easing) {
        //debugger
        chart.ctx.fillStyle = chart[MODEL_KEY].options.color;
        if ( chart.config.type === 'horizontalBar' ) {
            chart.ctx.fillRect(chart.chartArea.left, chart.chartArea.top, 4, chart.chartArea.bottom - chart.chartArea.top);
        } else {
          chart.ctx.fillRect(chart.chartArea.left, chart.chartArea.bottom, chart.chartArea.right - chart.chartArea.left, chart[MODEL_KEY].options.width);
        }
      }
    });
}(Chart));
