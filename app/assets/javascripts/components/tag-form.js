$(document).on('click', '.tag-result', function (event) {
  let id = $(this).data('id');
  let name = $(this).html();
  let ids = $('#tagIdsWillBeSave');
  let list = $('#tagListWillBeSave');
  
  list.append(createTag(name));
  ids.append(createInput(id));
});

function createTag(name) {
  return `<div class="b-tag b-tag-blue animated fadeIn mb-2">${name}</div>`;
}

function createInput(id) {
  return `<input type="hidden" name="tag_ids[]" id="tag_ids_" value="${id}" multiple="multiple">`;
}