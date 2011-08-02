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
  
  // hover over player names
  $("ul#players.fancy li").hover(function() {
    $(this).addClass("hover");
  }, function() {
    $(this).removeClass("hover");
  }).click(function() {
    $(this).toggleClass("selected");
  }).dblclick(function() {
    var leader = $("#leader");
    leader.css("display", "block");
    leader.remove();
    $(this).append(leader);
    $(".leader").removeClass("leader");
    $(this).addClass("leader");
    return false;
  });
  
  var max_color_strength = 150;
  
  $("ul#players.fancy .player_name.spy").each(function() {
    var strength = parseFloat($(this).attr("data-strength"));
    var off = 255 - max_color_strength * strength;
    var rgb = "rgb(255," + off + "," + off + ")";
    $(this).css("background", rgb);
  });

  $("ul#players.fancy .player_name.agent").each(function() {
    var strength = parseFloat($(this).attr("data-strength"));
    var off = 255 - max_color_strength * strength;
    var rgb = "rgb(" + off + "," + off + ", 255)";
    $(this).css("background", rgb);
  });
});
