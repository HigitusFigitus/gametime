$(document).on('turbolinks:load',function(){
	deleteGameListener();
	deleteFriendListener();
});

function deleteGameListener(){
	$(".fav-game-list").on("ajax:success", ".delete-game-form", function(e,data,status,xhr){
		$("#game-" + data).remove();
	});
};

function deleteFriendListener(){
	$(".friendship-list").on("ajax:success", ".delete-friend-form", function(e,data,status,xhr){
		$("#friend-" + data).remove();
	});
};

