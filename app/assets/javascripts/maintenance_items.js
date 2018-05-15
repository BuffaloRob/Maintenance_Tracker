$(document).on('turbolinks:load', function() {

  $("[id*=logBtn]").on("click", function (event) {
    event.preventDefault();
    let logPath = event.target.pathname;

  $.getJSON(logPath)
    .done(function(data) {
      console.log(data);
    })
    .fail(function(data) {
      console.log("Error:");
      console.log(data);
    });
  });

})

//test comment
  