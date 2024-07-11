const READY_STATE_LOADING = 'loading';
const STATE_EXPANDED = 'expanded';
const STATE_COLLAPSED = 'collapsed';

let currentOrgChartState = STATE_EXPANDED;

function initOrgChart() {
  const expandCollapseButton = document.querySelector('.js-toggle-expand-collapse');

  // Attempting to debug flakiness in org_chart_spec.rb.
  // See https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/43793#note_307431396
  // If it flakes again, the amount of dots after 'Loading' in the failure
  // screenshot will indicate at what point it failed...
  expandCollapseButton.innerHTML = 'Loading....';

  const orgChartContainer = document.querySelector('.org-chart-container');
  orgChartContainer.querySelectorAll('.node.has-tree').forEach(node => {
    node.addEventListener('click', onNodeClick.bind(null, node), false);
  });

  expandCollapseButton.innerHTML = 'Loading.....';

  expandCollapseButton.addEventListener('click', onExpandCollapseClick, false);

  expandCollapseButton.innerHTML = 'Collapse All';
}

function onNodeClick(node) {
  const desiredState = node.classList.contains('is-expanded') ? STATE_COLLAPSED : STATE_EXPANDED;

  changeNodeState(node, desiredState);
}

function onExpandCollapseClick(event) {
  event.preventDefault();
  event.stopPropagation();

  let desiredNodeState = currentOrgChartState === STATE_EXPANDED ? STATE_COLLAPSED : STATE_EXPANDED

    document.querySelectorAll('.org-chart-container .node.has-tree').forEach(
      node => {
        changeNodeState(node, desiredNodeState);
      })

    currentOrgChartState = desiredNodeState
    // Changing of the innerHTML text needs to happen last, to prevent capybara race condition flakiness
    event.target.innerHTML = currentOrgChartState === STATE_EXPANDED ? 'Collapse All' : 'Expand All'
}

function changeNodeState(node, desiredState) {
  const nextSibling = node.nextElementSibling;

  if (nextSibling && nextSibling.classList.contains('tree')) {
    if (desiredState === STATE_EXPANDED) {
      nextSibling.classList.remove('hide');
      node.classList.add('is-expanded');
    } else {
      nextSibling.classList.add('hide');
      node.classList.remove('is-expanded');
    }
  }
}

if (document.readyState !== READY_STATE_LOADING) {
  initOrgChart();
} else {
  document.addEventListener('DOMContentLoaded', event => {
    initOrgChart();
  });
}
