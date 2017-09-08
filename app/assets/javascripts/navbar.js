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
  
  $(document).on('focusin', '#searchForm', formFocusin);
  $(document).on('focusout', '#searchForm', formFocusout)
  
  function formFocusin() {
    $('.-main .nav-item').each(function () {
      $(this).addClass('invisible');
    });
    $(this).addClass('active');
    $('#searchCate').fadeIn(500);
  }
  
  function formFocusout() {
    $(window).on('click', checkTarget);
  }
  
  function checkTarget(event) {
    $(window).off('click', checkTarget);
    const searchForm = $('#searchForm');
    console.log('check');
    console.log(event.target)
    let trigger = $(event.target).closest('#searchForm');
    // console.log(trigger);
    if (trigger[0] != searchForm[0]) {
      $('#searchCate').fadeOut(500);
      searchForm.removeClass('active');
      $('.-main .nav-item').each(function () {
        $(this).removeClass('invisible');
      });
    }
  }
})();