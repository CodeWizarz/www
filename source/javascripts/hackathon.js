(function() {
  setupCountdown(nextHackathonDate, 'nextHackathonCountdown');
})();

// Use the GitLab API to fetch the number of MRs submitted during the Hackathon
// It assumes there is a tracking issue that contains the list of MRs as
// related merge requests
var gitlabProjectPath = 'gitlab-org/developer-relations/contributor-success/team-task';
var gitlabHost = 'https://gitlab.com';
var hackathonIssue = `${gitlabHost}/${gitlabProjectPath}/-/issues/${hackathonIssueID}`;
var apiHost = `${gitlabHost}/api/v4`;
var gitlabProjectID = encodeURIComponent(gitlabProjectPath);
var apiEndpoint = `/projects/${gitlabProjectID}/issues/${hackathonIssueID}/related_merge_requests`;
var apiURL = apiHost + apiEndpoint;

fetch(apiURL)
  .then(function(response) {
    var totalRelatedMRs = response.headers.get('X-Total');
    var boxMessage = `Hackathon MR Tracking Issue: <a href="${hackathonIssue}">${totalRelatedMRs} qualifying MRs submitted!</a>`
    document.getElementById('hackathonMRCount').innerHTML = boxMessage;
  })
  .catch(error => console.error('Error:', error));
