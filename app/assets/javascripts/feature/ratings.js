$(document)
    .on('change', '.b-feature-rate input', async function (event) {
        let star = parseInt($(this).val()) || '-';
        console.log(star);
        try {
            await submitRating($(this.form).attr('action'), $(this.form).serialize());
            $('#userRatedStar').html(star);
        } catch (error) {
            // $("input[name='feature_rate[star]'][value='5']").attr('checked', 'checked');
        }
    });
    
function submitRating(url, data) {
    return axios({
        method: 'post',
        url: url,
        data: data,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
    });
}