$(document).ready(function(){
	var rightAnswer= new Array();
	var mark=0;
	var listQuesions=$(".listQuesions");
	var part_list=$(".part-list");
	
	$(document).on("click",".readingPractice", function () {
		// doi voi the li phai lay qua thuoc tinh
		var idPrac= $(this).attr('value');
		var part=$("span#practice"+idPrac).attr('class');
		var name=$("span#practice"+idPrac).html();
		if(part==5){
			location.href="/webtoeicproject/practice/5/"+name+"/"+idPrac;
		}else if(part==6){
			location.href="/webtoeicproject/practice/6/"+name+"/"+idPrac;
		}else if(part==7){
			location.href="/webtoeicproject/practice/7/"+name+"/"+idPrac;
		}
		
	});
	
	var url = window.location.href;
	var tempArray = url.split("/");
	var id = tempArray[tempArray.length -1];
	var part=$(".practicePart").attr("id");
	if(part==5){
		 loadPart5(id,part);
	}else if(part==6){
		 loadPart6(id,part);
	}else if(part==7){
		 loadPart7(id,part);
	}
	
	
	
	
// khi an nut submit
	$(document).on("click","#submitPractice",function(){
		markAnswer();
	});
	
// ham dem nguoc thoi gian
	function timeout(minute){
		// js dem nguoc thoi gian
		// thiet lap thoi gian dem nguoc
		var coundownTime= new Date().getTime()+minute*60*1000 +1000;

		// countdown each 1 second
		var x=setInterval(function(){

			var now = new Date().getTime();

			var distance= coundownTime - now;

			var hours=Math.floor(distance/3600000); // milisecond

			var minutes = Math.floor((distance % 3600000)/60000 );

			var seconds = Math.floor( (distance % 60000)/1000 );

			// hien len html
			$("#time").html( hours +":"+minutes + ":" + seconds);
			
			// neu het gio bao het gio
			
			if(distance < 0 ){
				clearInterval(x);
				$("#time").html("EXPIRED");
				markAnswer();
			}

		},1000);
	}
	
	
// ham cham diem
	function markAnswer() {
			$.each(rightAnswer, function(i, val) {
				var check= $('[name=\'option'+i+'\']');
				var right=rightAnswer[i]+i;
				for (var j = 0; j < check.length; j++) {
					
					if(check[j].checked){
						var id=check[j].value+i;
						
						console.log(id);
						if(check[j].value === rightAnswer[i]){
								mark++;
								$('span#'+id).css("background-color", "#04ec04");
						}else{
							$('span#'+id).css("background-color", "#ff4444");
						}
					}
				}
				$('span#'+right).css("background-color", "#04ec04");
			});
			alert("Your mark: "+mark+"/"+rightAnswer.length);
		}
	
	function loadPart5(idPrac,part){
		$.ajax({
			url: '/webtoeicproject/readingPractice',
			type: 'post',
			dataType: 'json',
			data: {id: idPrac,
				part: part},
			error: function(e) {
				console.log(e);
			}
		})
		.done(function(data) {
			console.log("success");
			if(data !=null){
				console.log(data);
				listQuesions.empty();
				var body="";
				listQuesions.append("<h5>"+name+"</h5><hr>")
				$.each(data, function(i, val) {
					body='<div class="question"'+(i+1)+'"><p class="cauhoi"><span>Question '+(i+1)+': </span>'+val.question+' </p>'
							+'<div class="dapan"><div class="col-6 col-sm-6 col-xs-6 col-lg-6 A">'
							+'<input type="radio" name="option'+i+'" value="A"><span id="A'+i+'">A. '+val.a+'</span></div>'
							+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 B">'
							+'<input type="radio" name="option'+i+'" value="B"><span id="B'+i+'">B. '+val.b+'</span></div>'
							+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 C">'
							+'<input type="radio" name="option'+i+'" value="C"><span id="C'+i+'">C. '+val.c+'</span></div>'
							+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 D">'
							+'<input type="radio" name="option'+i+'" value="D"><span id="D'+i+'">D. '+val.d+'</span></div>'
							+'</div></div>'
							listQuesions.append(body);
					rightAnswer.push(val.rightAnswer);
				});
				listQuesions.append('<button class="btn btn-primary submit" id="submitPractice">Submit</button>');
				

				part_list.append('<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">'
						+'<div class="box-answer"><div class="header">'
						+'<p id="time" style="margin-bottom: 0;">0:5:00</p>'
						+'</div></div></div>');
	// bat dau tinh gio
				timeout(5);
			}else{
				alert("khong co du lieu");
			}
		})
		.fail(function() {
			console.log("error");
			alert("xay ra loi. xin thu lai!!");
		});
	}

	function loadPart6(idPrac,part){
		$.ajax({
			url: '/webtoeicproject/readingPractice',
			type: 'post',
			dataType: 'json',
			data: {id: idPrac,
				part: part},
			error: function(e) {
				console.log(e);
			}
		})
		.done(function(data) {
			console.log("success");
			if(data !=null){
				console.log(data);
				listQuesions.empty();
				var body="";
				listQuesions.append("<h5>"+name+"</h5>");
				var question_numb=1;
				$.each(data, function(i, val) {
					listQuesions.append("<hr><div class=\"paragraph para"+i+"\">"+val.paragraph+"</div><br>");
					$.each(val.part6, function(k, gt) {
						body='<div class="question"'+question_numb+'"><div class="question'+(k+1)+'"><p class="cauhoi"><span>Question '+(k+1)+':'
						+'<div class="dapan"><div class="col-6 col-sm-6 col-xs-6 col-lg-6 A">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="A"><span id="A'+(question_numb-1)+'">A. '+gt.a+'</span></div>'
						+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 B">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="B"><span id="B'+(question_numb-1)+'">B. '+gt.b+'</span></div>'
						+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 C">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="C"><span id="C'+(question_numb-1)+'">C. '+gt.c+'</span></div>'
						+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 D">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="D"><span id="D'+(question_numb-1)+'">D. '+gt.d+'</span></div>'
						+'</div></div></div>'
						listQuesions.append(body);
						rightAnswer.push(gt.rightAnswer);
						question_numb++;
					});
					
				});
				listQuesions.append('<button class="btn btn-primary submit" id="submitPractice">Submit</button>');
				

				part_list.append('<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">'
						+'<div class="box-answer"><div class="header">'
						+'<p id="time" style="margin-bottom: 0;">0:5:00</p>'
						+'</div></div></div>');
	// bat dau tinh gio
				timeout(5);
			}else{
				alert("khong co du lieu");
			}
		})
		.fail(function() {
			console.log("error");
			alert("xay ra loi. xin thu lai!!");
		});
	}

	function loadPart7(idPrac,part){
		$.ajax({
			url: '/webtoeicproject/readingPractice',
			type: 'post',
			dataType: 'json',
			data: {id: idPrac,
				part: part},
			error: function(e) {
				console.log(e);
			}
		})
		.done(function(data) {
			console.log("success");
			if(data !=null){
				console.log(data);
				listQuesions.empty();
				var body="";
				listQuesions.append("<h5>"+name+"</h5>");
				var question_numb=1;
				$.each(data, function(i, val) {
					$.each(val, function(j, val) {
						listQuesions.append("<hr><div class=\"paragraph para"+i+"\">"+val.paragraph+"</div><br>");
							$.each(val.part7, function(k, gt) {
								body='<div class="question"'+question_numb+'"><div class="question'+(k+1)+'"><p class="cauhoi"><span>Question '+(k+1)+': </span>'+gt.question
								+'<div class="dapan"><div class="col-12 col-sm-12 col-xs-12 col-lg-12 A">'
								+'<input type="radio" name="option'+(question_numb-1)+'" value="A"><span id="A'+(question_numb-1)+'">A. '+gt.a+'</span></div>'
								+'<div class="col-12 col-sm-12 col-xs-12 col-lg-12 B">'
								+'<input type="radio" name="option'+(question_numb-1)+'" value="B"><span id="B'+(question_numb-1)+'">B. '+gt.b+'</span></div>'
								+'<div class="col-12 col-sm-12 col-xs-12 col-lg-12 C">'
								+'<input type="radio" name="option'+(question_numb-1)+'" value="C"><span id="C'+(question_numb-1)+'">C. '+gt.c+'</span></div>'
								+'<div class="col-12 col-sm-12 col-xs-12 col-lg-12 D">'
								+'<input type="radio" name="option'+(question_numb-1)+'" value="D"><span id="D'+(question_numb-1)+'">D. '+gt.d+'</span></div>'
								+'</div></div></div>'
								listQuesions.append(body);
								rightAnswer.push(gt.rightAnswer);
								question_numb++;
							});
					});
					
				});
				listQuesions.append('<button class="btn btn-primary submit" id="submitPractice">Submit</button>');
				

				part_list.append('<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">'
						+'<div class="box-answer"><div class="header">'
						+'<p id="time" style="margin-bottom: 0;">0:5:00</p>'
						+'</div></div></div>');
	// bat dau tinh gio
				timeout(5);
			}else{
				alert("khong co du lieu");
			}
		})
		.fail(function() {
			console.log("error");
			alert("xay ra loi. xin thu lai!!");
		});
	}

});

