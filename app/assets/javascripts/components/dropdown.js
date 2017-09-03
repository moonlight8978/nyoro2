$(document).ready(() => {
  $(document).on('click', '.dropdown-off-autoclose', (event) => {
    event.stopPropagation();
  });
});