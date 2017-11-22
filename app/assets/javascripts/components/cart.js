(function () {
  $(document)
    .on('submit', '.b-add-to-card-form', function (event) {
      event.preventDefault();
      
      let $this = $(this);
      let $btn = $this.find('[type="submit"]');

      let txt = $btn.html();
      $btn.addClass("b-btn-disabled");
      $btn.attr('disabled', true);
      $btn.html($btn.attr('data-disable-html'));

      let url = $this.attr('action');
      let data = new FormData(this);

      setTimeout(function () {
        axios
          .post(url, data, {
            headers: { 'Accept': 'text/javascript, application/javascript' },
          })
          .then(_then)
          .catch(_catch)
          .then(_finally);
      }, 3000);

      function _then(response) {
        $(".b-cart-total-products").text(response.data);
        $(".b-add-to-cart-message")
          .html(make_alert_message(SUCCESS, "Product has been added."));
      }

      function _catch(error) {
        $(".b-add-to-cart-message")
          .html(make_alert_message(DANGER, "Product has not been added."));
      }

      function _finally() {
        remove_after($(".b-add-to-cart-message"));
        $btn.removeClass("b-btn-disabled");
        $btn.html(txt);
        $btn.attr('disabled', false);
      }
    });

  $(document).on("turbolinks:load", function (event) {
    
  });
})();