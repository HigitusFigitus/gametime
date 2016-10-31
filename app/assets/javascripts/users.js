$(document).ready(function(){
	deleteGameListener();
});

function deleteGameListener(){
	$("#fav-game-list").on("submit","#delete-game-form",function(event){
		event.preventDefault();

		var url = $(this).attr("action");
		var method = $(this).find("input[name=_method]").val();
		
		var request = $.ajax({
		 	url:url,
		 	method:method
		 });
	});
};