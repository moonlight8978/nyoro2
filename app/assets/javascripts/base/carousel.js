$(document).on('turbolinks:load', function () {
  $('.b-carousel .b-carousel-inner .slick').slick({
    arrows: false,
    swipe: false,
  });

  let $indicators = $('.b-carousel .b-carousel-indicators .slick');
  let slides = $indicators.data('slides');
  console.log(slides);

  $indicators.slick({
    arrows: false,
    vertical: true,
    slidesToScroll: 1,
    slidesToShow: slidetoShow(slides, 4),
    asNavFor: '.b-carousel .b-carousel-inner .slick',
    verticalSwiping: true,
    pauseOnHover: false,
    infinite: true,
    focusOnSelect: true,
    responsive: [{
      breakpoint: 768,
      settings: {
        slidesToShow: slidetoShow(slides, 3)
      }
    }, {
      breakpoint: 576,
      settings: {
        slidesToShow: slidetoShow(slides, 2)
      }
    }]
  });

  function slidetoShow(slides, limit) {
    return slides < limit ? slides : limit;
  }
});
