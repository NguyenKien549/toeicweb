$(document).on("click", "#btnsearch", function() {
	searchKey = $("#search").val();
	var pages=0;
	var currentPage =1;
	search = searchKey;
//	searchNumbPage("discussion",searchKey,10);
	$.ajax({
		url : "../searchNumbPage",
		type : "get",
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		async : false,
		data :
			{
				type : "discussion",
				key : searchKey,
				pageSize: 10
			}
		}).done(function(data){
			console.log(data);
			if(data != "error"){
				console.log("success");
				pages= data;
			}
			
		}).fail(function(){
			console.log("fail");
			alert("error!please again");
			pages = null;
		});
	console.log(pages);
	if(pages == undefined || pages <=0){
		alert("empty");
		location.reload();
	}else{
		$.ajax({
			url : "../search",
			type : "get",
			dataType : 'json',
			contentType : 'application/json;charset=utf-8',
			data :
				{
					type : "discussion",
					key : searchKey,
					page: 1,
					pageSize: 10
				}
			}).done(function(data){
				console.log(data);
				if(data != "empty" && data != "error"){
					$("tbody").empty();
					$.each(data, function(i, val) {
						var row='<tr class="d-flex">'
								+'<td class="col-sm-1 col-md-1">'+val.id+'</td>'
								+"<td class=\"col-sm-6 col-md-6\">"+val.title+"</td>"
								+'<td class="col-sm-2 col-md-2">'+val.user.username+'</td>'
								+'<td class="col-sm-1 col-md-1">'+val.view+'</td>'
								+'<td class="col-sm-1 col-md-1">'+val.active+'</td>'
								+'<td class="col-sm-1 col-md-1">'
								+'<a href="../../discussion/'+val.title+'/'+val.id+'"'
								+'target="_blank">View</a></td></tr>';
						$("tbody").append(row);
					});
					
					$(".pagingation").empty();
					var li="";
					for (var i = 0; i < 11; i++) {
						li = li+ "<li class=\"page-item\" id=\"index\"><a"
						+" class=\"page-link pageIndex pageIndexSearch\" href=\""+i+"\">"+i+"</a></li>";
					}
					
					$(".pagingation").append('<span class="col-md-6 col-sm-12" id="infoPage">Page'
											+currentPage+' of '+pages+'</span>'
											+'<ul class="pagination" id="pagin">'
											+li+'</ul>');
				}
			}).fail(function(){
				console.log("fail");
			});;
	}
	

});

  function searchNumbPage(type,key,pageSize){
	$.ajax({
		url : "../searchNumbPage",
		type : "get",
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		async : false,
		data :
			{
				type : "discussion",
				key : searchKey,
				pageSize: 10
			}
		}).done(function(data){
			console.log(data);
			if(data != "error"){
				console.log("success");
				pages= data;
			}
			
		}).fail(function(){
			console.log("fail");
			alert("error!please again");
			pages = null;
		});
}

$("#deleteDiscussion").click(function() {
	var arr = [];
	$(".noti").empty();
	var i = 0;
	$("table tr").each(function() {
		if ($(this).hasClass("selected")) {
			arr[i] = $(this).find("td").eq(0).html();
			i += 1;
		}
	});
	if (i == 0) {
		alert("Hãy chọn một dòng để xóa!!!");
		return;
	}
	$.ajax({
		url : "../deleteDocument",
		type : "post",
		dataType : 'json',
		data : {
			type : "discussion",
			ids : arr,
		},
		success : function(value) {
			alert("done");
			location.reload();
		},fail : function(){
			alert("error");
		}
	});
});

$(document).on("click", "#submitDiscussion", function addDiscussion(){
	var title = $("#discussionTitle").val();
	console.log(title);
	var content = CKEDITOR.instances.discussionContent.getData();
	console.log(content);
	$.ajax({
		url: 'add',
		type: 'POST',
		dataType: 'json',
		data: {
			content: content,
			title : title
		},
	})
	.done(function(data) {
		console.log("success");
		if(data =="error"){
			alert("add fail");
		}else location.href= data;

	})
	.fail(function() {
		console.log("error");
	});
});
	
	$(document).on("click", "#lockDiscussion",function lockDiscussion(){
		var lockArr = [];
		$("table tr").each(function(){
			if($(this).hasClass("selected")){
				lockArr.push($(this).find("td").eq(0).html());
			}
		});

		if(lockArr.length==0){
			alert("Select less 1 discussion to lock!");
			return;
		}
		$.ajax({
			url: 'lockDiscussion',
			type: 'post',
			dataType: 'json',
			data: {
				ids : lockArr
				}
		})
		.done(function(data) {
			if(data == "done"){
				alert("done");
			}
			if(data == "error"){
				alert("fail");
			}
			location.reload();
		})
		.fail(function() {
			console.log("error");
			alert("fail");
		});
	});

$(document).on("click", "#unlockDiscussion",function unlockDiscussion(){
	
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
		url: 'unlockDiscussion',
		type: 'post',
		dataType: 'json',
		data: {
			ids : unlockArr
		}
	})
	.done(function(data) {
		if(data == "done"){
			alert("done");
		}
		if(data == "error"){
			alert("fail");
		}
		location.reload();
	})
	.fail(function() {
		console.log("error");
		alert("fail");
		
	});
});

