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
			}else if(data == "done"){
				alert("Comment done!");
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
		if(confirm("Do you want to delete your comment?")){
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
		}
		
	});
	
	//khi chon nut chinh sua comment
	var editedCommentId=0;
	$(document).on("click", ".editOption",function(){
		editedCommentId=$(this).attr("id");
	});
	var editedReplyId=0;
	$(document).on("click", ".editReply",function(){
		editedReplyId=$(this).attr("id");
	});
	
	$(document).on("click", ".editReplyButton", function(){
		$.ajax({
			url: '/webtoeicproject/user/discussion/editReply',
			type: 'post',
			dataType: 'json',
			data: {
				editedReplyId: editedCommentId,
				editedReplyContent: $("#editedReplyContent").val()
			},
			error: function(e){
				console.log(e);
			}
		})
		.done(function(data) {
			console.log(data);
			if (data == "error") {
				alert("Edit error! Please again!");
			}
			if (data == "done") {
				alert("Edit done!");
			}
			window.location.reload();
		})
		.fail(function() {
			console.log("fail");
			alert("Edit error! Please again!");
			window.location.reload();
		});
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
		$(".reportCommentButton").attr("id","reportComment");
	});
	
	//report reply
	var reportedReplyId=0;
	
	$(document).on("click", ".reportReplyOption",function(){
		reportedReplyId=$(this).attr("id");
		$(".reportCommentButton").attr("id","reportReplyComment");
	});
	
	$(document).on("click", ".reportCommentButton", function(){
		if($(this).attr("id") == "reportReplyComment"){
			reportReply();
		}else if($(this).attr("id") == "reportComment"){
			reportComment();
		}
			
	});
	
	function reportReply(){
		$.ajax({
			url: '/webtoeicproject/user/discussion/reportReplyComment',
			type: 'post',
			dataType: 'json',
			data: {reportedReplyId: reportedReplyId,
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
	}
	
	function reportComment(){
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
	}
	
	
	$(document).on("click", ".reportDiscussionButton", function(){
		$.ajax({
			url: '/webtoeicproject/user/discussion/reportDiscussion',
			type: 'post',
			dataType: 'json',
			data: {
				reportedDiscussionId: $(this).attr("id"),
				reportedDiscussionContent: $("#reportedDiscussionContent").val()
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
	
	//read more reply
	$(document).on("click", ".readmoreReply",function(){
		var page=1;
		var commentId =$(this).attr("id");
		var pageSize =10;
		$(this).hide();
		loadReply(page,commentId,pageSize);
		$(".listReply"+$(this).attr("id")).show();
		$(".lessReply"+commentId).show();
	});
	$(document).on("click", ".readLessReply",function(){
		$(this).hide();
		$(".readmoreReply").show();
		$(".listReply"+$(this).attr("id")).empty();
	});
	
	
	
	$(document).on("click", ".moreReply",function(){
		var page=$(this).attr("id");
		page++;
		var commentId =$(this).attr("id");
		var pageSize =10;
		var data =loadReply(page,commentId,pageSize);
		if(data == null){
			$(this).hide();
		}
	});
	
	
	
	function loadReply(page,commentId,pageSize){
		$.ajax({
			url: '../../getReplyComment',
			type: 'POST',
			dataType: 'json',
			data: {
				page : page,
				id 	 : commentId,
				pageSize: pageSize
			},
			error: function(e){
				console.log(e);
			}
		})
		.done(function(data) {
			console.log(data);
			$(".listReply"+commentId+" .moreReplyComment"+commentId).remove();
			$.each(data, function(i, val) {
				 var reply="<hr><div class=\"row reply reply"+val.id+" col-12\">"
							+"<div class=\"col-8 avt \">"
							+"<img src=\"../..//"+val.user.avatar+"\" width=\"40px\""
							+"height=\"40px\" style=\"opacity: 0.8; border-radius: 20px;\">"+val.user.username+"</div>"
							
							+"<div class=\"col-1 timer\">"
							+"<span title=\"ádfgh\">"+val.time+"</span></div>"
							
							+"<div class=\"col-1 menu\"><div class=\"dropdown\">"
							+"<img class=\"option-icon dropdown-toggle\""
							+"src=\"../../resources/img/option_icon.png\" data-toggle=\"dropdown\">"
							+"<ul class=\"dropdown-menu commentOption\" style=\"min-width: 50px; width: 70px\">"
							+"<li id=\""+val.id+"\" class=\"reportReplyOption\""
							+"data-toggle=\"modal\" data-target=\"#reportComment-box\" style=\"padding-left: 15%;\">Report</li>"
						if($(".user").attr("id")==val.user.username){
							reply=reply+"<li id=\""+val.id+"\" class=\"editReply\" style=\"padding-left: 15%;\" data-target=\"#editReply-box\" data-toggle=\"modal\">Edit</li>"
									+"<li id=\""+val.id+"\" class=\"deleteReply\" style=\"padding-left: 15%;\">Delete</li>";
						}
				 		reply=reply+"</ul></div>"
								+"</div>"
								+"<div class=\"col-9\">"
								+"<span class=\"col-9\">"+val.content+"</span> <br>"
								+"</div></div>";
							
				$(".listReply"+commentId).append(reply);
				
			});
			 $(".listReply"+commentId).append("<div class=\"moreReplyComment"+commentId+"\" id=\""+commentId+"\"><span class=\"moreReply col-11\" id=\""+page+"\">Read"
						+"more replies</span></div>");
			 return data;
		})
		.fail(function() {
			console.log("error");
		});
	}
	
	
	
	//xu ly su kien an nut xoa reply
	$(document).on("click", ".deleteReply",function(){
		if(confirm("Do you want to delete your Reply?")){
			var id= $(this).attr("id");
			$.ajax({
				url: '/webtoeicproject/user/discussion/deleteReply',
				type: 'post',
				dataType: 'json',
				data: {"replyCommentId": id },
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
					$('.reply'+id).remove();
				}
				
			})
			.fail(function() {
				alert("Delete error! Please again!");
			});
		}
		
	});
	
//	bat su kien an nut reply
	$(document).on("click",".send_reply_icon",function(){
		var commentId= $(this).attr("id");
		$.ajax({
			url: '/webtoeicproject/user/discussion/replyComment',
			type: 'post',
			dataType: 'json',
			data: {
				commentId: commentId,
				replyContent: $(".replyContent"+commentId).val()
			},
			error: function(e) {
				console.log(e);
			}
		})
		.done(function(data) {
			if(data == "error"){
				alert("Comment error! Please again!");
			}
//			$(".listReply"+commentId+" .moreReplyComment"+commentId).remove();
			var reply="<div class=\"row reply reply"+data.id+" col-12\">"
						+"<div class=\"col-8 avt \">"
						+"<img src=\"../..//"+data.user.avatar+"\" width=\"40px\""
						+"height=\"40px\" style=\"opacity: 0.8; border-radius: 20px;\">"+data.user.username+"</div>"
						
						+"<div class=\"col-1 timer\">"
						+"<span title=\"ádfgh\">"+data.time+"</span></div>"
						
						+"<div class=\"col-1 menu\"><div class=\"dropdown\">"
						+"<img class=\"option-icon dropdown-toggle\""
						+"src=\"../../resources/img/option_icon.png\" data-toggle=\"dropdown\">"
						+"<ul class=\"dropdown-menu commentOption\" style=\"min-width: 50px; width: 70px\">"
						+"<li id=\""+data.id+"\" class=\"reportReplyOption\""
						+"data-toggle=\"modal\" data-target=\"#reportComment-box\" style=\"padding-left: 15%;\">Report</li>"
						+"<li id=\""+data.id+"\" class=\"deleteReply\" style=\"padding-left: 15%;\">Delete</li>"
						+"</ul></div>"
						+"</div>"

						+"<div class=\"col-9\">"
						+"<span class=\"col-9\">"+data.content+"</span> <br>"
						+"</div></div>"
			
				$(".listReply"+commentId).append(reply);
			$(".replyContent"+commentId).val("");
//			 $(".listReply"+commentId).append("<div class=\"moreReplyComment"+commentId+"\" id=\""+commentId+"\">" +
//			 +"<span class=\"moreReply col-11\" id=\""+page+"\">Read more replies</span></div>");
			location.reload();
		})
		.fail(function() {
			alert("Comment error!!!");
		});
		
	});
	
});