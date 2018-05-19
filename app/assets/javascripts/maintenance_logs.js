$(document).on('turbolinks:load', function () {

  $("[id*=detailsBtn]").one("click", function (event) {
    event.preventDefault();
    let logPath = event.target.pathname;

    $.getJSON(logPath)
      .done(function (data) {
        console.log(data)

        let result = "";
        let id = data.maintenance_category_id;
        let note = data.notes;
        let date_performed = data.date_performed;
        let date_due = data.date_due;
        let tools = data.tools;
        let cost = data.cost;
        let $log = $("#showDetails_" + id);

        result += 
          "<p>Performed on: " + date_performed + "</p>" + "\n" +
          "<p>Due on: " + date_due + "</p>" + "\n" +
          "<p>Notes: " + note + "</p>" + "\n" +
          "<p>Cost: $" + cost + "</p>" + "\n" +
          "<p>Tools: " + tools + "</p>" +
          "<hr>";

        $log.append(result)
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


