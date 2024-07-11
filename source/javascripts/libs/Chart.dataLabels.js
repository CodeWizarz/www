// Define a plugin to provide data labels
Chart.plugins.register({
  afterDatasetsDraw: function(chart, easing) {
    // To only draw at the end of animation, check for easing === 1
    var ctx = chart.ctx;
    var body_width = document.getElementsByTagName('body')[0].offsetWidth;

    function responsiveFontSize(font_size) {
      if ( body_width >= 1200 ) {
        return font_size;
      }

      if ( body_width >= 992 ) {
        return Math.floor(font_size * 0.8);
      }

      if ( body_width >= 768 ) {
        return Math.floor(font_size * 0.64);
      }

      return Math.floor(font_size * 0.5);
    }

    function responsiveYOffset(offset) {
      if ( body_width >= 1200 ) {
        return offset;
      }

      if ( body_width >= 992 ) {
        return Math.floor(offset * 0.8);
      }

      if ( body_width >= 768 ) {
        return Math.floor(offset * 0.64);
      }

      return Math.floor(offset / 2);
    }

    function responsiveXOffset(offset) {
      return responsiveYOffset(offset);
    }

    chart.data.datasets.forEach(function (dataset, i) {
      var meta = chart.getDatasetMeta(i);
      if (!meta.hidden) {
        meta.data.forEach(function(element, index) {
          // Draw the text in white, with the specified font
          ctx.fillStyle = 'rgb(255, 255, 255)';
          //ctx.fillStyle = 'rgb(0, 0, 0)';

          var fontSize = responsiveFontSize(28);
          var fontStyle = 'bold';
          var fontFamily = "'Source Sans Pro', sans-serif";
          ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

          // Just naively convert to string for now
          var formatter = function(value) { return value };
          if ( typeof dataset['formatter'] === 'function' ) {
            formatter = dataset.formatter;
          }

          var dataPosition = typeof dataset['dataPosition'] === 'string' ? dataset['dataPosition'] : 'right';

          var showLabel = typeof dataset['showLabel'] === 'boolean' ? dataset['showLabel'] : false;
          var dataString = formatter(dataset.data[index].toString());
          var labelString = element._model.label;

          // Make sure alignment settings are correct
          ctx.textBaseline = 'middle';

          var padding = 5;
          var position = element.tooltipPosition();
          if ( element._view.horizontal ) {
            ctx.textAlign = dataPosition;
            if ( dataPosition === 'center' ) {
              var x = (position.x - element._model.base) * 0.5 + element._model.base;
              if ( x + responsiveXOffset(20) > chart.ctx.canvas.clientWidth ) {
                chart.options.layout.padding.top = responsiveYOffset(25);
                ctx.fillStyle = dataset.backgroundColor;
                ctx.fillText(dataString, position.x - responsiveXOffset(20), position.y - (fontSize / 2) + responsiveYOffset(13) - responsiveYOffset(35));
              } else {
                ctx.fillText(dataString, x + 3, position.y - (fontSize / 2) + responsiveYOffset(13));
              }
            } else {
              ctx.fillText(dataString, position.x - 7, position.y - (fontSize / 2) + responsiveYOffset(13));
            }
            if ( showLabel ) {
              fontSize = responsiveFontSize(22);
              fontStyle = '600';
              ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

              ctx.textAlign = 'left';
              ctx.fillStyle = '#444';
              ctx.fillText(labelString, position.x + 5, position.y - (fontSize / 2) + responsiveYOffset(13));
            }
          } else if ( element._view.circumference ) {
            // Donut or Pie chart
            fontSize = 36;
            ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
            ctx.textAlign = 'center';
            ctx.fillText(dataString, position.x, position.y - (fontSize / 2) + 15);

            if ( showLabel ) {
              fontSize = 20;
              ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
              ctx.fillText(labelString, position.x, position.y - (fontSize / 2) - 20);
            }
          } else {
            ctx.textAlign = 'center';
            ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding + responsiveYOffset(40));
          }
        });
      }
    });
  }
});
