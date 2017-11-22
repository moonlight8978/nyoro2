//= require jquery
//= require axios/dist/axios.min
//= require tether/dist/js/tether.min
//= require popper.js/dist/umd/popper.min
//= require bootstrap/dist/js/bootstrap.min
//= require jquery-lazyload/jquery.lazyload
//= require wowjs
//= require nprogress/nprogress
//= require jquery-ui/ui/widgets/datepicker
//= require chart.js/dist/Chart.bundle.min
//= require slick-carousel/slick/slick.min

//= require rails-ujs
//= require turbolinks

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

$(document).ready(() => {
  $('[data-toggle="dropdown"]').dropdown();
});

$('[data-toggle="tab"]').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});

$(document).on('turbolinks:load', () => {
  $(".datepicker").datepicker({
    dateFormat: "yy-mm-dd",
    altFormat: "yy-mm-dd",
    dayNames: [ "日", "月", "火", "水", "木", "金", "土" ],
    dayNamesMin: [ "日", "月", "火", "水", "木", "金", "土" ],
    firstDay: 1,
  });
});

// Configs
axios.defaults.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');
axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
