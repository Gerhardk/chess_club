function showWinnerAndLoserFields() {
  var elements = $(".hidden-fields" )
  elements.removeClass("hidden-fields")
}

function hideWinnerAndLoserFields() {
  var elements = $("#outcome-members").children()
  elements.addClass("hidden-fields")
}

$(document).on('turbolinks:load', function() {
  var reloadSelectedOutcome = $("#match_outcome").children("option:selected").val()
  if (reloadSelectedOutcome == "win") {
    showWinnerAndLoserFields()
  }

  $("#match_player_one_id").on("change", "select", function() {
    var selectedPlayerOne = $(this).children("option:selected").val()
    alert(selectedPlayerOne);
  })

  $("#match_player_two_id").on("change", "select", function() {
    var selectedPlayerTwo = $(this).children("option:selected").val()
    alert(selectedPlayerTwo);
  })  


  $("#outcome").on("change", "select", function() {
    var selectedOutcome = $(this).children("option:selected").val()
    alert(selectedOutcome)
    if (selectedOutcome == "win") {
      showWinnerAndLoserFields()
    } else {
      hideWinnerAndLoserFields()
    }
  })
})
