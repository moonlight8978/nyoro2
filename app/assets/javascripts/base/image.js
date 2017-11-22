function checkImage(url) {
  return new Promise((resolve, reject) => {
    let img = new Image();
    img.onload = () => resolve(url);
    img.onerror = () => reject(0);
    img.src = url;
  });
}

function loadImage(element) {
  let $element = $(element);
  if (!$element.data('loaded')) {
    checkImage($element.data('backgroundImage'))
      .then((url) => {
        $element.attr('data-original', asset_path(url, true));
        // $element.css({ backgroundImage: `url('${url}')` });
      }, (e) => {
        $element.attr('data-original', asset_path('no_image_available.jpg'));
        // $element.css({ backgroundImage: 'url("/assets/no_image_available.jpg")' });
      })
      .then(() => $element.data('loaded', 1))
      .then(() => $element.lazyload({ effect : 'fadeIn' }));
  }
}

function loadAllImages() {
  $('.b-img-thumb').each(function () {
    loadImage($(this));
  });
}

$(document).on('turbolinks:load', loadAllImages);

function asset_path(resource, url = false) {
  if (!url) {
    return `/assets/${resource}`;
  } else {
    return `${resource}`;
  }
}
