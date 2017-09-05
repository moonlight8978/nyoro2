(function () {
  function checkImage(url) {
    return new Promise((resolve, reject) => {
      let img = new Image();
      img.onload = () => resolve(url);
      img.onerror = () => reject(0);
      img.src = url;
    });
  }
  
  function loadImage(element) {
    checkImage(element.data('backgroundImage'))
    .then((url) => {
      console.log('yes');
      element.css({ backgroundImage: `url('${url}')` });
    }, (e) => {
      console.log(e);
      console.log('tach cmnr');
      element.css({ backgroundImage: 'url("/assets/no_image_available.jpg")' });
    });
  }
  
  $(document).on('ready turbolinks:load', function () {
    $('.b-img-thumb').each(function () {
      loadImage($(this));
    });
  });
})();
