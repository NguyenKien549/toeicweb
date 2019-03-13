$(".partContent").css("display", "none");
$(".part1").css("display", "block");


$(document).ready(function() {
	$(document).on('click', '.part', function() {
		var part = $(this).attr("id");
		$(".partContent").css("display", "none");
		if(part == "part5" || part == "part6" || part == "part7"){
			$(".playAudio").trigger("pause");
			$(".listeningContent").css("display", "none");
		}else {
			$(".listeningContent").css("display", "block");
		}
		if( $(".partContent").hasClass(part) ){
			$("."+part).css("display", "block");
		}
	});
	
	var testId = $(".listQuestions").attr("id");
	var question_numb=1;
	var rightAnswer=[];
		$.ajax({
			url: '/webtoeicproject/user/test/'+testId+'/part',
			type: 'get',
			dataType: 'json',
		})
		.done(function(data) {
			console.log(data);
			var content="";
			
			$(".part1.partContent").append('<hr><h2 id="title">Part 1: Photo</h2><div class="part1_Ques">');
			$.each(data.audio.part1, function(i, val) {
				content='<hr><div class=\"question'+question_numb+'\">'
						+'<img src="../../../'+val.image+'" width="500px" height="300px" style="margin-left: 15%">'

						+'<p class="cauhoi"><span>Question '+question_numb+':</span> '+val.question+'</p>'
						+'<div class="dapan"><div class="col-12 A">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
						+'A. <span id="A'+(question_numb-1)+'">'+val.a+'</span></div>'
						+'<div class="col-12 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
						+'B. <span id="B'+(question_numb-1)+'">'+val.b+'</span></div>'
						+'<div class="col-12 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
						+'C. <span id="C'+(question_numb-1)+'">'+val.c+'</span></div>'
						+'<div class="col-12 D"><input type="radio" name="option'+(question_numb-1)+'" value="D">'
						+'D. <span id="D'+(question_numb-1)+'">'+val.d+'</span></div>'
						+'</div></div>'
				$(".part1_Ques").append(content);
				question_numb++;
				rightAnswer.push(val.rightAnswer);
			});
			$(".part1.partContent").append('</div>');

			$(".part2.partContent").append('<hr><h2 id="title">Part 2: Question-Response</h2><div class="part2_Ques">');
			$.each(data.audio.part2, function(i, val) {
				content='<hr><div class=\"question'+question_numb+'\">'
						+'<p class="cauhoi"><span>Question '+question_numb+':</span> '+val.question+'</p>'
						+'<div class="dapan"><div class="col-12 A">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
						+'A. <span id="A'+(question_numb-1)+'">'+val.a+'</span></div>'
						+'<div class="col-12 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
						+'B. <span id="B'+(question_numb-1)+'">'+val.b+'</span></div>'
						+'<div class="col-12 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
						+'C. <span id="C'+(question_numb-1)+'">'+val.c+'</span></div>'
						+'</div></div>'
				$(".part2_Ques").append(content);
				question_numb++;
				rightAnswer.push(val.rightAnswer);
			});
			$(".part2.partContent").append('</div>');
			// hide answer
			$('.dapan span').css("display","none");

			$(".part3.partContent").append('<hr><h2 id="title">Part 3: Short conversation</h2><div class="part3_Ques">');
			$.each(data.audio.part3, function(i, val) {
				content='<hr><div class=\"question'+question_numb+'\">'
						+'<p class="cauhoi"><span>Question '+question_numb+':</span> '+val.question+'</p>'
						+'<div class="dapan"><div class="col-12 A">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
						+'A. <span id="A'+(question_numb-1)+'">'+val.a+'</span></div>'
						+'<div class="col-12 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
						+'B. <span id="B'+(question_numb-1)+'">'+val.b+'</span></div>'
						+'<div class="col-12 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
						+'C. <span id="C'+(question_numb-1)+'">'+val.c+'</span></div>'
						+'<div class="col-12 D"><input type="radio" name="option'+(question_numb-1)+'" value="D">'
						+'D. <span id="D'+(question_numb-1)+'">'+val.d+'</span></div>'
						+'</div></div>'
				$(".part3_Ques").append(content);
				question_numb++;
				rightAnswer.push(val.rightAnswer);
			});
			$(".part3.partContent").append('</div>');
			
			
			$(".part4.partContent").append('<hr><h2 id="title">Part 4: Short talk</h2><div class="part4_Ques">');
			$.each(data.audio.part4, function(i, val) {
				content='<hr><div class=\"question'+question_numb+'\">'
						+'<p class="cauhoi"><span>Question '+question_numb+':</span> '+val.question+'</p>'
						+'<div class="dapan"><div class="col-12 A">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
						+'A. <span id="A'+(question_numb-1)+'">'+val.a+'</span></div>'
						+'<div class="col-12 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
						+'B. <span id="B'+(question_numb-1)+'">'+val.b+'</span></div>'
						+'<div class="col-12 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
						+'C. <span id="C'+(question_numb-1)+'">'+val.c+'</span></div>'
						+'<div class="col-12 D"><input type="radio" name="option'+(question_numb-1)+'" value="D">'
						+'D. <span id="D'+(question_numb-1)+'">'+val.d+'</span></div>'
						+'</div></div>'
				$(".part4_Ques").append(content);
				question_numb++;
				rightAnswer.push(val.rightAnswer);
			});
			$(".part4.partContent").append('</div>');
			
			
			$(".part5.partContent").append('<hr><h2 id="title">Part 5: Incomplete Sentence</h2><div class="part5_Ques">');


			$.each(data.listPart5, function(i, val) {
				
				content='<hr><div class=\"question'+question_numb+'\">'
						+'<p class="cauhoi"><span>Question '+question_numb+':</span> '+val.question+'</p>'
						+'<div class="dapan"><div class="col-12 A">'
						+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
						+'A. <span id="A'+(question_numb-1)+'">'+val.a+'</span></div>'
						+'<div class="col-12 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
						+'B. <span id="B'+(question_numb-1)+'">'+val.b+'</span></div>'
						+'<div class="col-12 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
						+'C. <span id="C'+(question_numb-1)+'">'+val.c+'</span></div>'
						+'<div class="col-12 D"><input type="radio" name="option'+(question_numb-1)+'" value="D">'
						+'D. <span id="D'+(question_numb-1)+'">'+val.d+'</span></div>'
						+'</div></div>'
				$(".part5_Ques").append(content);
				question_numb++;
				rightAnswer.push(val.rightAnswer);
			});
			$(".part5.partContent").append('</div>');

			$.each(data.listParagraph, function(i, val) {
				if(val.part6.length > 0){
//					$(".part6_Ques").append('<hr><div class="paragraph col-12">'+val.paragraph+'</div>');
					$(".part6.partContent").append('<hr><h2 id="title">Part 6: Text completion</h2><div class="part6_Ques">'
							
							+'<hr><div class="paragraph col-12">'+val.paragraph+'</div>');
					$.each(val.part6, function(j, value) {
						 content='<hr><div class=\"question'+question_numb+'\">'
								+'<p class="cauhoi"><span>Question '+question_numb+':</span></p>'
								+'<div class="dapan"><div class="col-6 A">'
								+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
								+'A. <span id="A'+(question_numb-1)+'">'+value.a+'</span></div>'
								+'<div class="col-6 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
								+'B. <span id="B'+(question_numb-1)+'">'+value.b+'</span></div>'
								+'<div class="col-6 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
								+'C. <span id="C'+(question_numb-1)+'">'+value.c+'</span></div>'
								+'<div class="col-6 D"><input type="radio" name="option'+(question_numb-1)+'" value="D">'
								+'D. <span id="D'+(question_numb-1)+'">'+value.d+'</span></div>'
								+'</div></div>'
						$(".part6_Ques").append(content);
						question_numb++;
						rightAnswer.push(value.rightAnswer);
					});
					$(".part6.partContent").append("</div>")
				}
			});
			$.each(data.listParagraph, function(i, val) {
				 if(val.part7.length > 0){
					$(".part7.partContent").append('<hr><h2 id="title">Part 7: Reading comprehen</h2><div class="part7_Ques">'
								
							+'<hr><div class="paragraph col-12">'+val.paragraph+'</div>');
					$.each(val.part7, function(j, value) {
						 content='<hr><div class=\"question'+question_numb+'\">'
								+'<p class="cauhoi"><span>Question '+question_numb+':</span> '+value.question+'</p>'
								+'<div class="dapan"><div class="col-12 A">'
								+'<input type="radio" name="option'+(question_numb-1)+'" value="A">'
								+'A. <span id="A'+(question_numb-1)+'">'+value.a+'</span></div>'
								+'<div class="col-12 B"><input type="radio" name="option'+(question_numb-1)+'" value="B">'
								+'B. <span id="B'+(question_numb-1)+'">'+value.b+'</span></div>'
								+'<div class="col-12 C"><input type="radio" name="option'+(question_numb-1)+'" value="C">'
								+'C. <span id="C'+(question_numb-1)+'">'+value.c+'</span></div>'
								+'<div class="col-12 D"><input type="radio" name="option'+(question_numb-1)+'" value="D">'
								+'D. <span id="D'+(question_numb-1)+'">'+value.d+'</span></div>'
								+'</div></div>'
						$(".part7_Ques").append(content);
						question_numb++;
						rightAnswer.push(value.rightAnswer);
					});
					$(".part7.partContent").append("</div>");
				}
			});
			
			coundown(120);

		})
		.fail(function() {
			console.log("error");
		});
		
		$(document).on("click",".submitTest",function(){
			$(".playAudio").trigger("pause");
			markAnswer(rightAnswer);
			
		});
	
});

// ham cham diem
function markAnswer(rightAnswer) {
	var mark=0;
		$.each(rightAnswer, function(i, val) {
			var check= $('[name=\'option'+i+'\']');
			var right=rightAnswer[i]+i;
			for (var j = 0; j < check.length; j++) {
				
				if(check[j].checked){
					var id=check[j].value+i;
					
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
	var coundownTime= new Date().getTime()+ time * 60000 + 1000;

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