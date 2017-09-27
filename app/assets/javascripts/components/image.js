function checkImage(url) {
  return new Promise((resolve, reject) => {
    let img = new Image();
    img.onload = () => resolve(url);
    img.onerror = () => reject(0);
    img.src = url;
  });
}

function loadImage(element) {
  if (!element.data('loaded')) {
    checkImage(element.data('backgroundImage'))
      .then((url) => {
        element.css({ backgroundImage: `url('${url}')` });
      }, (e) => {
        element.css({ backgroundImage: 'url("/assets/no_image_available.jpg")' });
      })
      .then(() => element.data('loaded', 1));
  }
}

function loadAllImages() {
  $('.b-img-thumb').each(function () {
    loadImage($(this));
  });
}

$(document).on('turbolinks:load', loadAllImages);
