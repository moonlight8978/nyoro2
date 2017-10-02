(function () {
  $(document)
    .on('submit', '#fullSearchForm', async function (event) {
      event.preventDefault();
      
      let $loading = $('#searchLoading');
      let $results = $('#searchResults');
      $results.html('');
      $loading.show();
      
      let $category = $('#fullSearchForm select[name="category"]');
      let $input = $('#fullSearchForm input[name="q"]');
      
      let category = $category.val();
      let q = $input.val().trim();
      
      search(category, q);
      console.log(category);
      console.log(q);
    });
    
  function search(category, q) {
    let $results = $('#searchResults');
    let $loading = $('#searchLoading');
    let errorMsg = `<div class="b-box-row">エラーが起こりました。</div>`
    axios
      .get('/db/search/result', { 
        params: { 
          category: category, 
          q: q 
        },
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
})();


  
  