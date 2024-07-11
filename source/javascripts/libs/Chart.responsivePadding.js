Chart.plugins.register((function(){
  var chart_padding_lookup = {};

  function chartId(chart) {
    return chart.canvas.id;
  }

  function onResize(chart) {
    var bodyWidth = document.getElementsByTagName('body')[0].offsetWidth;
    var chart_id = chartId(chart);
    if ( bodyWidth < 1200 ) {
      var newPadding = deepmerge({}, chart_padding_lookup[chart_id]);
      newPadding.right = Math.ceil((bodyWidth / 1200) * newPadding.right);
      if ( bodyWidth < 600 && newPadding.right > 0 ) {
        newPadding.right += Math.ceil((1200 / bodyWidth) * 25);
      }
      chart.config.options.layout.padding = newPadding;
    } else {
      chart.config.options.layout.padding = chart_padding_lookup[chart_id];
    }
    chart.update(0);
  }

  var events = {
    resize: onResize,
    afterInit: function(chart, options) {
      var chart_id = chartId(chart)
      if ( !chart_padding_lookup.hasOwnProperty(chart_id) ) {
        chart_padding_lookup[chart_id] = chart.config.options.layout.padding;
      }
      onResize(chart);
    }
  };

  return events;
})());

