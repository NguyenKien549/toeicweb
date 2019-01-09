$(document).ready(function () {
	
	$(".submit-button-register").click(function(){
		$.ajax({
			url: 'http://localhost:8080/webtoeicproject/register',
			type: 'post',
			dataType: 'json',
			data:
			{
				user: "user",
				dob:$("#DoB").val()
			},
			error:function(e) {
				console.log(e);
			}
		})
		.done(function(data) {
			console.log(data);
			alert(data);
			window.location("http://localhost:8080/webtoeicproject/login");
		})
		.fail(function() {
			console.log("error");
		});
		
	});
});