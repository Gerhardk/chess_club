// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap")

$(document).on('turbolinks:load', function(){
  $("#outcome").on("change", "select", function() {
    var selectedOutcome = $(this).children("option:selected").val()
    if (selectedOutcome == "win") {
      showWinnerAndLoserFields();
    } else {
      hideWinnerAndLoserFields();
    }
  })
})

function showWinnerAndLoserFields() {
  var elements = $(".hidden-fields" );
  elements.removeClass("hidden-fields");
}; 

function hideWinnerAndLoserFields() {
  var elements = $("#outcome-members").children();
  elements.addClass("hidden-fields");
}

