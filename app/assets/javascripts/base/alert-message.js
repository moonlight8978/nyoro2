function make_alert_message(type = SUCCESS, msg = "Success") {
  let html =
    `<div class="alert alert-${type} animated fadeIn" role="alert">` + 
    `${msg}` +
    `</div>`;
    
  return html;
}

function remove_after(element, time = 3000) {
  setTimeout(() => {
    element.empty();
  }, time);
}