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
  })