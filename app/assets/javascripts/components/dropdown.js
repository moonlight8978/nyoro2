$(document).ready(() => {
  $(document).on('click', '.dropdown-off-autoclose', (event) => {
    event.stopPropagation();
  });
  $(document).on('click', '.no-propagation', (event) => {
    event.stopPropagation();
  });
});