$(document).on('turbolinks:load', function () {

  $("[id*=detailsBtn]").one("click", function (event) {
    event.preventDefault();
    const detailsPath = event.target.pathname;

    fetch(detailsPath)
      .then(function (resp) {
        return resp

      })
      .then(function (data) {
        const logDetails = new LogDetails(data.notes, data.tools);
        console.log(logDetails.renderDetails());
      });
  });

  $(".accordion").accordion({
    collapsible: true,
    active: false,
  });

  $("[id*=detailsBtn]").on("click", function (event) {
    event.preventDefault();
  });

})


class LogDetails {
  constructor(notes, tools) {
    this.notes = notes;
    this.tools = tools;
  }

  renderDetails() {
    console.log(`these are the deetz ${this.notes} and ${this.tools}.`)
  }
}


    // $.getJSON(detailsPath)
    //   .done(function (data) {

    //     let result = "";
    //     const id = data.id;
    //     const note = data.notes;
    //     const date_performed = data.date_performed;
    //     const date_due = data.date_due;
    //     const tools = data.tools;
    //     const cost = data.cost;
    //     const $details = $("#showDetails_" + id);

    //     result += 
    //       "<p>Performed on: " + date_performed + "</p>" + "\n" +
    //       "<p>Due on: " + date_due + "</p>" + "\n" +
    //       "<p>Notes: " + note + "</p>" + "\n" +
    //       "<p>Cost: $" + cost + "</p>" + "\n" +
    //       "<p>Tools: " + tools + "</p>" +
    //       "<hr>";

    //     $details.append(result);
    //   })
    //   .fail(function (data) {
    //     console.log("Error:");
    //     console.log(data);
    //   });