(function () {
  let $navbar;
  
  function scrollNav(event) {
    if (this.scrollY == 0) {
      $navbar.removeClass('active');
      
    } else {
      $navbar.addClass('active');
    }
  }
  
  $(document).on('turbolinks:load', () => {
    $navbar = $('#navbar');
  });
  
  $(document).ready(() => {
    $navbar || ($navbar = $('#navbar'));
    window.addEventListener('scroll', scrollNav, false);
  });
  
  $(document).on('focusin', '#searchForm', formFocusin);
  $(document).on('focusout', '#searchForm', formFocusout);
  $(document).on('click', '#sidebarSmToggle', toggleSidebarSm);
  $(document).on('click', '#sidebarSm', offSidebarSm);
  $(document).on('click', '#sidebarSmContent', stopBubbling);
  
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
    let trigger = $(event.target).closest(searchForm);
    if (trigger[0] != searchForm[0]) {
      $('#searchCate').fadeOut(500);
      searchForm.removeClass('active');
      $('.-main .nav-item').each(function () {
        $(this).removeClass('invisible');
      });
    }
  }
  
  function toggleSidebarSm(event) {
    const $sidebar = $('#sidebarSm');
    $sidebar.fadeIn(500);
    $sidebar.addClass('active');
    
  }
  
  function offSidebarSm(event) {
    $(this).removeClass('active');
    $(this).fadeOut(500);
  }
  
  function stopBubbling(event) {
    event.stopPropagation();
  }
})();