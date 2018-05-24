$(document).on('turbolinks:load', function () {

  $("[id*=categoryBtn]").one("click", function(event) {
    event.preventDefault();
    let categoryPath = event.target.pathname;

    $.getJSON(categoryPath)
      .done(function(data) {
        console.log(data);
        
        for (cat of data) {
          let result = "";
          let id = cat.maintenance_item_id;
          let name = cat.name;
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

  