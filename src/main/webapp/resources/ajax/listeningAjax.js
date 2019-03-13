$(document).ready(function(){
		var part = $(".audio").attr("id");
		var id=$("#title").attr("class");
		var rightAnswer= new Array();
		
		if(part==3 || part ==4){
			loadPart3_4(id,rightAnswer);
		}else if(part ==1){
			loadPart1(id,rightAnswer);
		}else if(part ==2){
			loadPart2(id,rightAnswer);
		}
		console.log(rightAnswer);
		
		$(document).on("click", ".submit",function(){
			markAnswer(rightAnswer);
			if(part==2) {
				$(".questionContent").css("display","inline-block");
			}
		});
	});

//load part3
function loadPart3_4(id,rightAnswer){
	$.ajax({
		url: '../'+id,
		type: 'POST',
		dataType: 'json',
		error: function(e){
			console.log(e);
		}
	})
	.done(function(data) {
		console.log(data);
		var content="";
		$.each(data, function(i, val) {
			 content="<hr><p class=\"cauhoi\">"
					+"<span>Question "+(i+1)+": </span>"+val.question+"</p>"
					+"<div class=\"dapan\">"
					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 A\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"A\">A.<span id=\"A"+i+"\"> "+val.a+"</span></div>"

					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 B\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"B\">B.<span id=\"B"+i+"\"> "+val.b+"</span></div>"

					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 C\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"C\">C.<span id=\"C"+i+"\"> "+val.c+"</span></div>"

					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 D\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"D\">D.<span id=\"D"+i+"\"> "+val.d+"</span></div>"
					+"</div>"
			 
			 $(".question").append(content);
			 rightAnswer.push(val.rightAnswer);
		});
		$('.dapan span').css("display","none");
		
		coundown(5);
		
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
}
//load part2
function loadPart2(id,rightAnswer){
	$.ajax({
		url: '../'+id,
		type: 'POST',
		dataType: 'json',
		error: function(e){
			console.log(e);
		}
	})
	.done(function(data) {
		console.log(data);
		var content="";
		$.each(data, function(i, val) {
			content="<hr><p class=\"cauhoi\">"
				+"<span>Question "+(i+1)+": </span><span class=\"questionContent\">"+val.question+"</span></p>"
				+"<div class=\"dapan\">"
				+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 A\">"
				+"<input type=\"radio\" name=\"option"+i+"\" value=\"A\">A.<span id=\"A"+i+"\"> "+val.a+"</span></div>"
				
				+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 B\">"
				+"<input type=\"radio\" name=\"option"+i+"\" value=\"B\">B.<span id=\"B"+i+"\"> "+val.b+"</span></div>"
				
				+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 C\">"
				+"<input type=\"radio\" name=\"option"+i+"\" value=\"C\">C.<span id=\"C"+i+"\"> "+val.c+"</span></div>"
				+"</div>"
				
				$(".question").append(content);
			rightAnswer.push(val.rightAnswer);
		});
		$('.dapan span').css("display","none");
		$(".questionContent").css("display","none");
		
		coundown(5);
		
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
}

//load part1
function loadPart1(id,rightAnswer){
	$.ajax({
		url: '../'+id,
		type: 'POST',
		dataType: 'json',
		error: function(e){
			console.log(e);
		}
	})
	.done(function(data) {
		console.log(data);
		var content="";
		$.each(data, function(i, val) {
			 content="<hr><img src=\"../../../"+val.image+"\" height=\"100px\" width=\"150px\">"
				 	+"<p class=\"cauhoi\">"
					+"<span>Question "+(i+1)+": </span>"+val.question+"</p>"
					+"<div class=\"dapan\">"
					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 A\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"A\">A. <span id=\"A"+i+"\">"+val.a+"</span></div>"

					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 B\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"B\">B. <span id=\"B"+i+"\">"+val.b+"</span></div>"

					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 C\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"C\">C. <span id=\"C"+i+"\">"+val.c+"</span></div>"

					+"<div class=\"col-12 col-sm-12 col-xs-12 col-lg-12 D\">"
					+"<input type=\"radio\" name=\"option"+i+"\" value=\"D\">D. <span id=\"D"+i+"\">"+val.d+"</span></div>"
					+"</div>"
			 $(".question").append(content);
			 rightAnswer.push(val.rightAnswer);
		});
		$('.dapan span').css("display","none");
		coundown(5);
		
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
}


//ham cham diem
function markAnswer(rightAnswer) {
	var mark=0;
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
		$('.dapan span').css("display","inline-block");
		alert("Your mark: "+mark+"/"+rightAnswer.length);
	}

	function coundown(time){
		// js dem nguoc thoi gian
		// thiet lap thoi gian dem nguoc
		var coundownTime= new Date().getTime()+time*60000+1000;

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
				$("#time").html("TIME OUT");
				markAnswer();
			}

		},1000);
	}