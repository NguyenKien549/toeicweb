$(document).ready(function(){
	$(document).on("change", "#selectDataTable", function() {
		var choice = $("#selectDataTable").find(":selected").val();

		switch (choice) {
		case "practice":
			location.href="../practice/1";
			break;
		case "test":
			location.href = "../test/1";
			break;
		default:
			break;
		}
	});
	
	$(document).on('click', '.paraContent', function() {
		if($(this).css("overflow")=="hidden"){
			$(this).css("overflow",'');
			$(this).css("max-height",'');
		}else{
			$(this).css("overflow",'hidden');
			$(this).css("max-height",'3em');
		}
	});
	
	$(document).on('click', '.addLessonSubmit', function() {
		if($(this).attr("id")=="practice"){
			var part = $(".selectPartPractice").val();
			var practice={
				"code" : $(".practiceCode").val(),
				"name" : $(".practiceName").val(),
				"part" : part,
			};
			
			addLesson("practice",practice);
			
		}else if($(this).attr("id")=="test"){
			var test={
					"code" : $(".testCode").val(),
					"title" : $(".testTitle").val(),
				};
				
				addLesson("test",test);
		}
		
	});
	
	$(document).on("click",".addDocumentCheckbox",countCheckbox);
	
	$(document).on("click","#addDocument",function addQuestion(){
		var type = $(this).attr("class");
		var add=0;
		var part;
		if(type=="practice"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#practiceId").val($(this).find("td").eq(0).html());
					part = $(this).find("td").eq(3).html();
					add++;
				}
			});
		}else if(type=="test"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					id = $(this).find("td").eq(0).html();
					add++;
				}
			});
		}
		
		if (add == 0 || add > 1) {
			alert("Select 1 lesson to add document!");
			return;
		} else {
			 if(type=="test"){
//				 location.href=;
				 window.open("updateTestDocument/"+id);
			 }else{
					if( part != "test" ){
						part = "part"+part;
					}
					
					$(".numbDocumentSelected").html(0);
					getDocumentForLesson(part,"practice","addLessonDocument");
					
					$("#myModal-addDocumentLesson").modal('toggle');
			 }
		}
	});
	
	$(document).on("click",".addDocumentSubmit",function(){
		var ids=[];
		var id=0;
		var type = $(this).attr("id");
		console.log("type "+type);
		
		if(type == "practice"){
			id=$("#practiceId").val();
		}else if(type=="test"){
			id=$("#testId").val();
		}
		
		console.log("id"+id);
		
		$(".addLessonDocument input[class='addDocumentCheckbox']:checked").each(function(){
			ids.push($(this).attr("id"));
		});
		
		console.log(ids);
		if(ids.length<1){
			alert("hay chon muc can them!!!");
			return;
		}else{
			var verify = confirm("Hanh dong nay se xoa cac muc trong tai lieu hien tai, xac nhan them moi tu dau???");
			if(verify == true){
				addDocumentForLesson(type,id,ids);
			}
		}
		
	});
	
	$(document).on("click", "#updateLesson", function() {
		var type = $(this).attr("class");
		var edit = [];
		if (type == "practice") {
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$(".editId").val($(this).find("td").eq(0).html());
					$(".editPracticeCode").val($(this).find("td").eq(1).html());
					$(".editPracticeName").val($(this).find("td").eq(2).html());
					$(".editSelectPartPractice").val( $(this).find("td").eq(3).html());

					edit.push($(this));
				}
			});
		} else if (type=="test"){
			$("table tr").each(function(){
				if($(this).hasClass("selected")){
					$(".editTestId").val($(this).find("td").eq(0).html());
					$(".editTestCode").val($(this).find("td").eq(1).html());
					$(".editTestTitle").val($(this).find("td").eq(2).html());
					
					edit.push($(this));
				}
				
			});
		}
		if (edit.length == 0 || edit.length > 1) {
			alert("Select 1 question to edit!");
		} else {
			$("#myModal-updateLesson").modal('toggle');
		}
		
	});
	
	$(document).on("click",".updateLessonSubmit",function(){
		var editedLesson;
		type = $(this).attr("id");
		if(type == "practice"){
			editedLesson={
					id 		: $(".editId").val(),
					code	: $(".editPracticeCode").val(),
					name	: $(".editPracticeName").val(),
					part	: $(".editSelectPartPractice").val()
			};
			
		}else if(type=="test"){
			//tao doi tuong
			editedLesson={
					id 		: $(".editTestId").val(),
					code	: $(".editTestCode").val(),
					title	: $(".editTestTitle").val(),
			};
			
		}
		
			var verify = confirm("Hanh dong nay se cap nhat cac muc trong tai lieu hien tai, xac nhan ???");
			if(verify == true){
				updateLesson(type,editedLesson);
			}
	});
	
	
	$(document).on("click", "#deleteLesson", function() {
		var deleted = [];
		var type = $(this).attr("class");
		$("table tr").each(function() {
			if ($(this).hasClass("selected")) {
				deleted.push($(this).find("td").eq(0).html());
			}
		});

		if (deleted.length == 0) {
			alert("Select 1 lesson to delete!");
			return;
		}
		if(confirm("Do you want to delete???")){
			$.ajax({
				url : '../../deleteDocument',
				type : 'post',
				dataType : 'json',
				data : {
					ids : deleted,
					type : type
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
	
	$(document).on("click","#updateDocument",function(){
		var type = $(this).attr("class");
		var id=0;
		var add=0;
		if(type=="practice"){
			
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#practiceIdUpdate").val($(this).find("td").eq(0).html());
					add++;
				}
			});
			
			id=$("#practiceIdUpdate").val();
		}else if(type=="test"){
			
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					id = $(this).find("td").eq(0).html();
					add++;
				}
			});
		}
		
		if (add == 0 || add > 1) {
			alert("Select 1 row to update!");
			return;
		} else {
			 if(type=="test"){
//				 location.href="updateTestDocument/"+id;
				 window.open("updateTestDocument/"+id);
			 }else{
				 $(".listQuestionsUpdate").empty();
					$(".numbDocumentSelectedUpdate").html(0);
					
					console.log("id "+id);
					var part = getDocumentUpdate(type,id,"updateLessonDocument");
					
					getDocumentForLesson(part,type,"updateLessonDocument");
					
					$("#myModal-updateLessonDocument").modal('toggle');
			 }
			
		}
		countCheckbox();
	});
	
	$(document).on("click", ".updateDocumentSubmit", function() {
		var ids=[];
		var id=0;
		var type = $(this).attr("id");
		console.log("type "+type);
		if(type == "practice"){
			id=$("#practiceIdUpdate").val();
		}else if(type=="test"){
			id=$("#testIdUpdate").val();
		}
		
		console.log("id"+id);
		$(".updateLessonDocument input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
		});
		
		console.log(ids);
		if(ids.length<1){
			alert("hay chon cau can cap nhat bai hoc!!!");
			return;
		}else{
			var verify = confirm(" xac nhan cap nhat???");
			if(verify == true){
				updateDocumentQuestion(type,id,ids);
			}
		}
		
	});
	
	$(document).on("click", "#updateTestDocumentSubmit", function() {
		var ids=[];
		var id=$(".testIdUpdate").val();
		console.log("id"+id);
		
		//add audio
		$(".audios input[type='checkbox']:checked").each(function(){
			ids.push($(this).attr("id"));
		});
		
		ids.push(0);
		$(".part5s input[type='checkbox']:checked").each(function(){
			ids.push($(this).attr("id"));
		});
		
		ids.push(0);
		$(".paragraphPart6s input[type='checkbox']:checked").each(function(){
			ids.push($(this).attr("id"));
		});
		$(".paragraphPart7s input[type='checkbox']:checked").each(function(){
			ids.push($(this).attr("id"));
		});
		
		console.log(ids);
		if(ids.length < 1){
			alert("Hãy chọn ít nhất 1 câu!!!");
			return;
		}else{
			if(ids.length == 202 ){
				var verify = confirm("Confirm update???");
				if(verify == true){
					$.ajax({
						url:'../../updateDocumentForLesson',
						type:'post',
						dataType: 'json',
						async: false,
						data:{
							type	:"test",
							id		:id,
							ids		:ids
						}
					}).done(function(data){
						if(data=="done"){
							alert("done");
							location.reload();
							return;
						}
						alert("fail");
					}).fail(function(){
						console.log("fail");
					});
				}
			}else{
				alert("Select enought 200 questions, please!!!");
			}
			
		}
		
	});
	
	countTestCheckbox("all");
	
	$(document).on("click",".audioCheckBox",function(){
		countTestCheckbox("audio");
	});
	$(document).on("click",".part5CheckBox",function(){
		countTestCheckbox("part5");
	});
	$(document).on("click",".paragraphCheckBox",function(){
		if($(this).hasClass("part6")){
			countTestCheckbox("part6");
		}else if($(this).hasClass("part7")){
			countTestCheckbox("part7");
		}
		
	});
	
	
});

