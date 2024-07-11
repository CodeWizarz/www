function setTooltipTitle(trigger, title, action) {
  var selectedAction = action === null ? 'show' : action;

  trigger
    .attr('title', title)
    .tooltip('fixTitle')
    .tooltip(selectedAction);
}

function showCopiedTooltip(e) {
  var trigger = $(e.trigger);
  var originalTitle = trigger.attr('data-original-title');

  setTooltipTitle(trigger, 'Copied');

  setTimeout(function() {
    setTooltipTitle(trigger, originalTitle, 'hide');
  }, 2000);
}

function initCopyButton(selector) {
  var clipboard = new Clipboard(selector);

  clipboard.on('success', showCopiedTooltip);

  return clipboard;
}

window.initCopyButton = initCopyButton;
