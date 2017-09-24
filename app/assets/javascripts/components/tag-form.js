$(document).on('click', '.tag-result', function (event) {
  let id = $(this).data('id');
  let name = $(this).html();
  let ids = $('#tagIdsWillBeSave');
  let list = $('#tagListWillBeSave');
  
  list.append(name);
  ids.append(createInput(id));
});

function createInput(id) {
  return `<input type="hidden" name="tag_ids[]" id="tag_ids_" value="${id}" multiple="multiple">`;
}