function countTestCheckbox(type){
	
	total = parseInt($(".totalSelected").html());
	if(type == "audio"){
		audio = 0;
		$(".audios input[type='checkbox']:checked").each(function(){
			audio += parseInt($(this).val());
		});
		
		total = total - parseInt( $(".audioSelected").html() ) + audio;
		$(".audioSelected").html(""+audio);
		$(".totalSelected").html(total);
		 
		 if(parseInt( $(".audioSelected").html() ) >= 100){
			$(".audios input[type='checkbox']").each(function(){
				if($(this).prop("checked") != true ){
					$(this).attr("disabled",true);
				}
			});
		}else{
			$(".audios input[type='checkbox']").each(function(){
				$(this).attr("disabled",false);
			});
		}
	}else if(type == "part5"){
		part5 = 0;
		$(".part5s input[type='checkbox']:checked").each(function(){
			part5 += 1;
		});
		
		total = total - parseInt($(".part5Selected").html()) + part5;
		$(".part5Selected").html(""+part5);
		 $(".totalSelected").html(total);
	}else if(type == "part6"){
		part6 = 0;
		$(".paragraphPart6s input[type='checkbox']:checked").each(function(){
			parseInt($(this).val());
		});
		
		total = total - parseInt($(".part6Selected").html() )+ part6;
		$(".part6Selected").html(""+part6);
		 $(".totalSelected").html(total);
	}else if(type == "part7"){
		part7 = 0;
		$(".paragraphPart7s input[type='checkbox']:checked").each(function(){
			part7 += parseInt($(this).val());
		});
		
		total = total -parseInt($(".part7Selected").html() )+ part7;
		$(".part7Selected").html(""+part7);
		 $(".totalSelected").html(total);
		 
	}else if(type == "all"){
		var audio = 0;
		$(".audios input[type='checkbox']:checked").each(function(){
			audio += parseInt($(this).val());
		});
		
		var part5 = 0;
		$(".part5s input[type='checkbox']:checked").each(function(){
			part5 += 1;
		});
		
		var part6 = 0;
		$(".paragraphPart6s input[type='checkbox']:checked").each(function(){
			part6 += parseInt($(this).val());
		});
		
		
		var part7 = 0;
		$(".paragraphPart7s input[type='checkbox']:checked").each(function(){
			part7 += parseInt($(this).val());
		});
		
		
		$(".audioSelected").html(audio);
		$(".part5Selected").html(part5);
		$(".part6Selected").html(part6);
		$(".part7Selected").html(part7);
		
		total = audio + part5 +part6 +part7;
		$(".totalSelected").html(total);
		if(parseInt( $(".audioSelected").html() ) >= 100){
			$(".audios input[type='checkbox']").each(function(){
				if($(this).prop("checked") != true ){
					$(this).attr("disabled",true);
				}
			});
		}else{
			$(".audios input[type='checkbox']").each(function(){
					$(this).attr("disabled",false);
			});
		}
		if(total >=200){
			$("input[type='checkbox']").each(function(){
				if($(this).prop("checked") != true){
					$(this).attr("disabled",true);
				}
			});
		}
			
	}
	
}

