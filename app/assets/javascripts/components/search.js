(function () {
  $(document)
    .on('submit', '#fullSearchForm', async function (event) {
      event.preventDefault();
      
      let category = $('#fullSearchForm select[name="category"]').val();
      let q = $('#fullSearchForm input[name="q"]').val().trim();
      
      pushState(`${$(this).attr('action')}?${$(this).serialize()}`);
      search('/db/search', { category: category, q: q });
    });
    
  $(document)
    .on('click', '#searchResults .pagination a', async function (event) {
      event.preventDefault();
      pushState(this.href);
      search(this.href);
    });
  
  // need to fix soon if multiple ajax are used
  $(window).on('popstate', function (event) {
    console.log(event);
    search(window.location.href);
  });
    
  function search(url, params = {}) {
    let $loading = $('#searchLoading');
    let $results = $('#searchResults');
    let errorMsg = `<div class="b-box-row">エラーが起こりました。</div>`;
    
    $results.html('');
    $loading.show();
    
    axios
      .get(url, { 
        params: params,
        headers: { 'Accept': 'text/javascript, application/javascript' },
      })
      .then(_then)
      .catch(_catch);
      
    function _then(response) {
      setTimeout(() => {
        $loading.hide();
        $results.html(response.data);
        console.log(response.data);
      }, 3000);
    }
    
    function _catch(error) {
      setTimeout(function () {
        $loading.hide();
        $results.html(errorMsg);
        console.log(error);
      }, 3000);
    }
  }
  
  function pushState(href) {
    window.history.pushState(null, '', href);
  }
})();


  
  