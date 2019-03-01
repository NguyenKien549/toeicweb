var vitri = 1;
var search = "";
var imageCount = 2;
var audioCount = 2;
var questionCount = 2;
var paragraphCount = 2;

//$(".question").hide();
$(".paragraph").hide();
$(".lessionTable").hide();
$(document).ready(function() {
	arr = new Array();
	numSelect = 0;

});

$(document).on("change","#selectType",function() {
					var type = $("#selectType").find(":selected").val();
					if (type === "lession") {
						$(".practiceTable").hide();
						$.ajax({
									url : '/admin/getlessions',
									type : 'post',
									dataType : 'json',
									error : function(e) {
										console.log(e);
									}
								})
								.done(
										function(data) {
											console.log("success");
											$(".contentTable").empty();
											$(".contentTable")
													.append(
															"<table class=\"table table-bordered lessionTable\" style=\"min-width: 800px\">"
																	+ "<thead class=\"thead-dark\">"
																	+ "<tr class=\"d-flex\">"
																	+ "<th class=\"col-sm-1 col-md-1\">ID</th>"
																	+ "<th class=\"col-sm-2 col-md-2\">Code</th>"
																	+ "<th class=\"col-sm-6 col-md-6\">Name</th>"
																	+ "<th class=\"col-sm-3 col-md-3\">View</th></tr></thead>"
																	+ "<tbody>");
											var content = "";
											$
													.each(
															data,
															function(i, val) {
																var tr = "<tr class=\"d-flex\">"
																		+ "<td class=\"col-sm-1 col-md-1\">"
																		+ val.id
																		+ "</td>"
																		+ "<td class=\"col-sm-2 col-md-2\">"
																		+ val.code
																		+ "</td>"
																		+ "<td class=\"col-sm-6 col-md-6\">"
																		+ val.name
																		+ "</td>"
																		+ "<td class=\"col-sm-3 col-md-3\">"
																		+ val.accessCount
																		+ "</td></tr>";
																content
																		.append(tr);
															});

											$(".contentTable").append(content);
											$(".contentTable").append(
													"</tbody></table>");

										}).fail(function() {
									console.log("error");
								});

					} else if (type === "practice") {
						location.reload(true);

					}

				});

$(document).on("change", ".practicePart", function() {
	var part = $(".practicePart").find(':selected').val();
	switch (part) {
	case "1":
		$(".audio").show();
		$(".image").show();
		$(".question").hide();
		$(".paragraph").hide();
		break;
	case "2":
	case "3":
	case "4":
		$(".image").hide();
		$(".audio").show();
		$(".question").hide();
		$(".paragraph").hide();
		break;
	case "5":
		$(".audio").hide();
		$(".image").hide();
		$(".question").show();
		$(".paragraph").hide();
		break;
	case "6":
	case "7":
		$(".audio").hide();
		$(".image").hide();
		$(".question").hide();
		$(".paragraph").show();
		break;
	}
});

$(document).on("click", ".sub", function() {
	var id = $(this).attr('id');
	$("div." + id).remove();
});

$(document)
		.on(
				"click",
				".add_Image",
				function() {
					var div = "<div class=\"input-modal row image"
							+ imageCount
							+ "\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">Image</span>"
							+ "<input class=\"col-8\" id=\"image"
							+ imageCount
							+ "\" type=\"text\" name=\"Image\" class=\"form-control\">"
							+ "<img src=\"../../resources/img/add_button_2-512.png\" alt=\"abc\" class=\"col-1 add add_Image\">"
							+ "<img src=\"../../resources/img/subtract-512.png\" class=\"col-1 sub sub_Image\" id=\"image"
							+ imageCount + "\"></div>";

					$(".image").append(div);
					imageCount++;

				});

$(document)
		.on(
				"click",
				".add_Audio",
				function() {
					var div = "<div class=\"input-modal row audio"
							+ audioCount
							+ "\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">Audio</span>"
							+ "<input class=\"col-8\" id=\"audio"
							+ audioCount
							+ "\" type=\"text\" name=\"Audio\" class=\"form-control\">"
							+ "<img src=\"../../resources/img/add_button_2-512.png\" alt=\"abc\" class=\"col-1 add add_Audio\">"
							+ "<img src=\"../../resources/img/subtract-512.png\" class=\"col-1 sub sub_Audio\" id=\"audio"
							+ audioCount + "\"></div>";
					$(".audio").append(div);
					audioCount++;

				});

