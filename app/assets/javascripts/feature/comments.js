// $(document)
//   .on('ajax:send', '.b-more-comments', function (event, xhr) {
//     $($(this).data('loading')).addClass('show');
//   })
//   .on('ajax:complete', '.b-more-comments', function (event, xhr, status) {
//     console.log(event);
//     console.log(xhr);
//     console.log(status);
//     setTimeout(() => {
//       $($(this).data('loading')).removeClass('show');
//     }, 3000);
//   });

$(document)
  .on('click', '.b-more-comments', async function (event) {
    event.preventDefault();
    const $this = $(this);
    const url = $this.attr('href');

    if (url) {
      $this.attr('href', '');
      const $loading = $($this.data('loading'));
      const $target = $($this.data('target'));
      const $wrapper = $($this.data('wrapper'));

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
        $target.append(response.data);
        loadAllImages();
        $wrapper.remove();
      }

      function _catch(error) {
        $loading.removeClass('show');
        console.log(error);
      }

      function _finally() {
        $this.attr('href', url);
      }
    } // end if
  });

$(document)
  .on('click', '.b-delete-comment', async function (event) {
    event.preventDefault();
    let $el = $(this);
    let response = confirm('いいですか？');

    if (!response) {
      return;
    }
    try {
      let response = await destroyComment($el.attr('href'));
      $el
        .closest('#commentList .b-box-row')
        .remove();
    } catch(error) {
      console.log(error);
    }
  });

function destroyComment(url) {
  return axios
    .delete(url);
}

$(document)
  .on('click', '.b-update-comment', function (event) {
    event.preventDefault();

    let $el = $(this);
    let $body = $el
      .closest('#commentList .b-box-row')
      .find('.b-description-text');

    $body.attr('contenteditable', 'true');
    $body.focus();
  });

$(document)
  .on('focus', '#commentList .b-box-row .b-description-text', function () {
    $(this).on('keypress', async function (event) {
      if (event.which == 13 && !event.shiftKey) {
        event.preventDefault();

        let $el = $(this);
        let url = $el
          .closest('#commentList .b-box-row')
          .find('.b-update-comment')
          .attr('href');
        let body = $(this).html();

        try {
          let response = await axios.put(url, { body: body });
          $el.attr('contenteditable', 'false');
        } catch(error) {
          console.log(error);
        }
      }
    });
  })
  .on('focusout', '#commentList .b-box-row .b-description-text', function (event) {
    $(this).off('keypress');
  });
