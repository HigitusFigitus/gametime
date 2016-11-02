$(document).on('turbolinks:load',function(){
  voteGameListener();
});

function voteGameListener(){
  $(".game-des-container").on("ajax:success",".vote-form",function(e,data,status,xhr){
    console.log(data)
    // $(".list-border").text("Upvoted"+)
    $(".game-vote-form").empty().append(data);
  });
};
