$(document).ready(function(){

	$(document).on('click', '.addPart1', function() {
//		var sendData=[];
		for (var i = 1; i < 11; i++) {
			var question={
				"question": $('#question'+(i+1)).val(),
				"a":$('#A'+(i+1)).val(),
				"b":$('#B'+(i+1)).val(),
				"c":$('#C'+(i+1)).val(),
				"d":$('#D'+(i+1)).val(),
				"rightAnswer":$('#RightAnswer'+(i+1)).val()
			};
			var formData= new FormData();
			if($('#image'+i).prop('files').length >0 ){
				image=$('#image'+i).prop('files')[0];
				formData.append('image',image);
				
				$.ajax({
					url: '../addPart1',
					type: 'post',
					dataType: 'json',
					data: {
						image : image,
						part1 : JSON.stringify(question)
						},
					processData: false,
				  
				})
				.done(function() {
					console.log("success");
//					alert("success");
					location.reload();
				})
				.fail(function() {
					console.log("error");
//					alert("fail");
				});
				
			}
			
			
			
			
//			formData.append('Question',$('#question'+i).val());
//			formData.append('A',$('#A'+i).val());
//			formData.append('B',$('#B'+i).val());
//			formData.append('C',$('#C'+i).val());
//			formData.append('D',$('#D'+i).val());
//			formData.append('RightAnswer',$('#RightAnswer'+i).val());
//			sendData.push(formData);
		}
		
		
	});
	
	$(document).on("change","#audio",function(){
		var formAudio = new FormData();
		if($(this).prop('files').length >0){
			audio = $(this).prop("files")[0];
			formAudio.append("file",audio);
			console.log(formAudio);
			$.ajax({
				url: '../../uploadFile',
				type: 'post',
				dataType: 'json',
				data: formAudio,
				processData: false,
			    contentType: false
			   
			})
			.done(function(data) {
				console.log(data);
			})
			.fail(function() {
				console.log("error");
			});
		}
	});
	
//	$(document).on("click",".addPart1",function(){
//		var questionList=[];
//		for (var i = 1; i < 11; i++) {
//			
//			questionList.push(formData);
//		}
//		
//		console.log(questionList[0].question);
//	});
	
	
	
	
	
//	$(document).on("click", ".pageIndex", function(){
//		$.ajax({
//			url: 'pagination',
//			type: 'post',
//			dataType: 'json',
//			data: {
//				type: "account",
//				page: $(this).html()
//			},
//			error: function(e){
//				console.log(e);
//			}
//		})
//		.done(function() {
//			location.reload();
//		})
//		.fail(function() {
//			location.reload();
//		});
//		
//	});

});