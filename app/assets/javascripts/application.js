//= require libs
//= require_tree ./config
//= require_self
//= require_tree ./base
//= require_tree ./components
//= require_tree ./specific

var $loading;

(function () {
  const wow = new WOW({
    offset: 150
  });

  $(document).on('turbolinks:load', () => {
    wow.init();
    // $(".lazy").lazyload({
    //   effect : 'fadeIn'
    // });
    console.log('turbolinks')

    $loading = $('.loading');

    $(document)
      .on('ajax:send', '[data-remote="true"]', (event, xhr) => {
        NProgress.start();
        console.log('send');
      })
      .on('ajax:complete', '[data-remote="true"]', (event, xhr, status) => {
        NProgress.inc();
        NProgress.done();
        console.log('complete');
      });
  });
})();
function titleize(title) {
  return `${title} / にょろにょろ！`
}
