(function () {
  let $navbar;
  let timeout;
  // Navbar animation
  $(document).on('turbolinks:load', () => {
    $navbar = $('#navbar');
    clearTimeout(timeout);
  });
  
  $(document).ready(() => {
    $navbar || ($navbar = $('#navbar'));
    window.addEventListener('scroll', scrollNav, false);
  });
  
  // Search bar animation
  $(document).on('focusin', '#searchForm', formFocusin);
  $(document).on('focusout', '#searchForm', formFocusout);
  $(document).on('click', '#sidebarSmToggle', toggleSidebarSm);
  $(document).on('click', '#sidebarSm', offSidebarSm);
  $(document).on('click', '#sidebarSmContent', stopBubbling);
  
  // Live search
  $(document).on('input', '#searchInput', liveSearch);
  
  // functions declare
  function scrollNav(event) {
    if (this.scrollY == 0) {
      $navbar.removeClass('active');
      
    } else {
      $navbar.addClass('active');
    }
  }
  
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
  
  function liveSearch(event) {
    clearTimeout(timeout);
    
    const $input = $(event.target);
    const input = $input.val().trim();
    const $cate = $($input.data('cate'));
    const cate = $cate.val();
    const $result = $($input.data('result-container'));
    
    if (cate) {
      if (input) {
        $cate.removeClass('is-invalid');
        timeout = setTimeout(() => search(cate, input, $result), 1000);
      } else {
        $result.html('');
      }
    } else {
      $cate.addClass('is-invalid');
    }
  }
  
  function search(cate, input, $result) {
    axios
      .get('/search/live', { 
        params: { 
          category: cate, 
          q: input 
        },
        headers: { 'Accept': 'text/javascript, application/javascript' },
      })
      .then(_then)
      .catch(_catch);
      
    function _then(response) {
      $result.html(response.data);
      console.log(response.data);
      loadAllImages();
    }
    
    function _catch(error) {
      console.log(error);
    }
  }
})();