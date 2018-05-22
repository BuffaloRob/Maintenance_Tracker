$(document).on('turbolinks:load', function () {

  $("[id*=categoryBtn]").one("click", function(event) {
    event.preventDefault();
    let categoryPath = event.target.pathname;

    $.getJSON(categoryPath)
      .done(function(data) {
        console.log(data);

        for (obj of data) {
          let result = "";
          let id = obj.id;
          let name = obj.name;
          let $category = $("#showCategory_" + id);

          result += "<p>" + name + "</p>" + "<hr>";

          $category.append(result);
        }
      })
      .fail(function(data) {
        console.log("Error:");
        console.log(data);
      });
  });

  $(".accordion").accordion({
    collapsible: true,
    active: false,
  });

  $("[id*=categoryBtn]").on("click", function(event) {
    event.preventDefault();
  });

})


  