(function () {
  $(document)
    .on('submit', '#fullSearchForm', async function (event) {
      event.preventDefault();
      
      let category = $('#fullSearchForm select[name="category"]').val();
      let q = $('#fullSearchForm input[name="q"]').val().trim();
      let title_ja = `「${q} (${category})」の検索結果`;
      let title_en = `Search results for '${q} (${category})'`;
      let formUrl = `${$(this).attr('action')}?${$(this).serialize()}`;
      
      pushState(formUrl, title_ja, title_en);
      search('/db/search', { category: category, q: q });
    });
    
  $(document)
    .on('click', '#searchResults .pagination a', async function (event) {
      event.preventDefault();
      
      let category = $('#fullSearchForm select[name="category"]').val();
      let q = $('#fullSearchForm input[name="q"]').val().trim();
      let title_ja = `「${q} (${category})」の検索結果・ページ ${$(this).data('page')}`;
      let title_en = `Search results for '${q} (${category})' - Page ${$(this).data('page')}`;
      
      pushState(this.href, title_ja, title_en);
      search(this.href);
    });
  
  window.addEventListener('popstate', function (event) {
    if (event.state === null) {
      window.location = window.location.href;
    }
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
  
  function pushState(href, title_ja = '', title_en = '') {
    document.title = titleize(title_ja);
    $('.b-big-title').html(title_ja);
    $('.b-small-title').html(title_en);
    window.history.pushState(null, titleize(title_ja), href);
  }
})();


  
  