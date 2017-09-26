$(document).on('click', '.tag-result', function (event) {
  let id = $(this).data('id');
  let name = $(this).data('name');
  let ids = $('#tagIdsWillBeSave');
  let list = $('#tagListWillBeSave');
  
  list.append(createTag(name));
  ids.append(createInput(id));
});

function createTag(name) {
  return `<div class="b-tag-item animated fadeIn mb-2">
            <div class="b-tag b-tag-blue">${name}</div>
          </div>`;
}

function createInput(id) {
  return `<input type="hidden" name="tag_ids[]" id="tag_ids_" value="${id}" multiple="multiple">`;
}