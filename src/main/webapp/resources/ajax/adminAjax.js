$(document).ready(function() {
	
	$(document).on("click", "#deleteAccount", function() {
		var deleteArr = [];
		$("table tr").each(function() {
			if ($(this).hasClass("selected")) {
				deleteArr.push($(this).find("td").eq(0).html());
			}
		});

		if (deleteArr.length == 0) {
			alert("Select less 1 discussion to delete!");
			return;
		}
		$.ajax({
			url : 'delete',
			type : 'post',
			dataType : 'json',
			data : {
				ids : deleteArr
			}
		}).done(function(data) {
			if (data == "done") {
				alert("done");
				location.reload();
			}
			if (data == "error") {
				alert("fail");
			}
			
		}).fail(function() {
			console.log("error");
			alert("fail");
		});

	});
	
	$(document).on("click", "#lockAccount", function() {
		var lockArr = [];
		$("table tr").each(function() {
			if ($(this).hasClass("selected")) {
				lockArr.push($(this).find("td").eq(0).html());
			}
		});

		if (lockArr.length == 0) {
			alert("Select less 1 discussion to lock!");
			return;
		}
		$.ajax({
			url : 'lockAccount',
			type : 'post',
			dataType : 'json',
			data : {
				ids : lockArr
			}
		}).done(function(data) {
			if (data == "done") {
				alert("done");
				location.reload();
			}
			if (data == "error") {
				alert("fail");
			}
			
		}).fail(function() {
			console.log("error");
			alert("fail");
		});

	});
	
	$(document).on("click", "#unlockAccount",function unlockAccount(){
		
		var unlockArr = [];
		$("table tr").each(function(){
			if($(this).hasClass("selected")){
				unlockArr.push($(this).find("td").eq(0).html());
			}
		});
		
		if(unlockArr.length==0){
			alert("Select less 1 discussion to unlock!");
			return;
		}
		$.ajax({
			url: 'unlockAccount',
			type: 'post',
			dataType: 'json',
			data: {
				ids : unlockArr
			}
		})
		.done(function(data) {
			if(data == "done"){
				alert("done");
				location.reload();
			}
			if(data == "error"){
				alert("fail");
			}
			
		})
		.fail(function() {
			console.log("error");
			alert("fail");
			
		});
	});

	// $(document).on("click", ".pageIndex", function(){
	// $.ajax({
	// url: 'pagination',
	// type: 'post',
	// dataType: 'json',
	// data: {
	// type: "account",
	// page: $(this).html()
	// },
	// error: function(e){
	// console.log(e);
	// }
	// })
	// .done(function() {
	// location.reload();
	// })
	// .fail(function() {
	// location.reload();
	// });
	//		
	// });

});