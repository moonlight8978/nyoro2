// require cable

App.logs = App.cable.subscriptions.create(
  { channel: 'LogsChannel' },
  { 
    received: function (data) {
      return this.replaceSidebar(data);
    },
    replaceSidebar: function (data) {
      ($('#dbRecentActivities').length != 0) && $('#dbRecentActivities').html(data);
    }
  }
);