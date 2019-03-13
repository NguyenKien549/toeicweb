
$("#document").ready(function(){
		$(document).on("click",".listeningPractice",function(){
			var id = $(this).val();
			var part=$(".listeningPractice span:first").attr("class");
			var title=$(".listeningPractice span:first").html();
			location.href="../practice/"+part+"/"+title+"/"+id;
		});

});
$("#part6").click(function(){
	$("#title").html("part");
});
