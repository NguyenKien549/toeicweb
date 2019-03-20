$(document).ready(function() {
	var audioLocation=null;
	$(document).on('click', '.addPart1', function() {
		var part1 = [];
		if(audioLocation != undefined){
			for (var i = 1; i < 11; i++) {
				var uploaded = uploadImage(i);
				console.log("uploaded " + uploaded);
				if (uploaded != undefined) {
					var question = {
						"question" : $('#question' + i).val(),
						"a" : $('#A' + i).val(),
						"b" : $('#B' + i).val(),
						"c" : $('#C' + i).val(),
						"d" : $('#D' + i).val(),
						"image" : uploaded,
						"audio" : audioLocation,
						"rightAnswer" : $('#RightAnswer' + i).val()
					};
					part1.push(question);
				}
			}
			var audio=[{
					"audio" : audioLocation,
					"script": $("#script").val(),
					"part1"	: part1
			}];
			console.log(audio);
			$.ajax({
				url: '../addPart1',
				type: 'post',
				dataType: 'json',
				contentType: 'application/json;charset=utf-8',
				data: JSON.stringify({listPart:audio})
			})
			.done(function() {
				console.log("success");
			})
			.fail(function() {
				console.log("error");
			});
		}
	});

	function uploadImage(i) {
		var formData = new FormData();
		var result = null;
		if ($('#image' + i).prop('files').length > 0) {
			image = $('#image' + i).prop('files')[0];
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

	$(document).on("change", "#audio", function() {
		var formAudio = new FormData();
		if ($(this).prop('files').length > 0) {
			audio = $(this).prop("files")[0];
			formAudio.append("file", audio);
			console.log(formAudio);
			$.ajax({
				url : '../../uploadFile/audio',
				type : 'post',
				dataType : 'json',
				async:false,
				data : formAudio,
				processData : false,
				contentType : false

			}).done(function(data) {
				console.log(data);
				audioLocation= data;
			}).fail(function() {
				console.log("error");
			});
		}
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