$(".replyInputArea").hide();
$(".readLessReply").hide();
$(document).ready(function() {

	$(document).on("click", ".replyComment", function() {
		var id = $(this).attr("id");

		$('.replyBox'+id).toggle(500);

	});

//	$(document).on("click", ".report", function() {
//		var id = $(this).attr("id");
//
//		$("." + id).toggle(500);
//
//	});
//	
//	$(document).on("click", ".readLessReply", function() {
//		$(".readLessReply").hide();
//		$(".listReply").hide();
//		$(".readmoreReply").show();
//	});

});