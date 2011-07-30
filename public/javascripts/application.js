$(function() {
  // save the HTML of the blank 'new player' input
  var new_player_row = '<li>' + $("#new_game li:last").html() + '</li>';
  
  // function to add a new player input
  function add_player() {
    var row = $(new_player_row);
    $("#new_game ul").append(row);    
    return row;
  }
  
  // when the user clicks the 'Add Player' button, add an input
  $("#new_game #new_player").click(add_player);
    
  // when the user hits 'tab' in the last textbox, add a new one
  $("#new_game input:text:last").live('keydown', function(e) {
    if (e.keyCode == 9 && !e.shiftKey) {
      e.preventDefault();
      add_player().find("input").focus();
    }
    return true;
  });
  
  // remove a row when the user clicks "remove"
  $("#new_game .remove").live('click', function() {
    $(this).parents("li").remove();
    return false;
  })
  
  // initially, focus the last text input
  $("#new_game input:text:last").focus();
});
