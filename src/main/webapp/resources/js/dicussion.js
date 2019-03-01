$(".replyBox").hide();
$(".reportBox").hide();
$(document).ready(function() {

	$(document).on("click", ".reply", function() {
		var id = $(this).attr("id");

		$("." + id).toggle();

	});

	$(document).on("click", ".report", function() {
		var id = $(this).attr("id");

		$("." + id).toggle();

	});

});