function updateDocumentQuestion(type,id,ids){
	$.ajax({
		url:'../updateDocumentForLesson',
		type:'post',
		dataType: 'json',
		async: false,
		data:{
			type	:type,
			id		:id,
			ids		:ids
		}
	}).done(function(data){
		if(data=="done"){
			alert("done");
			location.reload();
			return;
		}
		alert("fail");
	}).fail(function(){
		console.log("fail");
	});
}

function getDocumentUpdate(type,id,addOrUpdate){
	var part="";
	$.ajax({
		url : '../getCurrentDocument',
		dataType : 'json',
		async: false,
		type : 'post',
		data : {
			type:type,
			id:id
		}

	}).done(function(data) {
		console.log(data);
		if(data == "error"){
			console.log("fail");
			return;
		}else{
			var temp=[]; // save arr question
			
			if(type=="practice"){
				if(data.part <= 4 ){
					part = "part"+data.part;
					temp = data.audio;
					$(".currentPart").html("Audio Part "+data.part);
					$(".currentPart").attr("id",part);
					$(".maxDocumentUpdate").html(1);
				}else if(data.part == 5 ){
					part = "part"+data.part;
					temp = data.listPart5;
					$(".currentPart").html("Part 5");
					$(".currentPart").attr("id","part5");
					$(".maxDocumentUpdate").html(30);
				}else if(data.part <=7){
					part = "part"+data.part;
					temp = data.listParagraph;
					$(".currentPart").html("Paragraph Part "+data.part);
					$(".currentPart").attr("id",part);
					$(".maxDocumentUpdate").html(10);
				}
			}else if(type=="test"){
				
			}
			$(".currentDocuments").empty();
			console.log(temp);
			if(temp != null ){
				console.log(temp.length);
				
					$(".numbDocumentSelectedUpdate").html(""+temp.length);
					if(data.part <= 4 ){
							var audio="";
	//						$.each(temp, function(i, val) {
								audio=	'<div class="audio '+addOrUpdate+' audio'+1+' row" style="margin: auto;">'
										+'<input type="checkbox" class="addDocumentCheckbox" id="'+temp.id+'" checked="checked" style="height: 18px;width: 18px;margin: 1%;">'
										+'<div class="audioContent">'
										+'<audio controls><source src="/webtoeicproject/'+temp.audio+'" type="audio/mpeg"></audio>'
										+'</div></div>'
								$(".currentDocuments").append(audio);
	//						});
					}else if(data.part == 5 ){
						var ques="";
						$.each(temp, function(i, val) {
							ques=	'<div class="ques '+addOrUpdate+' addLessonQuestion ques'+i+' row" style="margin: auto;">'
									+'<input type="checkbox" class="addDocumentCheckbox" id="'+val.id+'" checked="checked"  style="height: 18px;width: 18px;margin: 1%;">'
									+'<div class="paraContent col-11" style="    max-height: 3em;    overflow: hidden;">'+val.question+'</div>'
									+'</div>'
							$(".currentDocuments").append(ques);
						});
					}else if(data.part <=7){
						var para="";
						$.each(temp, function(i, val) {
							para=	'<div class="paragraph '+addOrUpdate+' addLessonQuestion paragraph'+i+' row" style="margin: auto;">'
									+'<input type="checkbox" class="addDocumentCheckbox" id="'+val.id+'" checked="checked"  style="height: 18px;width: 18px;margin: 1%;">'
									+'<div class="paraContent col-11" style="    max-height: 3em;    overflow: hidden;">'+val.paragraph+'</div>'
									+'</div>'
							$(".currentDocuments").append(para);
						});
					}
					
			}else{
				console.log("nulll");
				$(".currentDocuments").append("No data.");
			}
			
		}
		
	}).fail(function() {
		console.log("fail");
	});
	
	return part;
}

