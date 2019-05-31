$(document).ready(function(){
	$(document).on("click", "#deleteReport",function(){
		var deleted = [];
		var type = $(this).attr("class");
		$("table tr").each(function() {
			if ($(this).hasClass("selected")) {
				deleted.push($(this).find("td").eq(0).html());
			}
		});

		if (deleted.length == 0) {
			alert("Select 1 report to delete!");
			return;
		}
		if(confirm("Do you want to delete???")){
			$.ajax({
				url : '../deleteDocument',
				type : 'post',
				dataType : 'json',
				data : {
					ids : deleted,
					type : "report"
				}
			}).done(function(data) {
				if (data == "done") {
					console.log("delete done");
					alert("done");
					location.reload();
				} else
					alert("fail");
			}).fail(function() {
				console.log("fail");
				alert("fail");
			});
		}
	});
});