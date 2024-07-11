var now = new Date();
var elements = document.getElementsByClassName('today');
Array.prototype.forEach.call(elements, function(element) {
	element.innerHTML = moment(now).format('YYYY-MM-DD');
});

const colors = {
  green: {
    fill: '#b3ffb3',
    stroke: '#00e600',
  },
  yellow: {
    fill: '#ffffb3',
    stroke: '#e6e600',
  },
  red: {
    fill: '#ffb3b3',
    stroke: '#ff6666',
  },
  blue: {
    fill: '#b3c6ff',
    stroke: '#4d79ff',
  },
  orange: {
    fill: '#fdab81',
    stroke: '#fc6d27',
  },
};

const verticalLinePlugin = {
  getLinePosition: function (chart, pointIndex) {
      const meta = chart.getDatasetMeta(0); // first dataset is used to discover X coordinate of a point
      const data = meta.data;
      return data[pointIndex]._model.x;
  },
  renderVerticalLine: function (chartInstance, pointIndex) {
      const lineLeftOffset = this.getLinePosition(chartInstance, pointIndex);
      const scale = chartInstance.scales['y-axis-0'];
      const context = chartInstance.chart.ctx;

      // render vertical line
      context.beginPath();
      context.strokeStyle = '#666666';
      context.moveTo(lineLeftOffset, scale.top);
      context.lineTo(lineLeftOffset, scale.bottom);
      context.stroke();
  },

  afterDatasetsDraw: function (chart, easing) {
      if (chart.config.lineAtIndex) {
          chart.config.lineAtIndex.forEach(pointIndex => this.renderVerticalLine(chart, pointIndex));
      }
  }
};

$('.maturity-row').on('click', function() {
  $(this).toggleClass('expanded');
});

$('.expand-all').on('click', function() {
  const $el = $(this);
  const expand = !$el.toggleClass('expanded').hasClass('expanded');

  if (expand) {
    $('.maturity-row').removeClass('expanded');
  } else {
    $('.maturity-row').addClass('expanded');
  }
});

window.now = now;
window.elements = elements;
window.colors = colors;
window.verticalLinePlugin = verticalLinePlugin;