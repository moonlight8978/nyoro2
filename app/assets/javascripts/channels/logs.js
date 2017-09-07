// require cable
(function () {
  App.logs = App.cable.subscriptions.create('LogsChannel', { 
    connected: connected,
    received: received,
    installedPageChangeCallback: false,
  });
  
  function sidebar() {
    return $('#dbRecentActivities');
  }
  
  function connected() {
    decideAction();
    App.logs.installedPageChangeCallback || pageChange();
  }
  
  function received(data) {
    console.log(data);
    return replaceSidebar(data);
  }
  
  function replaceSidebar(data) {
    sidebar().html(data);
  }
  
  function pageChange() {
    App.logs.installedPageChangeCallback = true;
    $(document).on('turbolinks:load', () => {
      decideAction();
    });
  }
  
  function decideAction() {
    if (sidebar().length) {
      App.logs.perform('follow');
    } else {
      App.logs.perform('unfollow');
    }
  }
})();
