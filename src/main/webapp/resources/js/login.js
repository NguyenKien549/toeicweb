// login
$(document).ready(function() {

	$("#dangxuat-btn").on("click", function() {
		$.get("/webtoeicproject/logout", function() {
			window.location.reload();
		});
	});
	

	$(".adminPage").on("click",function(){
		location.href= "/webtoeicproject/admin/accountManagement/1";
	});
});
