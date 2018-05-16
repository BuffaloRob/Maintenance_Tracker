$(document).on('turbolinks:load', function() {

  $("[id*=logBtn]").on("click", function (event) {
    event.preventDefault();
    let logPath = event.target.pathname;

  $.getJSON(logPath)
    .done(function(data) {
      let result = "";
      let id = data[0].maintenance_category_id;
      let note = data[0].notes;
      let date_performed = data[0].date_performed;
      let date_due = data[0].date_due;
      let tools = data[0].tools;
      let log = $("#showLog_" + id);

      result += "<p>Performed on: " + date_performed + "</p>" + "\n" + 
      "<p>Due on: " + date_due + "</p>" + "\n" +
      "<p>Notes: " + note + "</p>";

      log.append(result);

      console.log(data);
    })
    .fail(function(data) {
      console.log("Error:");
      console.log(data);
    });
  });

})
  