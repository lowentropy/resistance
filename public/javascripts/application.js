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
  
  // toggle whether player is on the team
  }).click(function() {
    $(this).toggleClass("selected");
  
  // select the player as the leader
  }).dblclick(function() {
    var leader = $("#leader");
    leader.css("display", "block");
    leader.remove();
    $(this).append(leader);
    $(".leader").removeClass("leader");
    $(this).addClass("leader");
    return false;
  });
  
  // find out who the leader and the team are
  function get_settings(passed) {
    var settings = {team: [], passed: passed};
    $("ul#players.fancy li.selected").each(function() {
      settings.team.push($(this).attr("data-id"));
    })
    settings.leader = $("ul#players.fancy li.leader").attr("data-id");
    return settings;
  }
  
  var max_color_strength = 150;
  
  // make spy backgrounds deeper red the more shady they are
  $("ul#players.fancy .player_name.spy").each(function() {
    var strength = parseFloat($(this).attr("data-strength"));
    var off = 255 - max_color_strength * strength;
    var rgb = "rgb(255," + off + "," + off + ")";
    $(this).css("background", rgb);
  });

  // make agent backgrounds deeper blue the less shady they are
  $("ul#players.fancy .player_name.agent").each(function() {
    var strength = parseFloat($(this).attr("data-strength"));
    var off = 255 - max_color_strength * strength;
    var rgb = "rgb(" + off + "," + off + ", 255)";
    $(this).css("background", rgb);
  });
  
  // the mission succeeds
  $("#mission .pass").click(function() {
    var form = get_settings(true);
    alert("You passed the mission: " + JSON.stringify(form));
  });
  
  // the mission fails
  $("#mission .fail").click(function() {
    var form = get_settings(false);
    alert("You failed the mission: " + JSON.stringify(form));
  });
});
