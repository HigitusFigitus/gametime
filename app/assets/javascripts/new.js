$(document).on('ready', () => {
  $("#new_form_link").on("click", function(e){
    e.preventDefault();
    var gameId = $("#game_id_field").val();
    $.ajax({
      url: '/games/' + gameId + '/comments/new'
    }).done(data => {
      console.log(data);
      $("#comment-form").show();
      $("#comment-form").html(data);
    })
  })
})
