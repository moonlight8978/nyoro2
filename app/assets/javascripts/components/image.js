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
                element.css({ backgroundImage: `url('${url}')` });
            }).catch((e) => {
                element.css({ backgroundImage: 'url("placeholder.jpg")' });
            });
    }
    
    $(document).on('ready turbolinks:load', function () {
		$('.b-img-thumb').each(function () {
			console.log($(this));
			loadImage($(this));
		});
	});
})();
