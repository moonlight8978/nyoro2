(function () {
  $(document)
    .on('submit', '.b-remote-form', function (event) {
      event.preventDefault();

      let $this = $(this);
      let $btn = $this.find('button[type="submit"]');
      let $error = $this.find('.b-remote-form-error');

      let txt = $btn.html();
      $error.empty();
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
        location.reload();
      }

      function _catch(error) {
        console.log(error);

        if (error.response) {
          $error.html(error.response.data);
        }
      }

      function _finally() {
        $btn.removeClass("b-btn-disabled");
        $btn.html(txt);
        $btn.attr('disabled', false);
      }
    });

  $(document)
    .on('input', '.b-form-control-range', function (event) {
      let $this = $(this);
      let $displayAt = $($this.data('display-at'));
      $displayAt.text($this.val());
    });
})();
