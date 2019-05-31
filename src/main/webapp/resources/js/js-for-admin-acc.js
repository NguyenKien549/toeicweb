var vitri = 1;
var search = "";
var imageCount = 2;
var audioCount = 2;
var questionCount = 2;
var paragraphCount = 2;

// $(".question").hide();
//$(".paragraph").hide();
//$(".lessionTable").hide();
$(document).ready(function() {
	arr = new Array();
	numSelect = 0;
	
	
});
$("#userView").on("click",function(){
	location.href= "/webtoeicproject/home";
});


$(document).on("change","#selectType",function() {
					var type = $("#selectType").find(":selected").val();
					if (type === "lession") {
						$(".practiceTable").hide();
						$
								.ajax({
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

//$(document).on("click", "#btnsearch", function() {
//	searchKey = $("#search").val();
//	vitri = 1;
//
//	search = searchKey;
//	$.ajax({
//		url : "admin/search",
//		type : "GET",
//		dataType : 'json',
//		data : {
//			array : arr,
//			search : search,
//		},
//		success : function(value) {
//			$("tbody").empty();
//			$("tbody").append(value[0]);
//			$("#pagin").empty();
//			$("#pagin").append(value[1]);
//			$("#infoPage").html("Page " + 1 + " of " + value[2]);
//		}
//	});
//
//});

//$("#delete").click(function() {
//	var arrId = new Array();
//	$(".notice").empty();
//	var i = 0;
//	var type = $(this).attr("class");
//	// get id of deleted account
//	$("table tr").each(function() {
//		if ($(this).hasClass("selected")) {
//			arrId[i] = $(this).find("td").eq(0).html();
//			i += 1;
//		}
//	});
//	if (i == 0) {
//		alert("Get 1 row to delete!!!");
//	}
//
//	if (type == "part5") {
//		deletePart5(arrId, type);
//	}
//	if (type == "account") {
//		deleteAccount(arrId, type);
//	}
//
//});

function deleteAccount(arrId, type) {
	$.ajax({
		url : "../deleteDocument",
		type : "post",
		dataType : 'json',
		data : {
			ids : arrId,
			type : type
		},
		error : function(e) {
			console.log(e);
		}
	}).done(function(data) {
		if (data == "done") {
			alert("delete done")
			location.reload();
		}
		if (data == "error") {
			$(".notice").html("Delete fail");
		}
	}).fail(function() {
		$(".notice").html("Delete fail");
	});
}

function deletePart5(arrId, type) {
	$.ajax({
		url : "../../deleteDocument",
		type : "post",
		dataType : 'json',
		data : {
			ids : arrId,
			type : type
		},
		error : function(e) {
			console.log(e);
		}
	}).done(function(data) {
		if (data == "done") {
			alert("Delete done");
			location.reload();

		}
		if (data == "error") {
			$(".notice").html("Delete fail");
		}
	}).fail(function() {
		$(".notice").html("Delete fail");
	});
}

// khi an nut update tren view
//$("body").on("click", "#update", function() {
//	var arr = [];
//	var i = 0;
//	$("table tr").each(function() {
//		if ($(this).hasClass("selected")) {
//			arr[0] = $(this).find("td").eq(0).html();
//			i += 1;
//		}
//	});
//	if (i != 1) {
//		alert("Chỉ chọn 1 tài khoản để update");
//	} else {
//		$("#id").val(arr[0]);
//		$("#myModal-update").modal('toggle');
//	}
//});

$("body").on("click", "#submit-add-btn", function() {
	$("#form-them").submit();
});

$("*").on("click", "#dangxuat-btn", function() {
	$.get("/webtoeicproject/logout", function() {
		// alert("ok");
		window.location.href = "/webtoeicproject";
	});
});