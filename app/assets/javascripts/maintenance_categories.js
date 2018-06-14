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
          let date_performed = new Date(obj.date_performed);
          let date_due = new Date(obj.date_due);
          let tools = obj.tools;
          let $log = $("#showLog_" + id);

          result += "<p>Performed on: " + date_performed.toLocaleDateString('en-US', { timeZone: 'UTC' }) + "</p>" + "\n" +
            "<p>Due on: " + date_due.toLocaleDateString('en-US', { timeZone: 'UTC' }) + "</p>" + "\n" +
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
    let action = $(this).attr('action')
    ///maintenance_itens/:id/maintenance_logs
    let logs = $.post(`${action}.json`, values);

    logs.done(function (data) {
      console.log(data);
      let log = data;
      let date_performed = new Date(log.date_performed);
      let date_due = new Date(log.date_due);
      
      $("#logDatePerformed").text(date_performed.toLocaleDateString('en-US', { timeZone: 'UTC' }));
      $("#logDatePerformed").prepend("Performed on: ");

      $("#logDateDue").text(date_due.toLocaleDateString('en-US', { timeZone: 'UTC' }));
      $("#logDateDue").prepend("Due on: ");

      $("#logCost").text(log.cost);
      $("#logCost").prepend("Cost: $");

      $("#logNotes").text(log.notes);
      $("#logNotes").prepend("Note: ");

      $("#logTools").text(log.tools);
      $("#logTools").prepend("Tools: ");
    });
  });

})


