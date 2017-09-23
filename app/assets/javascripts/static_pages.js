// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(() => {
  let counted = false;
  let offset;
  let container = $('#counterContainer');
  let triggered = container.length;
  
  $(window).scroll((event) => {
    if (triggered) {
      offset = container.offset().top - window.innerHeight / 2;
      if (!counted && $(window).scrollTop() > offset) {
        counting();
      }
    }
  });
  
  $(document).on('turbolinks:load', () => {
    counted = false;
    container = $('#counterContainer');
    triggered = container.length;
  });
  
  function counting() {
    $('.counter').each(function() {
      let $this = $(this);
      let countFrom = $this.attr('data-min');
      let countTo = $this.attr('data-max');
      $({countNum: $this.text()}).animate(
        { countNum: countTo },
        {
          duration: 3000 / 500 * countTo,
          easing: 'swing',
          step: function() {
            $this.text(Math.floor(this.countNum));
          },
          complete: function() {
            $this.text(this.countNum);
            //alert('finished');
          }
        }
      );
    });
    counted = true;
  }
})
