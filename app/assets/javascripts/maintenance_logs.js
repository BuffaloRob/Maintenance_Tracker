$(document).on('turbolinks:load', function () {

  $("[id*=detailsBtn]").one("click", function (event) {
    event.preventDefault();
    const detailsPath = event.target.pathname;
    
    $.getJSON(detailsPath)
      .done(function (data) {

        let result = "";
        const id = data.id;
        const note = data.notes;
        const date_performed = data.date_performed;
        const date_due = data.date_due;
        const tools = data.tools;
        const cost = data.cost;
        const $details = $("#showDetails_" + id);

        result += 
          "<p>Performed on: " + date_performed + "</p>" + "\n" +
          "<p>Due on: " + date_due + "</p>" + "\n" +
          "<p>Notes: " + note + "</p>" + "\n" +
          "<p>Cost: $" + cost + "</p>" + "\n" +
          "<p>Tools: " + tools + "</p>" +
          "<hr>";

        $details.append(result);
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

  $("[id*=detailsBtn]").on("click", function(event) {
    event.preventDefault();
  });

})


