$(document).ready(function() {
	var audioLocation = null;
	var openedId=0;
	
	$(document).on('click', '.addSubmit', function() {
		var type = $(this).attr("id");
		var part = [];
		console.log("type" +type);
		
		if(type == "audio"){
			var audio;
			if (audioLocation != undefined) {
				audio = {
						"audio" : audioLocation,
						"script" : CKEDITOR.instances.script.getData(),
				};
				$.ajax({
					url : '../addAudio',
					type : 'post',
					dataType : 'json',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						audio : audio
					})
				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.href=data;
				}).fail(function() {
					console.log("error");
					location.reload();
				});
			}
		}else if(type == "paragraph"){
			var para=CKEDITOR.instances.paragraph.getData();
			
			if (para != undefined) {
				paragraph = {
						"paragraph" : para,
				};
				$.ajax({
					url : '../addParagraph',
					type : 'post',
					dataType : 'json',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						paragraph : paragraph
					})
				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.href=data;
				}).fail(function() {
					console.log("error");
					location.reload();
				});
			}
		}else if (type == "part1") {

				for (var i = 1; i < 11; i++) {
					if($('#image' + i).hasClass("form-control")){
						
						var uploaded = uploadImage('#image' + i);
						console.log("uploaded " + uploaded);
						if (uploaded != undefined) {
							var question = {
								"question" : $('#question' + i).val(),
								"a" : $('#A' + i).val(),
								"b" : $('#B' + i).val(),
								"c" : $('#C' + i).val(),
								"d" : $('#D' + i).val(),
								"image" : uploaded,
								// "audioPart1" : audio,
								"rightAnswer" : $('#RightAnswer' + i).val()
							};
							part.push(question);
						}
					}
				}
				console.log(part);
				$.ajax({
					url : '../addPart1',
					type : 'post',
					dataType : 'json',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						part1 : part
					})
				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.href=data;
				}).fail(function() {
					console.log("error");
				});

		} else if (type == "part2") {

			for (var i = 1; i < 11; i++) {
				var question = $('#question' + i).val();
				if (question != "" && question != undefined) {
					var question = {
						"question" : question,
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part.push(question);
				}
			}
			console.log(part);
			$.ajax({
				url : '../addPart2',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					part2 : part
				})
			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.href=data;
			}).fail(function() {
				console.log("error");
			});
		} else if (type == "part3") {
			
			for (var i = 1; i < 11; i++) {
				var question = $('#question' + i).val();
				if (question != "" && question != undefined) {
					var question = {
						"question" : question,
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"d" : $('#D' + i).val(),
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part.push(question);
				}
			}
			console.log(part);
			$.ajax({
				url : '../addPart3',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					part3 : part
				})
			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.href=data;
			}).fail(function() {
				console.log("error");
			});
		} else if (type == "part4") {

			for (var i = 1; i < 11; i++) {
				var question = $('#question' + i).val();
				if (question != "" && question != undefined) {
					var question = {
						"question" : question,
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"d" : $('#D' + i).val(),
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part.push(question);
				}
			}
			console.log(part);
			$.ajax({
				url : '../addPart4',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					part4 : part
				})
			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.href=data;
			}).fail(function() {
				console.log("error");
			});
		}else if (type == "part5") {
			for (var i = 1; i < 11; i++) {
				var question = $('#question' + i).val();
				if (question != "" && question != undefined) {
					var question = {
						"question" : question,
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"d" : $('#D' + i).val(),
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part.push(question);
				}
			}
			console.log(part);
			$.ajax({
				url : '../addPart5',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					part5 : part
				})
			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.href=data;
			}).fail(function() {
				console.log("error");
				alert("fail");
			});
		}else if (type == "part6") {
			
			for (var i = 1; i < 11; i++) {
				var a = $('#A' + i).val();
				if (a != "" && a != undefined) {
					var question = {
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"d" : $('#D' + i).val(),
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part.push(question);
				}
			}
			console.log(part);
			$.ajax({
				url : '../addPart6',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					part6 : part
				})
			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.href=data;
			}).fail(function() {
				console.log("error");
			});
		}else if (type == "part7") {
			
			for (var i = 1; i < 11; i++) {
				var question = $('#question' + i).val();
				if (question != "" && question != undefined) {
					var question = {
						"question" : question,
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"d" : $('#D' + i).val(),
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part.push(question);
				}
			}
			console.log(part);
			$.ajax({
				url : '../addPart7',
				type : 'post',
				dataType : 'json',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					part7 : part
				})
			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.href=data;
			}).fail(function() {
				console.log("error");
			});
		}

	});

	//auto upload audio when choose file
	$(document).on("change", "#audio", uploadAudio);
	
	//UPDATE

	$(document).on("click", "#update", function() {
		var type = $(this).attr("class");
		var edit = [];
		if (type == "part1") {
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#editId").val($(this).find("td").eq(0).html());
					$("#viewEditImage").html($(this).find("td").eq(8).html());
					$("#editQuestion").val($(this).find("td").eq(1).html());
					$("#editA").val($(this).find("td").eq(2).html());
					$("#editB").val($(this).find("td").eq(3).html());
					$("#editC").val($(this).find("td").eq(4).html());
					$("#editD").val($(this).find("td").eq(5).html());
					$("#editRightAnswer").val($(this).find("td").eq(6).html());
					$(".editAudio").html($($(this).find("td").eq(7)).html());

					edit.push($(this));
				}
			});
		} else if (type == "part2") {
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#editId").val($(this).find("td").eq(0).html());
					$("#editQuestion").val($(this).find("td").eq(1).html());
					$("#editA").val($(this).find("td").eq(2).html());
					$("#editB").val($(this).find("td").eq(3).html());
					$("#editC").val($(this).find("td").eq(4).html());
					$("#editRightAnswer").val($(this).find("td").eq(5).html());

					edit.push($(this));
				}
			});
		}else if(type=="part3" || type=="part4" || type=="part5" || type=="part7"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#editId").val($(this).find("td").eq(0).html());
					$("#editQuestion").val($(this).find("td").eq(1).html());
					$("#editA").val($(this).find("td").eq(2).html());
					$("#editB").val($(this).find("td").eq(3).html());
					$("#editC").val($(this).find("td").eq(4).html());
					$("#editD").val($(this).find("td").eq(5).html());
					$("#editRightAnswer").val($(this).find("td").eq(6).html());
					edit.push($(this));
				}
			});
		}else if(type=="part6"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#editId").val($(this).find("td").eq(0).html());
					$("#editA").val($(this).find("td").eq(1).html());
					$("#editB").val($(this).find("td").eq(2).html());
					$("#editC").val($(this).find("td").eq(3).html());
					$("#editD").val($(this).find("td").eq(4).html());
					$("#editRightAnswer").val($(this).find("td").eq(5).html());
					edit.push($(this));
				}
			});
		}else if(type=="audio"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#editId").val($(this).find("td").eq(0).html());
					$("#viewEditAudio").html($(this).find("td").eq(1).html());
					CKEDITOR.instances.editScript.setData( $(this).find("td").eq(2).html() );
					edit.push($(this));
				}
			});
		}else if(type=="paragraph"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#editId").val($(this).find("td").eq(0).html());
					CKEDITOR.instances.editParagraph.setData( $(this).find("td").eq(1).html() );
					edit.push($(this));
				}
			});
		}
		
		if (edit.length == 0 || edit.length > 1) {
			alert("Select 1 question to edit!");
		} else {
			$("#myModal-update").modal('toggle');
		}

	});
	
	
	$(document).on("click",".addQuesCheckbox",countCheckbox);
	
	function countCheckbox(){
			var currentNumb =$('.addDocumentQuestion input[type="checkbox"]:checked').length;
			
			$(".numbQuesSelected").html(""+currentNumb);
			if(currentNumb >= $(".maxQuestion").html()){
				$('.addQuesCheckbox').each(function(){
					if($(this).prop("checked")!=true){
						$(this).attr("disabled",true);
					}
				});
			}else {
				$('.addQuesCheckbox').each(function(){
						$(this).attr("disabled",false);
				});
			}
			
			var currentNumbUpdate =$('.updateDocumentQuestion input[type="checkbox"]:checked').length;
			
			$(".numbQuesSelectedUpdate").html(""+currentNumbUpdate);
			if(currentNumbUpdate >= $(".maxQuestionUpdate").html()){
				$('.addQuesCheckbox').each(function(){
					if($(this).prop("checked")!=true){
						$(this).attr("disabled",true);
					}
				});
			}else {
				$('.addQuesCheckbox').each(function(){
						$(this).attr("disabled",false);
				});
			}
	}
	
	$(document).on("change",".partQuestion",function(){
		var part=$(".partQuestion").val();
		if(part==1){
			$(".maxQuestion").html("10");
		}else if(part==2){
			$(".maxQuestion").html("30");
		}else if(part==3){
			$(".maxQuestion").html("30");
		}else if(part==4){
			$(".maxQuestion").html("30");
		}else if(part==6){
			$(".maxQuestion").html("3");
		}else if(part==7){
			$(".maxQuestion").html("5");
		}else if(part=="test"){
			$(".maxQuestion").html("100");
		}
		if( part != "test" ){
			part = "part"+part;
		}
		$(".numbQuesSelected").html(0);
		
		getQuestion(part,"addDocumentQuestion");
	});
	
	$(document).on("click","#addQuestion",function addQuestion(){
		var type = $(this).attr("class");
		var add=0;
		if(type=="audio"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#audioId").val($(this).find("td").eq(0).html());
					add++;
				}
			});
		}else if(type=="paragraph"){
			$("table tr").each(function() {
				if ($(this).hasClass("selected")) {
					$("#paragraphId").val($(this).find("td").eq(0).html());
					add++;
				}
			});
		}
		
		if (add == 0 || add > 1) {
			alert("Select 1 question to add question!");
		} else {
			
			var part=$(".partQuestion").val();
			if( part != "test" ){
				part = "part"+part;
			}
			
			$(".numbQuesSelected").html(0);
			getQuestion(part,"addDocumentQuestion");
			
			$("#myModal-addDocumentQuestion").modal('toggle');
		}
	});
	
	$(document).on("click",".questionContent",function(){
		$(".answer"+$(this).attr("id")).toggle(400);
	});
	$(document).on("click",".testQuestionContent",function(){
		if($(this).hasClass("part1"))
			$(".testQuestionContent.part1 .testAnswer"+$(this).attr("id")).toggle(400);
		else if($(this).hasClass("part2"))
			$(".testQuestionContent.part2 .testAnswer"+$(this).attr("id")).toggle(400);
		else if($(this).hasClass("part3"))
			$(".testQuestionContent.part3 .testAnswer"+$(this).attr("id")).toggle(400);
		else if($(this).hasClass("part4"))
			$(".testQuestionContent.part4 .testAnswer"+$(this).attr("id")).toggle(400);
	});
	
	$(document).on("click",".questionContentUpdate",function(){
		$(".answerUpdate"+$(this).attr("id")).toggle(400);
	});
	
	$(document).on("click",".addQuestionButton",function(){
		var ids=[];
		var id=0;
		var type = $(this).attr("id");
		var part=$(".partQuestion").val();
		if( part != "test" ){
			part = "part"+part;
		}
		console.log("type "+type);
		if(type == "audio"){
			id=$("#audioId").val();
		}else if(type=="paragraph"){
			id=$("#paragraphId").val();
		}
		console.log("id"+id);
		if(part == "test"){
			$(".part1Questions .addDocumentQuestion input[class='addQuesCheckbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			ids.push(0);
			$(".part2Questions .addDocumentQuestion input[class='addQuesCheckbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			ids.push(0);
			$(".part3Questions .addDocumentQuestion input[class='addQuesCheckbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			ids.push(0);
			$(".part4Questions .addDocumentQuestion input[class='addQuesCheckbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
		}else{
			$(".addDocumentQuestion input[class='addQuesCheckbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
		}
		
		console.log(ids);
		if(ids.length<1){
			alert("hay chon cau can them!!!");
			return;
		}else{
			
			var verify = confirm("Hanh dong nay se xoa cac cau trong tai lieu hien tai, xac nhan them moi tu dau???");
			if(verify == true){
				addDocumentQuestion(type,part,id,ids);
			}
		}
		
	});
	
	function addDocumentQuestion(type,part,id,ids){
		$.ajax({
			url:'../addQuestionToDocument',
			type:'post',
			dataType: 'json',
			async:false,
			data:{
				type	:type,
				part	:part,
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
	
	function getQuestion(part,type){
		$.ajax({
			url : '../getQuestionToDocument',
			dataType : 'json',
			type : 'post',
			data : {
				type: part,
			}
		}).done(function(data) {
			console.log(data);
			if(data == "error"){
				alert("fail");
				return;
			}
			$(".listQuestions").empty();
			if(data != null){
				if(part=="test"){
					$.each(data,function(i,value){
						$(".listQuestions").append("Part "+(i+1)+":<div class=\"part"+(i+1)+"Questions\" style='max-height: 18em;overflow: auto;margin-bottom:2%;    border-bottom: 1px solid;'>");
						var question = "";
						if(value.length <1){
							$(".part"+(i+1)+"Questions").append("No question");
						}else{
							$.each(value,function(j,val){
								question = '<div class=\"question '+type+' question'+j+' row" '
								+'style="margin: 1% 0; border-bottom: 1px groove">'
								+'<input type="checkbox" id="'+val.id+'" class="addQuesCheckbox" style="width: 18px; height: 18px;margin-top: 0.3em;">'
								+'<div class="testQuestionContent part'+(i+1)+'" id="'+j+'" style="margin: 0 0 1% 2%;">'
								+'<span>Question: '+val.question+'</span>'
								+'<div class="answer testAnswer'+j+' row">'
								+'<div class="col-12"><input type="radio" name="question'+j+'" id="A'+j+'" disabled="disabled">A: '+val.a+' </div>'
								+'<div class="col-12"><input type="radio" name="question'+j+'" id="B'+j+'" disabled="disabled">B: '+val.b+'</div>'
								+'<div class="col-12"><input type="radio" name="question'+j+'" id="C'+j+'" disabled="disabled">C: '+val.c+'</div>';
								if(i!=1){
									question =question +'<div class="col-12"><input type="radio" name="question'+j+'" id="D'+j+'" disabled="disabled">D: '+val.d+'</div>'
								}
								question =question +'</div></div></div>';
								$(".part"+(i+1)+"Questions").append(question);
								$(".answer").css("display","none");
							});
							
						}
						$(".part"+(i+1)+"Questions").append("</div>");
						
					});
					$(".listQuestions").css({"overflow" : "" ,"height":'' });
				}else {
					$(".listQuestions").css({"overflow" : "auto" ,"height":'26em' });
					if(data.length <1 ){
						$(".listQuestions").append("No question");
					}else{
						$.each(data,function(i,val){
							var question="";
							if(part=="part2"){
								question = '<div class=\"question '+type+' question'+i+' row" '
											+'style="margin: 1% 0; border-bottom: 1px groove">'
											+'<input type="checkbox" id="'+val.id+'" class="addQuesCheckbox" style="width: 18px; height: 18px;margin-top: 0.3em;">'
											+'<div class="questionContent" id="'+i+'" style="  margin: 0 0 1% 2%;">'
											+'<span>Question: '+val.question+'</span>'
											+'<div class="answer answer'+i+' row">'
											+'<div class="col-12"><input type="radio" name="question'+i+'" id="A'+i+'" disabled="disabled">A: '+val.a+' </div>'
											+'<div class="col-12"><input type="radio" name="question'+i+'" id="B'+i+'" disabled="disabled">B: '+val.b+'</div>'
											+'<div class="col-12"><input type="radio" name="question'+i+'" id="C'+i+'" disabled="disabled">C: '+val.c+'</div>'
											+'</div></div></div>';
							}else if(part=="part6"){
								question = '<div class=\"question '+type+' question'+i+' row" '
								+'style="margin: 1% 0; border-bottom: 1px groove">'
								+'<input type="checkbox" id="'+val.id+'" class="addQuesCheckbox" style="width: 18px; height: 18px;margin-top: 0.3em;">'
								+'<div class="questionContent" id="'+i+'" style="  margin: 0 0 1% 2%;">'
								+'<span>Question:</span>'
								+'<div class="answer answer'+i+' row">'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="A'+i+'" disabled="disabled">A: '+val.a+' </div>'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="B'+i+'" disabled="disabled">B: '+val.b+'</div>'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="C'+i+'" disabled="disabled">C: '+val.c+'</div>'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="D'+i+'" disabled="disabled">D: '+val.d+'</div>'
								+'</div></div></div>';
							}else{
								question = '<div class=\"question '+type+' question'+i+' row" '
								+'style="margin: 1% 0; border-bottom: 1px groove">'
								+'<input type="checkbox" id="'+val.id+'" class="addQuesCheckbox" style="width: 18px; height: 18px;margin-top: 0.3em;">'
								+'<div class="questionContent" id="'+i+'" style="  margin: 0 0 1% 2%;">'
								+'<span>Question: '+val.question+'</span>'
								+'<div class="answer answer'+i+' row">'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="A'+i+'" disabled="disabled">A: '+val.a+' </div>'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="B'+i+'" disabled="disabled">B: '+val.b+'</div>'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="C'+i+'" disabled="disabled">C: '+val.c+'</div>'
								+'<div class="col-12"><input type="radio" name="question'+i+'" id="D'+i+'" disabled="disabled">D: '+val.d+'</div>'
								+'</div></div></div>';
							}
							$(".listQuestions").append(question);
							$(".answer").css("display","none");
						});
					}
					
				}
			}
			
			
		}).fail(function() {
			console.log("fail");
		});
	}

	$(document).on("click","#updateQuestion",function(){
		
			var type = $(this).attr("class");
			var id=0;
			var add=0;
			
			if(type=="audio"){
				
				$("table tr").each(function() {
					if ($(this).hasClass("selected")) {
						$("#audioIdUpdate").val($(this).find("td").eq(0).html());
						add++;
						
						currentPart=$(this).find("td").eq(3).html();
					}
				});
				
				id=$("#audioIdUpdate").val();
			}else if(type=="paragraph"){
				
				$("table tr").each(function() {
					if ($(this).hasClass("selected")) {
						$("#paragraphIdUpdate").val($(this).find("td").eq(0).html());
						add++;
						currentPart=$(this).find("td").eq(2).html();
					}
				});
				
				id=$("#paragraphIdUpdate").val();
			}
			
			if (add == 0 || add > 1) {
				alert("Select 1 row to update!");
			} else {
				
				if(currentPart==0){
					alert("Hãy thêm câu hỏi trước !!!");
					return;
				}
				console.log("opened "+openedId);
				if( openedId != id ){
					$(".listQuestionsUpdate").empty();
					$(".numbQuesSelectedUpdate").html(0);
					
					console.log("id "+id);
					getQuestionUpdate(type,id,"updateDocumentQuestion");
					
					openedId = id;
					if(currentPart == "In test"){
						part = "test";
					}else{
						part = "part" + currentPart;
					}
					getQuestion(part,"updateDocumentQuestion");
					
				}
				
				$("#myModal-updateDocumentQuestion").modal('toggle');
				
			}
			countCheckbox();
		
	});
	
	function getQuestionUpdate(type,id,kind){
		var part="";
		$.ajax({
			url : '../getCurrentQuestion',
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
			}
			var temp=[]; // save arr question
			if(type=="audio"){
				if(data.part1.length > 0 && data.part2.length >0){
					part = "test";
					$(".currentPart").html("In test");
					$(".currentPart").attr("id","test");
					$(".maxQuestionUpdate").html(100);
				}else if(data.part1.length >0){
					part = "part1";
					temp = data.part1;
					$(".currentPart").html("Part 1");
					$(".currentPart").attr("id","part1");
					$(".maxQuestionUpdate").html(10);
				}else if(data.part2.length >0){
					part = "part2";
					temp = data.part2;
					$(".currentPart").html("Part 2");
					$(".currentPart").attr("id","part2");
					$(".maxQuestionUpdate").html(30);
				}else if(data.part3.length >0){
					part = "part3";
					temp = data.part3;
					$(".currentPart").html("Part 3");
					$(".currentPart").attr("id","part3");
					$(".maxQuestionUpdate").html(30);
				}else if(data.part4.length >0){
					part = "part4";
					temp = data.part4;
					$(".currentPart").html("Part 4");
					$(".currentPart").attr("id","part4");
					$(".maxQuestionUpdate").html(30);
				} 
			}else if(type=="paragraph"){
				if(data.part6.length >0){
					part = "part6";
					temp = data.part6;
					$(".currentPart").html("Part 6");
					$(".currentPart").attr("id","part6");
					$(".maxQuestionUpdate").html(5);
				}else if(data.part7.length >0){
					part = "part7";
					temp = data.part7;
					$(".currentPart").html("Part 7");
					$(".currentPart").attr("id","part7");
					$(".maxQuestionUpdate").html(5);
				}
			}
			$(".numbQuesSelectedUpdate").html(""+temp.length);
			
			$(".currentQuestions").empty();
			
			if(temp!=null){
				if(part == "test"){
					for(j=1;j<=4;j++){
						
						if(j==1){
							temp=data.part1;
						}else if(j==2){
							temp=data.part2;
						}else if(j==3){
							temp=data.part3;
						}else if(j==4){
							temp=data.part4;
						}
						body='<div class="part'+j+'Test">Part '+j+':<br>';
						$.each(temp,function(i,val){
							var question="";
							question = '<div class=\"question '+kind+' question'+i+' row" '
							+'style="margin: 1% 0; border-bottom: 1px groove">'
							+'<input type="checkbox" id="'+val.id+'" class="addQuesCheckbox" checked style="width: 18px; height: 18px;margin-top: 0.3em;">'
							+'<div class="questionContentUpdate" id="'+i+'" style=" margin: 0 0 1% 2%;">'
							+'<span>Question: '+val.question +'</span><div class="answer answerUpdate'+i+' row">'
							+'<div class="col-12"><input type="radio" name="question'+i+'" id="A'+i+'" disabled="disabled">A: '+val.a+' </div>'
							+'<div class="col-12"><input type="radio" name="question'+i+'" id="B'+i+'" disabled="disabled">B: '+val.b+'</div>'
							+'<div class="col-12"><input type="radio" name="question'+i+'" id="C'+i+'" disabled="disabled">C: '+val.c+'</div>';
							if(part!="part2"){
								question= question +'<div class="col-12"><input type="radio" name="question'+i+'" id="D'+i+'" disabled="disabled">D: '+val.d+'</div>';
							}
							
							question= question+'</div></div></div>';
							
//							$(".currentQuestions").append(question);
							body=body+question;
							$(".answer").css("display","none");

						});
						$(".currentQuestions").append(body+'</div>');
					}
					
				}else{
					$.each(temp,function(i,val){
						var question="";
						question = '<div class=\"question '+kind+' question'+i+' row" '
						+'style="margin: 1% 0; border-bottom: 1px groove">'
						+'<input type="checkbox" id="'+val.id+'" class="addQuesCheckbox" checked style="width: 18px; height: 18px;margin-top: 0.3em;">'
						+'<div class="questionContentUpdate" id="'+i+'" style=" margin: 0 0 1% 2%;">'
						+'<span>Question: '+val.question +'</span><div class="answer answerUpdate'+i+' row">'
						+'<div class="col-12"><input type="radio" name="question'+i+'" id="A'+i+'" disabled="disabled">A: '+val.a+' </div>'
						+'<div class="col-12"><input type="radio" name="question'+i+'" id="B'+i+'" disabled="disabled">B: '+val.b+'</div>'
						+'<div class="col-12"><input type="radio" name="question'+i+'" id="C'+i+'" disabled="disabled">C: '+val.c+'</div>';
						if(part!="part2"){
							question= question +'<div class="col-12"><input type="radio" name="question'+i+'" id="D'+i+'" disabled="disabled">D: '+val.d+'</div>';
						}
						
						question= question+'</div></div></div>';
						
						$(".currentQuestions").append(question);
						$(".answer").css("display","none");

					});
				}
				
			}else{
				$(".currentQuestions").append("No data.");
			}
			
		}).fail(function() {
			console.log("fail");
		});
		countCheckbox();
		return part;
	}
	
	$(document).on("click", ".updateQuestionSubmit", function() {
		
		var ids=[];
		var id=0;
		var type = $(this).attr("id");
		console.log("type "+type);
		if(type == "audio"){
			id=$("#audioIdUpdate").val();
		}else if(type=="paragraph"){
			id=$("#paragraphIdUpdate").val();
		}
		
		console.log("id"+id);
		var part=$(".currentPart").attr("id");
		if(part == "test"){
			$(".part1Test .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			$(".part1Questions .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			
			ids.push(0);
			
			$(".part2Test .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			$(".part2Questions .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			
			ids.push(0);
			
			$(".part3Test .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			$(".part3Questions .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			
			ids.push(0);
			
			$(".part4Test .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			$(".part4Questions .updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
			
		}else{
			$(".updateDocumentQuestion input[type='checkbox']:checked").each(function(){
				ids.push($(this).attr("id"));
			});
		}
		
		console.log(ids);
		if(ids.length<1){
			alert("hay chon cau can cap nhat cau hoi!!!");
			return;
		}else{
			
			var verify = confirm(" xac nhan cap nhat???");
			if(verify == true){
				updateDocumentQuestion(type,part,id,ids);
			}
		}
		
	});
	
	function updateDocumentQuestion(type,part,id,ids){
		$.ajax({
			url:'../updateQuestionToDocument',
			type:'post',
			dataType: 'json',
			async: false,
			data:{
				type	:type,
				part	:part,
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
	
	$(document).on("click", ".updateButton", function () {
		
		var type = $(this).attr("id");
		var image = "";
		var question;
		if (type == "part1") {

			if ($("#editImage").val() == "") {
				var arr = $("#viewEditImage img").attr("src").split("/");

				for (var i = 2; i < arr.length; i++) {
					if (i == arr.length - 1) {
						image = image + arr[i];
						break;
					}
					image = image + arr[i] + "/";

				}

			} else {
				image = uploadImage('#editImage');
			}

			console.log($(".editAudio").html())
			var editAudio = {
				"id" : $(".editAudio audio").attr("id")
			}
			question = {
				"id" : $("#editId").val(),
				"question" : $("#editQuestion").val(),
				"a" : $("#editA").val(),
				"b" : $("#editB").val(),
				"c" : $("#editC").val(),
				"d" : $("#editD").val(),
				"rightAnswer" : $("#editRightAnswer").val(),
				"image" : image,
				"audioPart1" : editAudio
			};

			console.log(question);

			$.ajax({
				url : '../updateQuestion',
				dataType : 'json',
				type : 'post',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					question : question
				}),

			}).done(function(data) {
				if(data == "error"){
					alert("fail");
					return;
				}
				alert("success");
				location.reload();
				
			}).fail(function() {
				console.log("fail");
			});

		} else if (type == "part2") {
			question = {
				"id" : $("#editId").val(),
				"question" : $("#editQuestion").val(),
				"a" : $("#editA").val(),
				"b" : $("#editB").val(),
				"c" : $("#editC").val(),
				"rightAnswer" : $("#editRightAnswer").val(),
			};
			$.ajax({
				url : '../updatePart2',
				dataType : 'json',
				type : 'post',
				contentType : 'application/json;charset=utf-8',
				data : JSON.stringify({
					question2 : question
				}),

			}).done(function(data) {
				console.log("done");
			}).fail(function() {
				console.log("fail");
			});
		}else if(type=="part3"){
			question = {
					"id" : $("#editId").val(),
					"question" : $("#editQuestion").val(),
					"a" : $("#editA").val(),
					"b" : $("#editB").val(),
					"c" : $("#editC").val(),
					"d" : $("#editD").val(),
					"rightAnswer" : $("#editRightAnswer").val(),
				};
				$.ajax({
					url : '../updatePart3',
					dataType : 'json',
					type : 'post',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						question3 : question
					}),

				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.reload();
				}).fail(function() {
					console.log("fail");
				});
		}else if(type=="part4"){
			question = {
					"id" : $("#editId").val(),
					"question" : $("#editQuestion").val(),
					"a" : $("#editA").val(),
					"b" : $("#editB").val(),
					"c" : $("#editC").val(),
					"d" : $("#editD").val(),
					"rightAnswer" : $("#editRightAnswer").val(),
				};
				$.ajax({
					url : '../updatePart4',
					dataType : 'json',
					type : 'post',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						question4 : question
					}),

				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.reload();
				}).fail(function() {
					console.log("fail");
				});
		}else if(type=="part5"){
			question = {
					"id" : $("#editId").val(),
					"question" : $("#editQuestion").val(),
					"a" : $("#editA").val(),
					"b" : $("#editB").val(),
					"c" : $("#editC").val(),
					"d" : $("#editD").val(),
					"rightAnswer" : $("#editRightAnswer").val(),
				};
				$.ajax({
					url : '../updatePart5',
					dataType : 'json',
					type : 'post',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						question5 : question
					}),

				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.reload();
				}).fail(function() {
					alert("fail");
				});
		}else if(type=="part6"){
			question = {
					"id" : $("#editId").val(),
					"a" : $("#editA").val(),
					"b" : $("#editB").val(),
					"c" : $("#editC").val(),
					"d" : $("#editD").val(),
					"rightAnswer" : $("#editRightAnswer").val(),
				};
				$.ajax({
					url : '../updatePart6',
					dataType : 'json',
					type : 'post',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						question6 : question
					}),

				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.reload();
				}).fail(function() {
					alert("fail");
				});
		}else if(type=="part7"){
			question = {
					"id" : $("#editId").val(),
					"question" : $("#editQuestion").val(),
					"a" : $("#editA").val(),
					"b" : $("#editB").val(),
					"c" : $("#editC").val(),
					"d" : $("#editD").val(),
					"rightAnswer" : $("#editRightAnswer").val(),
				};
				$.ajax({
					url : '../updatePart7',
					dataType : 'json',
					type : 'post',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						question7 : question
					}),

				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.reload();
				}).fail(function() {
					console.log("fail");
				});
		}else if(type=="audio"){
			$(document).on("click","#editAudio",uploadAudio);
			if( audioLocation == undefined){
				audioLocation="";
				var arr = $("#viewEditAudio audio source").attr("src").split("/");

				for (var i = 2; i < arr.length; i++) {
					if (i == arr.length - 1) {
						audioLocation = audioLocation + arr[i];
						break;
					}
					audioLocation = audioLocation + arr[i] + "/";

				}
				console.log(audioLocation);
			}
			
			audio = {
					"id" : $("#editId").val(),
					"audio" : audioLocation,
					"script" : CKEDITOR.instances.editScript.getData(),
				};
					$.ajax({
						url : '../updateAudio',
						dataType : 'json',
						type : 'post',
						contentType : 'application/json;charset=utf-8',
						data : JSON.stringify({
							audio : audio
						}),

					}).done(function(data) {
						if(data == "error"){
							alert("fail");
							return;
						}
						alert("success");
						location.reload();
					}).fail(function() {
						console.log("fail");
					});
			
			
		}else if(type=="paragraph"){
			paragraph = {
					"id" : $("#editId").val(),
					"paragraph" : CKEDITOR.instances.editParagraph.getData(),
				};
				$.ajax({
					url : '../updateParagraph',
					dataType : 'json',
					type : 'post',
					contentType : 'application/json;charset=utf-8',
					data : JSON.stringify({
						paragraph : paragraph
					}),

				}).done(function(data) {
					if(data == "error"){
						alert("fail");
						return;
					}
					alert("success");
					location.reload();
				}).fail(function() {
					console.log("fail");
				});
		}

	});
	
	//DELETE

	$(document).on("click", "#delete", function() {
		var deleted = [];
		var type = $(this).attr("class");
		$("table tr").each(function() {
			if ($(this).hasClass("selected")) {
				deleted.push($(this).find("td").eq(0).html());
			}
		});

		if (deleted.length == 0) {
			alert("Select 1 question to delete!");
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
					alert("Không thành công. Câu hỏi có thể nằm trong tài liệu khác. Hãy chắc rằng câu hỏi không nằm trong bất cứ tài liệu nào. Xin thử lại!");
			}).fail(function() {
				console.log("fail");
				alert("fail");
			});
		}
	});
	
	function uploadAudio() {
		id=$(this).attr("id");
		var formAudio = new FormData();
		if ($('#'+id).prop('files').length > 0) {
			audio = $('#'+id).prop("files")[0];
			formAudio.append("file", audio);
			console.log(formAudio);
			$.ajax({
				url : '../../uploadFile/audio',
				type : 'post',
				dataType : 'json',
				async : false,
				data : formAudio,
				processData : false,
				contentType : false
			}).done(function(data) {
				console.log(data);
				audioLocation = data;
				
			}).fail(function() {
				console.log("error");
				
			});
		}
	};
	

	function uploadImage(id) {
		var formData = new FormData();
		var result = null;
		if ($(id).prop('files').length > 0) {
			image = $(id).prop('files')[0];
			formData.append("file", image);

			$.ajax({
				url : '../../uploadFile/image',
				type : 'post',
				dataType : 'json',
				data : formData,
				async : false,
				processData : false,
				contentType : false

			}).done(function(data) {
				if (data == "error") {
					return result;
				}
				result = data;
			}).fail(function() {
				console.log("error");
			});
			return result;
		}
	}
	
});
