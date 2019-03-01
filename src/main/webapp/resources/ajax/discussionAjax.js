$(document).ready(function () {
	
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
		.done(function(data) {
			if(data == "error"){
				alert("Comment error! Please again!");
			}
			window.location.reload();
		})
		.fail(function() {
			alert("Comment error!!!");
			window.location.reload();
		});
		
	});
	
	//xu ly su kien an nut xoa comment
	$(document).on("click", ".deleteOption",function(){
		$.ajax({
				url: '/webtoeicproject/user/discussion/deleteComment',
				type: 'post',
				dataType: 'json',
				data: {"commentId": $(this).attr("id")},
				error:function(e){
					console.log(e);
				}
			})
			.done(function(data) {
				if (data == "error") {
					alert("Delete error! Please again!");
				}
				if (data == "done") {
					alert("Delete done!");
				}
				window.location.reload();
			})
			.fail(function() {
				alert("Delete error! Please again!");
				window.location.reload();
			});
	
	});
	
	//khi chon nut chinh sua comment
	var editedCommentId=0;
	$(document).on("click", ".editOption",function(){
		editedCommentId=$(this).attr("id");
	});
	
	$(document).on("click", ".editButton", function(){
		$.ajax({
		url: '/webtoeicproject/user/discussion/editComment',
		type: 'post',
		dataType: 'json',
		data: {editedCommentId: editedCommentId,
				editedContent: $("#editedContent").val()
		},
		error: function(e){
			console.log(e);
		}
		})
		.done(function(data) {
			if (data == "error") {
				alert("Edit error! Please again!");
			}
			if (data == "done") {
				alert("Edit done!");
			}
			window.location.reload();
		})
		.fail(function() {
			alert("Edit error! Please again!");
			window.location.reload();
		});
	});
	
	//report comment
	var reportedCommentId=0;
	
	$(document).on("click", ".reportOption",function(){
		reportedCommentId=$(this).attr("id");
	});
	
	$(document).on("click", ".reportCommentButton", function(){
			$.ajax({
			url: '/webtoeicproject/user/discussion/reportComment',
			type: 'post',
			dataType: 'json',
			data: {reportedCommentId: reportedCommentId,
					reportedContent: $("#reportedContent").val()
			},
			error:function(e){
				console.log(e);
			}
			})
			.done(function(data) {
				if (data == "error") {
					alert("Report error! Please again!");
				}
				if (data == "done") {
					alert("Report done!");
				}
				window.location.reload();
			})
			.fail(function() {
				alert("Report error! Please again!");
				window.location.reload();
			});
	});
});