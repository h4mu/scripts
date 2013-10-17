function addDijnetReminders() {
  var now = new Date().getTime();
  var label = GmailApp.getUserLabelByName('UjSzamla');
  var threads = label.getThreads();
  for (var i = 0; i < threads.length; i++) {
    var message = threads[i].getMessages()[0];
    if (message) {
      var plain = message.getPlainBody();
      var matchedSum = plain.match(/Összeg :\s*(\d+ Ft)/);
      if ('Díjnet számla érkezett' === message.getSubject() && message.getDate() <= now && matchedSum) {
        var title = 'Dijnet ' + plain.match(/Számlakibocsátó : ([^\n]+)/)[1];
        var dateArray = plain.match(/Fizetési határidő : (\d{4})\.(\d{2})\.(\d{2})\./);
        var dueDate = new Date(dateArray[1], dateArray[2], dateArray[3]);
        var description = matchedSum[1];
        Logger.log(title + dueDate);
        CalendarApp.createAllDayEvent(title, dueDate).setDescription(description).addPopupReminder(360).addSmsReminder(360);
      }
    }
  }
  label.removeFromThreads(threads);
}
