$('.video-slider').slick({
  dots: false,
  centerMode: false,
  infinite: true,
  speed: 300,
  slidesToShow: 3,
  slidesToScroll: 3,
  arrows: true,
  nextArrow: '<div class="slick-arrow-next"><i class="fas fa-chevron-right"></i></div>',
  prevArrow: '<div class="slick-arrow-prev"><i class="fas fa-chevron-left"></i></div>',
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1.25,
        slidesToScroll: 1.5,
        arrows: false,
        centerMode: true,
        infinite: false,
        centerPadding: 0
      }
    }
  ]
});  



$('.single-video-slider').slick({
  dots: false,
  centerMode: false,
  infinite: true,
  speed: 300,
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: true,
  nextArrow: '<div class="slick-arrow-next"><i class="fas fa-arrow-right"></i></div>',
  prevArrow: '<div class="slick-arrow-prev"><i class="fas fa-arrow-left"></i></div>',
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});  

$('#videoCarouselModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) ;
  var videoUrl = button.data('video-link');
  var videoImage = button.data('video-image');
  var modal = $(this);
  modal.find('.modal-title').text(videoUrl);
  modal.find('.share-text').text(videoUrl);
  modal.find('.carousel-modal-iframe').attr('srcdoc', '<style>*{padding:0;margin:0;overflow:hidden}html,body{height:100%}img,span{position:absolute;width:100%;top:0;bottom:0;margin:auto}span{height:1.5em;text-align:center;font:48px/1.5 sans-serif;color:white;text-shadow:0 0 0.5em black}</style><a href=' + videoUrl + '?autoplay=1><img src=' + videoImage + '><span>▶</span></a>');
  modal.find('.carousel-modal-iframe').attr("src", videoUrl);
});

$('.btn-close-modal').click(function(e) {
  e.preventDefault();
  $('.carousel-modal-iframe').attr('src', '');
  $('.carousel-modal-iframe').attr('srcdoc', '');
});

$('.modal').click(function(e) {
  $('.carousel-modal-iframe').attr('src', '');
  $('.carousel-modal-iframe').attr('srcdoc', '');
});