function updateLesson(type,lesson){
	
	if(type=="practice"){
		$.ajax({
			url: "../updatePractice",
			type: 'post',
			contentType : 'application/json;charset=utf-8',
			dataType: 'json',
			data: JSON.stringify({ practice:lesson })
		})
		.done(function(data) {
			console.log(data);
			if(data!="error"){
				alert("done");
				location.reload();
			}else {
				alert("error!");
			}
		}).fail(function(){
			console.log("fail");
			alert("fail!");
		});
	}else if(type=="test"){
		$.ajax({
			url: "../updateTest",
			type: 'post',
			contentType : 'application/json;charset=utf-8',
			dataType: 'json',
			data: JSON.stringify({ test:lesson })
		})
		.done(function(data) {
			console.log(data);
			if(data!="error"){
				alert("done");
				location.reload();
			}else {
				alert("error!");
			}
		}).fail(function(){
			console.log("fail");
			alert("fail!");
		});
	}
	
}

function countCheckbox(){
	var currentNumb =$('.listDocuments .addLessonDocument input[type="checkbox"]:checked').length;
	
	$(".numbDocumentSelected").html(""+currentNumb);
	
	if(currentNumb >= $(".maxDocument").html() ){
		$('.addDocumentCheckbox').each(function(){
			if($(this).prop("checked")!=true){
				$(this).attr("disabled",true);
			}
		});
	}else {
		$('.addDocumentCheckbox').each(function(){
				$(this).attr("disabled",false);
		});
	}
	
	var currentNumbUpdate =$('.updateLessonDocument input[type="checkbox"]:checked').length;
	$(".numbDocumentSelectedUpdate").html(""+currentNumbUpdate);
	if(currentNumbUpdate >= $(".maxDocumentUpdate").html() ){
		$('.addDocumentCheckbox').each(function(){
			if($(this).prop("checked") != true){
				$(this).attr("disabled",true);
			}
		});
	}else {
		$('.addDocumentCheckbox').each(function(){
				$(this).attr("disabled",false);
		});
	}
}

