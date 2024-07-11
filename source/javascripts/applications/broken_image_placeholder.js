(function() {
  var ApplicationBrokenImagePlaceholder = {
    init: function init(images, placeholderImage) {
      this.images = [].slice.call(images);
      this.placeholderImage = placeholderImage.innerHTML;

      this.bindEvents();
    },

    bindEvents: function bindEvents() {
      this.images.forEach(this.bindEvent.bind(this));
    },

    bindEvent: function(image) {
      image.src = image.dataset.src;
      image.addEventListener('error', this.applyPlaceholder.bind(this));
    },

    applyPlaceholder: function applyPlaceholder(e) {
      e.target.outerHTML = this.placeholderImage;
    }
  };

  ApplicationBrokenImagePlaceholder.init(
    document.querySelectorAll('.category-applications .application img'),
    document.getElementById('js-placeholder-image')
  );
}).call(this);
