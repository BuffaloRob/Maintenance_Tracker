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

  //For new log form on Maintenance Category Show page
  $('form').submit(function (event) {
    event.preventDefault();
    let values = $(this).serialize();

    // I don't think 'maint_categories' is the right route to use below
    // Also, what controller and what controller action should this be going through? Currently using the maintenance_items show controller
    let logs = $.post('/maintenance_categories', values);

    logs.done(function (data) {
      console.log(data);
      let log = data;
      $("#logDatePerformed").text(post["date_performed"]);
      $("#logNotes").text(post["notes"]);
    });
  });

})


