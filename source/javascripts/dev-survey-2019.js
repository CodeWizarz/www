/* global jQuery */
(function($) {

  var elementsToCheck = []

  function checkIfVisible () {
    function checkIfElementIsOnScreen(el) {
      var rect = el.getBoundingClientRect();
      
      return !(
        (rect.x + rect.width) < 0 
          || (rect.y + rect.height) < 0
          || (rect.x > window.innerWidth || rect.y > window.innerHeight)
     );
    };

    elementsToCheck = elementsToCheck.reduce(function(all, currentElement) {
      if (checkIfElementIsOnScreen(currentElement) && $(currentElement).is(":visible")) {
        $(currentElement).addClass('is-visible').removeClass('not-visible')
        return all
      }
      else {
        return all.concat(currentElement)
      }
    }, [])

    if (elementsToCheck.length === 0) {
      document.removeEventListener('scroll', checkIfVisible)
      document.removeEventListener('resize', checkIfVisible)
    }
  }


  // Enable read more button 
  $('.toggle-category').click(function() {
    var parentSection = $(this).closest('section');

    $(parentSection).toggleClass('expanded');
    $(this).text(parentSection.hasClass('expanded') ? 'Close' : 'Read More')

    checkIfVisible()

    $(this).hide()
  })

  $('.mobile-menu').click(function(event) {
    if (event.target.tagName === 'A') {
      $('#exit-icon').trigger('click')
    }
    checkIfVisible()
  })

  
  $('.not-visible').each(function(index, element) {
    elementsToCheck.push(element)
  })

  document.addEventListener('scroll', checkIfVisible, { passive: true })
  document.addEventListener('resize', checkIfVisible, { passive: true })

}(jQuery));