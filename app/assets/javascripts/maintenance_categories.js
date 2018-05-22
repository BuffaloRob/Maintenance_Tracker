$(document).on('turbolinks:load', function () {

  $("[id*=logBtn]").one("click", function (event) {
    event.preventDefault();
    let logPath = event.target.pathname;

    $.getJSON(logPath)
      .done(function (data) {

        for (obj of data) {
          let result = "";
          let id = obj.maintenance_category_id;
          let note = obj.notes;
          let date_performed = obj.date_performed;
          let date_due = obj.date_due;
          let tools = obj.tools;
          let $log = $("#showLog_" + id);

          result += "<p>Performed on: " + date_performed + "</p>" + "\n" +
            "<p>Due on: " + date_due + "</p>" + "\n" +
            "<p>Notes: " + note + "</p>" +
            "<hr>";

          $log.append(result);
        }
      })
      .fail(function (data) {
        console.log("Error:");
        console.log(data);
      });
  });

  $(".accordion").accordion({
    collapsible: true,
    active: false,
  });

  $("[id*=logBtn]").on("click", function (event) {
    event.preventDefault();
  })

})


