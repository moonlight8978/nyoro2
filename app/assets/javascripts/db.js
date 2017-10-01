// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', (event) => {
  $('.slick').slick({
    infinite: false,
    slidesToShow: 4.25,
    slidesToScroll: 2,
    arrows: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 3.25,
          slidesToScroll: 1,
        }
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow: 2.25,
          slidesToScroll: 1,
        }
      }
    ]
  });
});