$(".replyBox").hide();
$(".reportBox").hide();
$(document).ready(function(){

	$(document).on("click", ".reply", function(){
		var id=$(this).attr("id");

		$("."+id).toggle();

	});

	$(document).on("click", ".report", function(){
		var id=$(this).attr("id");

		$("."+id).toggle();

	});
	
	
	//bat su kien an nut dang nhap
	$(document).on("click",".loginButton",function(){
		$.ajax({
			url: '/webtoeicproject/checklogin',
			type: 'post',
			dataType: 'html',
			data: {
				usernameLogin: $("#usernameLogin").val(),
				passwordLogin: $("#passwordLogin").val()
			},
			error: function(e) {
				console.log(e);
			}
		})
		.done(function() {
			console.log("success");
			window.location.reload();
		})
		.fail(function() {
			window.location.reload();
		});
		
	});
	
//	bat su kien an nut comment
	$(document).on("click",".commentButton",function(){
		$.ajax({
			url: '/webtoeicproject/user/discussion/comment',
			type: 'post',
			dataType: 'json',
			data: {
				discussionId: $(".dicussionTitle").attr("id"),
				commentContent: $("#commentContent").val()
			},
			error: function(e) {
				console.log(e);
			}
		})
		.done(function() {
			console.log("success");
			window.location.reload();
		})
		.fail(function() {
			console.log("error");
			window.location.reload();
		});
		
	});

});