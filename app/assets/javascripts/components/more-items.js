$(document)
  .on('click', '.b-more-items', async function (event) {
    event.preventDefault();
    const $el = $(this);
    const url = $el.attr('href');

    if (url) {
      $el.attr('href', '');
      const $wrapper = $el.closest('.b-more-items-wrapper');
      const $loading = $el.closest('.b-more-items-wrapper').find('.b-loading');
      const $appendTo = $($el.data('append-to'));

      $loading.addClass('show');

      await setTimeout(function () {
        axios
          .get(url, {
            headers: { 'Accept': 'application/javascript' }
          })
          .then(_then)
          .catch(_catch)
          .then(_finally);
      }, 3000);

      function _then(response) {
        console.log(response);
        $appendTo.append(response.data);
        loadAllImages();
        $wrapper.remove();
      }

      function _catch(error) {
        $loading.removeClass('show');
        console.log(error);
      }

      function _finally() {
        $el.attr('href', url);
      }
    } // end if
  });
