(function () {
  let $navbar;
  
  function scrollNav() {
    window.addEventListener('scroll', function (event) {
      if (window.scrollY == 0) {
        $navbar.removeClass('active');
        
      } else {
        $navbar.addClass('active');
      }
    });
  }
  
  $(document).on('turbolinks:load', () => {
    $navbar = $('#navbar');
  });
  
  $(document).ready(() => {
    if (!$navbar) {
      $navbar = $('#navbar');
    }
    scrollNav();
  });
})();