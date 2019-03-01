$(document).ready(function(){
	var rightAnswer= new Array();
	var mark=0;
	var question=$(".question");
	var part_list=$(".part-list");
	$(document).on("click",".readingPractice", function () {
//		doi voi the li phai lay qua thuoc tinh
		var name=$(this).html();
		
		var idPrac= $(this).attr('value');
		var part=$(".readingPractice span:first").attr('class');
		
		if(part==5){
			loadPart5(idPrac,part);
		}else if(part==6){
			loadPart6(idPrac,part);
		}else if(part==7){
			loadPart7(idPrac,part);
		}
		
	});
	
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
				question.empty();
				var body="";
				question.append("<h5>"+name+"</h5>")
				$.each(data, function(i, val) {
					body='<p class="cauhoi"><span>Question '+(i+1)+': </span>'+val.question+' </p>'
							+'<div class="dapan"><div class="col-6 col-sm-6 col-xs-6 col-lg-6 A">'
							+'<input type="radio" name="option'+i+'" value="A"><span id="A'+i+'">A. '+val.a+'</span></div>'
							+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 B">'
							+'<input type="radio" name="option'+i+'" value="B"><span id="B'+i+'">B. '+val.b+'</span></div>'
							+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 C">'
							+'<input type="radio" name="option'+i+'" value="C"><span id="C'+i+'">C. '+val.c+'</span></div>'
							+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 D">'
							+'<input type="radio" name="option'+i+'" value="D"><span id="D'+i+'">D. '+val.d+'</span></div>'
							+'</div>'
							question.append(body);
					rightAnswer.push(val.rightAnswer);
				});
				question.append('<button class="btn btn-primary submit" id="nopbai">Submit</button>');
				

				part_list.append('<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">'
						+'<div class="box-answer"><div class="header">'
						+'<p id="time" style="margin-bottom: 0;">0:5:00</p>'
						+'</div></div></div>');
//				bat dau tinh gio
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
				question.empty();
				var body="";
				question.append("<h5>"+name+"</h5>");
				$.each(data, function(i, val) {
					$.each(val, function(j, value) {
						if(j==0){
							console.log(value);
							question.append("<p>"+value.paragraph+"</p>")
						}
						if(j==1){
							$.each(value, function(k, gt) {
								body='<p class="cauhoi"><span>Question '+(k+1)+':'
								+'<div class="dapan"><div class="col-6 col-sm-6 col-xs-6 col-lg-6 A">'
								+'<input type="radio" name="option'+k+'" value="A"><span id="A'+i+'">A. '+gt.a+'</span></div>'
								+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 B">'
								+'<input type="radio" name="option'+k+'" value="B"><span id="B'+i+'">B. '+gt.b+'</span></div>'
								+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 C">'
								+'<input type="radio" name="option'+k+'" value="C"><span id="C'+i+'">C. '+gt.c+'</span></div>'
								+'<div class="col-6 col-sm-6 col-xs-6 col-lg-6 D">'
								+'<input type="radio" name="option'+k+'" value="D"><span id="D'+i+'">D. '+gt.d+'</span></div>'
								+'</div>'
								question.append(body);
								rightAnswer.push(gt.rightAnswer);
							});
						}
					});
					
				});
				question.append('<button class="btn btn-primary submit" id="nopbai">Submit</button>');
				

				part_list.append('<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">'
						+'<div class="box-answer"><div class="header">'
						+'<p id="time" style="margin-bottom: 0;">0:5:00</p>'
						+'</div></div></div>');
//				bat dau tinh gio
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
				question.empty();
				var body="";
				question.append("<h5>"+name+"</h5>");
				$.each(data, function(i, val) {
					$.each(val, function(j, value) {
						if(j==0){
							console.log(value);
							question.append("<p>"+value.paragraph+"</p>")
						}
						if(j==1){
							$.each(value, function(k, gt) {
								body='<p class="cauhoi"><span>Question '+(k+1)+': </span>'+gt.question+' </p>'
								+'<div class="dapan"><div class="col-12 col-sm-12 col-xs-12 col-lg-12 A">'
								+'<input type="radio" name="option'+k+'" value="A"><span id="A'+i+'">A. '+gt.a+'</span></div>'
								+'<div class="col-12 col-sm-12 col-xs-12 col-lg-12 B">'
								+'<input type="radio" name="option'+k+'" value="B"><span id="B'+i+'">B. '+gt.b+'</span></div>'
								+'<div class="col-12 col-sm-12 col-xs-12 col-lg-12 C">'
								+'<input type="radio" name="option'+k+'" value="C"><span id="C'+i+'">C. '+gt.c+'</span></div>'
								+'<div class="col-12 col-sm-12 col-xs-12 col-lg-12 D">'
								+'<input type="radio" name="option'+k+'" value="D"><span id="D'+i+'">D. '+gt.d+'</span></div>'
								+'</div>'
								question.append(body);
								rightAnswer.push(gt.rightAnswer);
							});
						}
					});
					
				});
				question.append('<button class="btn btn-primary submit" id="nopbai">Submit</button>');
				

				part_list.append('<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">'
						+'<div class="box-answer"><div class="header">'
						+'<p id="time" style="margin-bottom: 0;">0:5:00</p>'
						+'</div></div></div>');
//				bat dau tinh gio
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
//	khi an nut submit
	$(document).on("click","#nopbai",function(){
		markAnswer()
	});
	
//	ham dem nguoc thoi gian
	function timeout(minute){
		// js dem nguoc thoi gian
		//thiet lap thoi gian dem nguoc
		var coundownTime= new Date().getTime()+minute*60*1000;

		// countdown each 1 second
		var x=setInterval(function(){

			var now = new Date().getTime();

			var distance= coundownTime - now;

			var hours=Math.floor(distance/3600000); //milisecond

			var minutes = Math.floor((distance % 3600000)/60000 );

			var seconds = Math.floor( (distance % 60000)/1000 );

			//hien len html
			$("#time").html( hours +":"+minutes + ":" + seconds);

			//neu het gio bao het gio
			
			if(distance < 0 ){
				clearInterval(x);
				$("#time").html("EXPIRED");
				markAnswer();
			}

		},1000);
	}
	
	
//	ham cham diem
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
});