$(document)
		.on(
				"click",
				".add_Question",
				function() {
					var div = "<div class=\"input-modal row question"
							+ questionCount
							+ "\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">Question</span>"
							+ "<input class=\"col-8\" id=\"question"
							+ questionCount
							+ "\" type=\"text\" class=\"form-control\">"
							+ "<img src=\"../../resources/img/add_button_2-512.png\" alt=\"abc\" class=\"col-1 add add_Question\">"
							+ "<img src=\"../../resources/img/subtract-512.png\" class=\"col-1 sub sub_Question\" id=\"question"
							+ questionCount + "\"></div>";
					$(".question").append(div);
					questionCount++;
				});

$(document)
		.on(
				"click",
				".add_Paragraph",
				function() {
					var div = "<div class=\"input-modal row paragraph"
							+ paragraphCount
							+ "\">"
							+ "<span class=\"col-2\" style=\"line-height: 35px\">Paragraph</span>"
							+ "<input class=\"col-8\" id=\"paragraph"
							+ paragraphCount
							+ "\" type=\"text\" class=\"form-control\">"
							+ "<img src=\"../../resources/img/add_button_2-512.png\" alt=\"abc\" class=\"col-1 add add_Paragraph\">"
							+ "<img src=\"../../resources/img/subtract-512.png\" class=\"col-1 sub sub_Paragraph\" id=\"paragraph"
							+ paragraphCount + "\"></div>";
					$(".paragraph").append(div);
					paragraphCount++;
				});

$(document).on("click", ".choice", function() {
	$(".choice").css("color", "#999999");
	$(this).css("color", "white ");
});

$(document).on("click", "tbody tr", function() {
	isBlank = ($(this).find("td").eq(0).html() == "");
	if (isBlank == true) {
		return;
	}
	$(this).toggleClass("selected");
});

$(document).on("click", "#btnsearch", function() {
	searchKey = $("#search").val();
	vitri = 1;

	search = searchKey;
	$.ajax({
		url : "admin/search",
		type : "GET",
		dataType : 'json',
		data : {
			array : arr,
			search : search,
		},
		success : function(value) {
			$("tbody").empty();
			$("tbody").append(value[0]);
			$("#pagin").empty();
			$("#pagin").append(value[1]);
			$("#infoPage").html("Page " + 1 + " of " + value[2]);
		}
	});

});

$("#delete").click(function() {
	var arrId = new Array();
	$(".notice").empty();
	var i = 0;
	// get id of deleted account
	$("table tr").each(function() {
		if ($(this).hasClass("selected")) {
			arrId[i] = $(this).find("td").eq(0).html();
			i += 1;
		}
	});
	if (i == 0) {
		alert("Get 1 row to delete!!!");
	}
	$.ajax({
		url : "deleteAccount",
		type : "post",
		dataType : 'json',
		data : {
			ids : arrId
		},
		error : function(e) {
			console.log(e);
		}
	}).done(function(data) {
		if (data == "done") {
			location.reload();
			$(".notice").html("Delete done");
		}
		if (data == "error") {
			location.reload();
			$(".notice").html("Delete fail");
		}
	}).fail(function() {
		location.reload();
		$(".notice").html("Delete fail");
	});
});

$("body").on("click", "#index", function() {
	var i = $(this).text();
	vitri = i;
	$.ajax({
		url : "admin/laydanhsach",
		type : "GET",
		dataType : 'json',
		data : {
			batDau : i,
			search : search,
		},
		success : function(value) {
			$("tbody").empty();
			$("tbody").append(value[0]);
			$("#pagin").empty();
			$("#pagin").append(value[1]);
			$("#infoPage").html("Page " + i + " of " + value[2]);
		}
	})
});

$("body").on("click", "#submit-add-btn", function() {
	$("#form-them").submit();
});

$("*").on("click", "#dangxuat-btn", function() {
	$.get("../logout", function() {
		// alert("ok");
		window.location.href = "/webtoeicproject";
	});
});