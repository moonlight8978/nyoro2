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
axios.defaults.headers.common['X-CSRF-Token'] = $('meta[name="csrf-token"]').attr('content');

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
          .get(url, { headers: { 'Accept': 'application/javascript', 'X-Requested-With': 'XMLHttpRequest', } })
          .then((response) => {
            console.log(response);
            $target.append(response.data);
            loadAllImages();
            $wrapper.remove();
          })
          .catch(error => {
            $loading.removeClass('show');
            console.log(error)
          })
          .then(() => $this.attr('href', url));
      }, 3000);
    }
  })