$(document).on('turbolinks:load', function() {

  $("[id*=logBtn]").on("click", function (event) {
    event.preventDefault();
    let logPath = event.target.pathname;

  $.getJSON(logPath)
    .done(function(data) {
      let result = "";
      let id = data[0].id;
      let note = data[0].notes;
      let tools = data[0].tools;
      let log = $("div[id='"showLog_"" + id + "]");

      result += "<p>" + tools + "</p>";

      log.find("h3").after(result);
      
      console.log(data);
    })
    .fail(function(data) {
      console.log("Error:");
      console.log(data);
    });
  });

})
  