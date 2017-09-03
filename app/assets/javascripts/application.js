// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether/dist/js/tether.min
//= require popper.js/dist/umd/popper.min
//= require bootstrap/dist/js/bootstrap.min
//= require jquery-lazyload/jquery.lazyload
//= require wowjs
//= require nprogress/nprogress

//= require rails-ujs
//= require turbolinks
//= require_self
//= require_tree .
var $loading;

(function () {
  const wow = new WOW({
    offset: 100
  });
  
  $(document).on('turbolinks:load', () => {
    wow.init();
    $(".lazy").lazyload({
      effect : 'fadeIn'
    });
    console.log('turbolinks')
    
    $loading = $('.loading');
    
    $(document)
      .on('ajax:send', '.pagination a', (event, xhr) => {
        NProgress.start();
        console.log('send');
      })
      .on('ajax:complete', '.pagination a', (event, xhr, status) => {
        console.log('complete');
      });
  });
  
  $(document).ready(function () {
    $(document).on('click', '.loz-link', () => console.log('loz'));
  });
})();
