(function() {
  /*
  Step 1/2:
  Init functionality - toc generation and header links/scroll-behavior (enforce sequence via promise API)
  */

  var wrapper = document.querySelector('.wrapper');
  var container = wrapper.querySelector('.container');

  generateTableOfContents(wrapper, container);
  generateHeaderLinks(container)
    .then(generateHeaderLinkScrollHelpers)
    .catch(() =>
      console.warn(
        "generate-navigation-helpers.js generateHeaderLinks/generateHeaderLinkScrollHelpers didn't initialize properly"
      )
    );

  /*
  Step 2/2:
  Define hoisted functionality
  */

  function generateTableOfContents(wrapper, container) {
    // If there is a table of contents on this markdown page...
    var markdownToc = document.getElementById('markdown-toc');
    if (markdownToc) {
      var tocs = document.querySelector('.tocs-sidebar');

      // If the table of contents sidebar does not yet exist, create it.
      if (!tocs) {
        tocs = document.createElement('aside');
        tocs.className = 'tocs-sidebar';
      }

      if(window.location.pathname.split("/").includes("all-remote")){
        var ctaButton = document.createElement('a');
        ctaButton.setAttribute(
        "href", "https://about.gitlab.com/company/culture/all-remote/#remote-newsletter-block");
        ctaButton.setAttribute("class",
        "btn cta-btn ghost-accent");
        ctaButton.style.marginTop = "15px";
        ctaButton.innerText = "Subscribe to remote newsletter";
        tocs.appendChild(ctaButton);
      }

      // Create a new table of contents heading and add it to the sidebar.
      var tocHeading = document.createElement('h4');
      tocHeading.appendChild(document.createTextNode('On this page'));
      tocs.appendChild(tocHeading);

      // Clone the table of contents list and remove its id and class attributes.
      var tocClone = markdownToc.cloneNode(true);
      tocClone.removeAttribute('id');
      tocClone.removeAttribute('class');

      // Select just the cloned elements with id attributes.
      var clonedElementsWithIds = tocClone.querySelectorAll('[id]');

      // Remove the id attributes from the cloned elements.
      for (var i = 0; i < clonedElementsWithIds.length; i++) {
        clonedElementsWithIds[i].removeAttribute('id');
      }

      // Add the cloned and scrubbed table of contents list to the sidebar.
      tocs.appendChild(tocClone);

      wrapper.classList.add('sidebar-layout-wrapper');
      wrapper.classList.add('clearfix');

      // Add responsive hiding classes to the original table of contents elements.
      markdownToc.classList.add('hidden-md', 'hidden-lg');
      var onThisPage = document.getElementById('on-this-page');
      if (onThisPage) {
        onThisPage.classList.add('hidden-md', 'hidden-lg');
      }
    }
    // end if(markdownToc)
  }

  function generateHeaderLinks(container) {
    var titles = container.querySelectorAll(
      'h1, h2:not(.no_toc), h3, h4:not(.codeowners-header), h5'
    );

    // Add links to titles
    [].slice.call(titles).forEach(function(el) {
      el.innerHTML +=
        '<a href="#' + el.id + '" class="header-link-anchor"></a>';
      el.classList.add('header-link-title');
    });

    return Promise.resolve(true);
  }

  function generateHeaderLinkScrollHelpers() {
    // Replace existing scroll behavior with an offset to account for header.
    // Note this has to come after the "add links to titles" section above.

    // Inline `getParents` helper function
    // via https://github.com/happyBanshee/JS-helpers/wiki/.closest(),-.parents(),-.parentsUntil(),-.find()-in-JS
    function getParents(elem, selector) {
      var parents = [];
      var firstChar;
      if (selector) {
        firstChar = selector.charAt(0);
      }
      // Get matches
      for (; elem && elem !== document; elem = elem.parentNode) {
        if (selector) {
          // If selector is a class
          if (firstChar === '.') {
            if (elem.classList.contains(selector.substr(1))) {
              parents.push(elem);
            }
          }
          // If selector is an ID
          if (firstChar === '#') {
            if (elem.id === selector.substr(1)) {
              parents.push(elem);
            }
          }
          // If selector is a data attribute
          if (firstChar === '[') {
            if (elem.hasAttribute(selector.substr(1, selector.length - 1))) {
              parents.push(elem);
            }
          }
          // If selector is a tag
          if (elem.tagName.toLowerCase() === selector) {
            parents.push(elem);
          }
        } else {
          parents.push(elem);
        }
      }
      // Return parents if any exist
      if (parents.length === 0) {
        return null;
      } else {
        return parents;
      }
    }

    var scrollTargets = document.querySelectorAll('[href^="#"]');
    for (loopcount = 0; loopcount < scrollTargets.length; loopcount++) {
      scrollTargets[loopcount].addEventListener('click', function(event) {
        // find the target destination
        var targetHref = this.getAttribute('href');
        // find the closest details element to the destination
        var closestDetailsElement = document
          .querySelector(targetHref)
          .closest('details');
        // check to see if there is a  parent 'details' element to expand
        if (document.querySelector(targetHref).closest('details') !== null) {
          var elem = document.querySelector(targetHref);
          var parents = getParents(elem, 'details');
          for (loopcount = 0; loopcount < parents.length; loopcount++) {
            parents[loopcount].open = true;
          }
          // and then scroll to the appropriate element
          window.scroll(0, closestDetailsElement.offsetTop - 75);
        }
      });
    }

    // Scroll URL anchor into view on pageload.
    var fi = document.location.hash ? document.location.hash.substr(1) : null;
    var el = fi !== null ? document.getElementById(fi) : null;
    if (el) {
      // check to see if there is a parent 'details' element to expand
      closestDetailsElement = el.closest('details');
      if (closestDetailsElement !== null) {
        // find all parent 'details' elements so we can open them
        var elem = el;
        var parents = getParents(elem, 'details');
        for (loopcount = 0; loopcount < parents.length; loopcount++) {
          parents[loopcount].open = true;
        }
        // and then scroll to the appropriate element
        window.scroll(0, closestDetailsElement.offsetTop - 0);
      } else {
        // there is no parent details element to expand but we still need to scroll to the correct spot on the page
        window.scroll(0, el.offsetTop - 75);
      }
    }

    return Promise.resolve(true);
  }
})();
