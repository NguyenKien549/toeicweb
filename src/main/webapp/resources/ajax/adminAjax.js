$(document).ready(function(){

	$(document).on('click', '.addPart1', function() {
		var sendData= new Array();
		for (var i = 0; i < 10; i++) {
			var question={
				"image": $('#image'+(i+1)).val(),
				"question": $('#question'+(i+1)).val(),
				"a":$('#A'+(i+1)).val(),
				"b":$('#B'+(i+1)).val(),
				"c":$('#C'+(i+1)).val(),
				"d":$('#D'+(i+1)).val(),
				"rightAnswer":$('#RightAnswer'+(i+1)).val()
			};
			sendData.push(question);
		}
		
		console.log(sendData);

		$.ajax({
			url: 'addPart1',
			type: 'post',
			dataType: 'json',
			data: {
				part1: JSON.stringify(sendData),
				audio: JSON.stringify($("#audio").val()),
				script: $("#script").val()
			},
			error: function(e){
				console.log(e);
			}
		})
		.done(function() {
			console.log("success");
			alert("success");
		})
		.fail(function() {
			console.log("error");
			alert("fail");
		});
		
	});

});