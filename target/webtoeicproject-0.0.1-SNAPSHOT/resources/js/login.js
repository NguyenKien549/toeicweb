// login
//$(document).ready(function() {
//	// search
//	$(document).on("click", ".btn-search", function() {
//
//		$(".input-search").toggleClass("active");
//	});
//
//	// login check
//	$(".submit").click(function(event) {
//		/* Act on the event */
//	});
//
//});

$("*").on("click", "#dangxuat-btn", function() {
	$.get("webtoeicproject/logout", function() {
		location.reload();
	});
});