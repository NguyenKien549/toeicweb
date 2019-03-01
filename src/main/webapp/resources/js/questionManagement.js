var audioQues = 2;

$(document).on("change", "#selectDataTable", function() {
	var choice = $("#selectDataTable").find(":selected").val();

	switch (choice) {
	case "part1":
		location.href="part1";
		break;
	case "part2":
		location.href = "part2";
		break;
	case "part3":
		location.href = "part3";
		break;
	case "part4":
		location.href = "part4";
		break;

	case "part5":
		location.href = "part5";
		break;

	case "part6":
		location.href = "part6";
		break;

	case "part7":
		location.href = "part7";
		break;

	case "image":
		location.href = "image";
		break;
	case "audio":
		location.href = "audio";
		break;
	case "paragraph":
		location.href = "paragraph";
		break;
	default:
		break;
	}
});

$(document)
		.on(
				"change",
				".add_type",
				function() {
					var type = $('.add_type').find(':selected').val();
					switch (type) {
					case "audio":
						$(".addContent").empty();
						$(".addContent")
								.append(
										"<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">Audio</span>"
												+ "<input type=\"file\" class=\"form-control\" name=\"Audio\"></div>"
												+ "<div class=\"input-modal row\" style=\"height:120px\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">Script</span>"
												+ "<textarea rows=\"4\" class=\"form-control\" name=\"AudioParagraph\" style=\"height: 95%;width:80%;\"></textarea></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">LessionID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>");
						break;

					case "image":
						$(".addContent").empty();
						$(".addContent")
								.append(
										"<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">Image</span>"
												+ "<input type=\"file\" class=\"form-control\" name=\"Image\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">LessionID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>");
						break;

					case "part5":
						$(".addContent").empty();
						$(".addContent")
								.append(
										"<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">Question</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">D</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">Right</span>"
												+ "<select class=\"form-control\" name=\"RightAnswer\">"
												+ "<option value=\"A\">A</option>"
												+ "<option value=\"B\">B</option>"
												+ "<option value=\"C\">C</option>"
												+ "<option value=\"D\">D</option></select></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>");
						break;

					case "paragraph":
						$(".addContent").empty();
						$(".addContent")
								.append(
										"<div class=\"input-modal row\" style=\"height:120px\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">Paragraph</span>"
												+ "<textarea rows=\"4\" class=\"form-control\" name=\"Paragraph\" style=\"height: 95%;width:80%;\"></textarea></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">LessionID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>"
												+ "<div class=\"input-modal row\">"
												+ "<span class=\"col-2\" style=\"line-height: 35px\">PracticeID</span>"
												+ "<input type=\"text\" class=\"form-control\"></div>");
						break;
					}
				});

$(".add_AudioQuestion")
		.on(
				"click",
				function() {
					var body = "<hr><div class=\"questions question\""
							+ audioQues
							+ "\">"
							+ "<div class=\"input-modal row\">"
							+ "<span class=\"col-2\"  style=\"line-height: 35px\">Question</span>"
							+ "<input type=\"text\" class=\"col-8 form-control\" id=\"question1\" class=\"form-control\">"
							+ "<img src=\"../../resources/img/add_button_2-512.png\" class=\"col-1 add add_AudioQuestion\">"
							+ "<img src=\"../../resources/img/subtract-512.png\" class=\"col-1 sub sub_AudioQuestion\"></div>"
							+ "<div class=\"input-modal row\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">A</span>"
							+ "<input type=\"text\" name=\"A\" class=\"form-control col-8\"></div>"
							+ "<div class=\"input-modal row\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">B</span>"
							+ "<input class=\"col-8 form-control\" type=\"text\" name=\"B\"></div>"
							+ "<div class=\"input-modal row\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">C</span>"
							+ "<input class=\"col-8 form-control\" type=\"text\" name=\"C\" ></div>"
							+ "<div class=\"input-modal row\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">D</span>"
							+ "<input class=\"col-8 form-control\" type=\"text\" name=\"D\"></div>"
							+ "<div class=\"input-modal row\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">Right Answer:</span>"
							+ "<input class=\"col-8 form-control\" type=\"text\" name=\"RightAnswer\"></div></div>";
					$(".audioQuestions").append(body);
					audioQues++;
				});