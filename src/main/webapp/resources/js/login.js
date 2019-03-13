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

$(document).on("click", "#dangxuat-btn", function() {
	$.get("/logout", function() {
		window.location.reload();
	});
});