$(document).ready(function(){
	$(".bodyTable td").each(function(){
		$(this).attr("title",$(this).html());
	});

	$(document).on("change", "#selectDataTable", function() {
		var choice = $("#selectDataTable").find(":selected").val();

		switch (choice) {
		case "part1":
			location.href="../part1/1";
			break;
		case "part2":
			location.href = "../part2/1";
			break;
		case "part3":
			location.href = "../part3/1";
			break;
		case "part4":
			location.href = "../part4/1";
			break;

		case "part5":
			location.href = "../part5/1";
			break;

		case "part6":
			location.href = "../part6/1";
			break;

		case "part7":
			location.href = "../part7/1";
			break;

		case "audio":
			location.href = "../audio/1";
			break;
		case "paragraph":
			location.href = "../paragraph/1";
			break;
		default:
			break;
		}
	});
//
//	$(document).on("change",".add_type",function() {
//		var type = $('.add_type').find(':selected').val();
//		switch (type) {
//		case "audio":
//			$(".addContent").empty();
//			$(".addContent").append("<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">Audio</span>"
//									+ "<input type=\"file\" class=\"form-control\" name=\"Audio\"></div>"
//									+ "<div class=\"input-modal row\" style=\"height:120px\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">Script</span>"
//									+ "<textarea rows=\"4\" class=\"form-control\" name=\"AudioParagraph\" style=\"height: 95%;width:80%;\"></textarea></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">LessionID</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>");
//			break;
//
//		
//		case "part5":
//			$(".addContent").empty();
//			$(".addContent").append("<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">Question</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">D</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">Right</span>"
//									+ "<select class=\"form-control\" name=\"RightAnswer\">"
//									+ "<option value=\"A\">A</option>"
//									+ "<option value=\"B\">B</option>"
//									+ "<option value=\"C\">C</option>"
//									+ "<option value=\"D\">D</option></select></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>");
//			break;
//
//		case "paragraph":
//			$(".addContent").empty();
//			$(".addContent")
//					.append(
//							"<div class=\"input-modal row\" style=\"height:120px\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">Paragraph</span>"
//									+ "<textarea rows=\"4\" class=\"form-control\" name=\"Paragraph\" style=\"height: 95%;width:80%;\"></textarea></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">LessionID</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>"
//									+ "<div class=\"input-modal row\">"
//									+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
//									+ "<input type=\"text\" class=\"form-control\"></div>");
//			break;
//		}
//	});

	var ques = 2;
	$(document).on("click",".add_Question",function() {
		if($(this).hasClass("part1")){
			var body = "<div class=\"questions question"
				+ ques
				+ "\"><hr>"
				+'<div class="input-modal row">'
				+'<span class="col-2" style="line-height: 35px">Image </span>'
				+'<input type="file" class="col-8 form-control" id="image'+ ques+'"></div>'
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\"  style=\"line-height: 35px\">Question</span>"
				+ "<input type=\"text\" class=\"col-8 form-control\" id=\"question"+ques+"\" class=\"form-control\">"
				+ "<img src=\"../../../resources/img/add_button_2-512.png\" class=\"col-1 add part1 add_Question\">"
				+ "<img src=\"../../../resources/img/subtract-512.png\" id=\"question"+ques+"\" class=\"col-1 sub sub_Question\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
				+ "<input type=\"text\" id=\"A"+ques+"\" class=\"form-control col-8\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"B"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"C"+ques+"\" ></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">D</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"D"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">Right Answer:</span>"
				+ "<select class=\"col-8 form-control\" id=\"RightAnswer"+ques+"\">"
				+'<option value="A">A</option>'
				+'<option value="B">B</option><option value="C">C</option><option value="D">D</option>'
				+'</select></div></div>';
		}else if($(this).hasClass("part6")){
			var body = "<div class=\"questions question"
				+ ques
				+ "\"><hr>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
				+ "<input type=\"text\" id=\"A"+ques+"\" class=\"form-control col-8\">"
				+ "<img src=\"../../../resources/img/add_button_2-512.png\" class=\"col-1 add part6 add_Question\">"
				+ "<img src=\"../../../resources/img/subtract-512.png\" id=\"question"+ques+"\" class=\"col-1 sub sub_Question\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"B"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"C"+ques+"\" ></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">D</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"D"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">Right Answer:</span>"
				+ "<select class=\"col-8 form-control\" id=\"RightAnswer"+ques+"\">"
				+'<option value="A">A</option>'
				+'<option value="B">B</option><option value="C">C</option><option value="D">D</option>'
				+'</select></div></div>';
		}else if($(this).hasClass("part2")){
			var body = "<div class=\"questions question"
				+ ques
				+ "\"><hr>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\"  style=\"line-height: 35px\">Question</span>"
				+ "<input type=\"text\" class=\"col-8 form-control\" id=\"question"+ques+"\" class=\"form-control\">"
				+ "<img src=\"../../../resources/img/add_button_2-512.png\" class=\"col-1 part2 add add_Question\">"
				+ "<img src=\"../../../resources/img/subtract-512.png\" id=\"question"+ques+"\" class=\"col-1 sub sub_Question\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
				+ "<input type=\"text\" id=\"A"+ques+"\" class=\"form-control col-8\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"B"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"C"+ques+"\" ></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">Right Answer:</span>"
				+ "<select class=\"col-8 form-control\" id=\"RightAnswer"+ques+"\">"
				+'<option value="A">A</option>'
				+'<option value="B">B</option><option value="C">C</option>'
				+'</select></div></div>';
		}else{
			var body = "<div class=\"questions question"
				+ ques
				+ "\"><hr>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\"  style=\"line-height: 35px\">Question</span>"
				+ "<input type=\"text\" class=\"col-8 form-control\" id=\"question"+ques+"\" class=\"form-control\">"
				+ "<img src=\"../../../resources/img/add_button_2-512.png\" class=\"col-1 add add_Question\">"
				+ "<img src=\"../../../resources/img/subtract-512.png\" id=\"question"+ques+"\" class=\"col-1 sub sub_Question\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
				+ "<input type=\"text\" id=\"A"+ques+"\" class=\"form-control col-8\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"B"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"C"+ques+"\" ></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">D</span>"
				+ "<input class=\"col-8 form-control\" type=\"text\" id=\"D"+ques+"\"></div>"
				+ "<div class=\"input-modal row\">"
				+ "<span class=\"col-2\" style=\"line-height: 35px\">Right Answer:</span>"
				+ "<select class=\"col-8 form-control\" id=\"RightAnswer"+ques+"\">"
				+'<option value="A">A</option>'
				+'<option value="B">B</option><option value="C">C</option><option value="D">D</option>'
				+'</select></div></div>';
		}
		
		$(".audioQuestions").append(body);
		ques++;
	});
	
	$(document).on("click",".sub_Question",function() {
		var id= $(this).attr("id");
		$(".questions."+id).remove();
	});
	
});