function addDocumentForLesson(type,id,ids){
	console.log(type);
	console.log(id);
	console.log(ids);
	$.ajax({
		url: '../addDocumentForLesson',
		type: 'post',
		dataType: 'json',
		data:{
			type: type,
			id:id,
			ids:ids
		}
	})
	.done(function(data) {
		console.log(data);
		if(data!="error"){
			alert("done");
			location.reload();
		}else {
			alert("error!");
		}
	}).fail(function(){
		console.log("fail");
		alert("fail!");
	});
}

function addLesson(type,lesson){
	if(type =="practice"){
		$.ajax({
			url: '../addPractice',
			type: 'post',
			contentType : 'application/json;charset=utf-8',
			async: false,
			dataType: 'json',
			data: JSON.stringify({ 
				practice : lesson
				})
		})
		.done(function(data) {
			console.log(data);
			if(data!="error"){
				alert("done");
				location.href = data;
			}else {
				alert("error!");
			}
		}).fail(function(){
			console.log("fail");
			alert("fail!");
		});
	}else if(type == "test"){
		$.ajax({
			url: '../addTest',
			type: 'post',
			contentType : 'application/json;charset=utf-8',
			async: false,
			dataType: 'json',
			data: JSON.stringify({ 
				test : lesson
				})
		})
		.done(function(data) {
			console.log(data);
			if(data!="error"){
				alert("done");
				location.href = data;
			}else {
				alert("error!");
			}
		}).fail(function(){
			console.log("fail");
			alert("fail!");
		});
	}
	
}

function getDocumentForLesson(part,kind,addOrUpdate){
	$(".listeningDocuments").empty();
	$(".readingDocuments").empty();
	$.ajax({
		url: '../getDocumentForLesson',
		type: 'get',
		dataType: 'json',
		async:false,
		data: {
			type: part,
			kind: kind
		},
	})
	.done(function(data) {
		console.log(data);
		if(part == "part1" || part == "part2" || part == "part3" || part == "part4" ){
			$(".typeDocument").empty();
			$(".typeDocument").append("audio ("+part+")");
			$(".maxDocument").html(1);
			if(data.length <1){
				$(".listeningDocuments").append("No data.");
			}else{
				var audio="";
				$.each(data, function(i, val) {
					audio=	'<div class="audio '+addOrUpdate+' audio'+i+' row" style="margin: auto;">'
							+'<input type="checkbox" class="addDocumentCheckbox" id="'+val.id+'" style="height: 18px;width: 18px;margin: 1%;">'
							+'<div class="audioContent">'
							+'<audio controls><source src="/webtoeicproject/'+val.audio+'" type="audio/mpeg"></audio>'
							+'</div></div>'
					$(".listeningDocuments").append(audio);
				});
			}
			
		}else if(part == "part6" || part == "part7" ){
			$(".maxDocument").html(10);
			$(".typeDocument").empty();
			$(".typeDocument").append("paragraphs ("+part+")");
			if(data.length <1){
				$(".readingDocuments").append("No data.");
			}else{
				var para="";
				$.each(data, function(i, val) {
					para=	'<div class="paragraph '+addOrUpdate+' addLessonQuestion paragraph'+i+' row" style="margin: auto;">'
							+'<input type="checkbox" class="addDocumentCheckbox" id="'+val.id+'" style="height: 18px;width: 18px;margin: 1%;">'
							+'<div class="paraContent col-11" style="    max-height: 3em;    overflow: hidden;">'+val.paragraph+'</div>'
							+'</div>'
					$(".listeningDocuments").append(para);
				});
			}
			
		}else if(part=="part5"){
			$(".maxDocument").html(30);
			$(".typeDocument").empty();
			$(".typeDocument").append("questions ("+part+")");
			if(data.length <1){
				$(".readingDocuments").append("No data.");
			}else{
				var ques="";
				$.each(data, function(i, val) {
					ques=	'<div class="ques '+addOrUpdate+' addLessonQuestion ques'+i+' row" style="margin: auto;">'
							+'<input type="checkbox" class="addDocumentCheckbox" id="'+val.id+'" style="height: 18px;width: 18px;margin: 1%;">'
							+'<div class="paraContent col-11" style="    max-height: 3em;    overflow: hidden;">'+val.question+'</div>'
							+'</div>'
					$(".listeningDocuments").append(ques);
				});
			}
			
		}else if(part=="test"){
			
		}
	}).fail(function() {
		console.log("error");
	});
}