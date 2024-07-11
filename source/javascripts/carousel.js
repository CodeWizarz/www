$(function () {
  $('.carousel').each(function (i) {
    const carousel = $(this)
    const _getCarouselItems = () => {
      return carousel.children('.carousel-items').children()
    }
    while (_getCarouselItems().length > 2 && _getCarouselItems().length < 5) {
      _getCarouselItems().clone().appendTo(_getCarouselItems().parent())
    }
  
    const items = _getCarouselItems()
    const cssClasses = ['previous', 'selected', 'next', 'unselected-next']
    var currentItemsIndex = []
  
    const _shiftIndex = (currentIndex, direction) => {
      var newIndex = currentIndex + direction
      if (newIndex >= items.length) {
        newIndex = 0
      }
      else if (newIndex < 0) {
        newIndex = items.length - 1
      }
      return newIndex
    }
  
    const _spin = (direction) => {
      currentItemsIndex = currentItemsIndex.map((currentIndex, i) => {
        const newIndex = _shiftIndex(currentIndex, direction)
        $(items[currentIndex]).removeClass(cssClasses[i])
        $(items[newIndex]).addClass(cssClasses[i])
        $(items[newIndex]).removeClass('unselected')
  
        return newIndex
      })
  
      items.each((i, item) => {
        if (!currentItemsIndex.includes(i) && !$(item).attr('class').includes('unselected')) {
          $(item).addClass('unselected')
        }
        
      });
    }
  
    const _spinRight = function () {
      _spin(1)
    }
  
    const _spinLeft = function () {
      _spin(-1)
    }

    carousel.children('.arrow-left').on('click', _spinLeft)
    carousel.children('.arrow-right').on('click', _spinRight)
    
    const firstElement = items.length < cssClasses.length ? 0 : -1
    const lastElement = items.length < cssClasses.length - 1 ? items.length - 1 : cssClasses.length - 2
    for (i = firstElement; i <= lastElement; i ++) {
      const index = _shiftIndex(i, 0)
      $(items[index]).addClass(cssClasses[i + 1])
      $(items[index]).removeClass('unselected')
      currentItemsIndex.push(index)
    }
  
  })

  var selectedVideo = ''
  const _openVideo = function (event) {
    selectedVideo = event.currentTarget.href
    $('.carousel-video-modal').modal()
    $('.carousel-video-modal iframe').attr('src', selectedVideo)
    return false
  }

  const _playVideo = () => {
    const joining = selectedVideo.includes('?') ? '&' : '?'
    $('.carousel-video-modal iframe').attr('src', `${selectedVideo}${joining}autoplay=1`)
  }

  const _pauseVideo = () => {
    $('.carousel-video-modal iframe').attr('src', `${selectedVideo}`)
  }

  $('.carousel .video a').on('click', _openVideo)
  $('.carousel-video-modal').on('shown.bs.modal', _playVideo)
  $('.carousel-video-modal').on('hide.bs.modal', _pauseVideo)
});
