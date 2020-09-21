let selectedPlayerOne, selectedPlayerTwo

function showWinnerAndLoserFields() {
  var elements = $(".hidden-fields" )
  elements.removeClass("hidden-fields")
  $("#match_winner_id").prop('disabled', false)
}

function hideWinnerAndLoserFields() {
  var elements = $("#outcome-members").children()
  elements.addClass("hidden-fields")
  $("#match_winner_id").prop('disabled', false)
}

function updateWinnerSelectOption() {
  if (selectedPlayerOne && selectedPlayerTwo) {
    $("#match_winner_id").html("").append(selectedPlayerOne.clone()).append(selectedPlayerTwo.clone())
  }
}

$(document).on('turbolinks:load', function() {
  var reloadSelectedOutcome = $("#match_outcome").children("option:selected").val()
  if (reloadSelectedOutcome == "win") {
    showWinnerAndLoserFields()
  }

  $("#match_player_one_id").on("change", function() {
    selectedPlayerOne = $(this).children("option:selected")
    updateWinnerSelectOption()
  })

  $("#match_player_two_id").on("change", function() {
    selectedPlayerTwo = $(this).children("option:selected")
    updateWinnerSelectOption()
  })

  $("#outcome").on("change", "select", function() {
    let selectedOutcome = $(this).children("option:selected").val()
    if (selectedOutcome == "win") {
      showWinnerAndLoserFields()
      updateWinnerSelectOption()
    } else {
      hideWinnerAndLoserFields()
    }
  })
})
