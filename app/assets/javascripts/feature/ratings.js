$(document)
    .on('change', '.b-feature-rate input', async function (event) {
        let $form = $(this.form);
        $form.addClass('active');
        let star = parseInt($(this).val()) || '-';
        setTimeout(async () => {
            try {
                let response = await submitRating($form.attr('action'), $form.serialize());
                $('#userRatedStar').html(response.data.user);
                $('#avgRatedStar').html(response.data.avg);
            } catch (error) {
                // $("input[name='feature_rate[star]'][value='5']").attr('checked', 'checked');
            } finally {
                $form.removeClass('active');
                $('#rateForm').dropdown('toggle');
            }
        }, 3000);
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