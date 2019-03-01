//$(document).ready(function() {
//	for (var i = 0; i < 10; i++) {
//		var id = "#" + i;
//		$(id).removeClass("not-show");
//	}
//});
//$(document).on("click", ".btn-search", function() {
//
//	$(".input-search").toggleClass("active");
//
//});
//
//$("body").on("click", ".exit", function() {
//	$('#myModal').modal('toggle');
//});
//
//$("body").on("click", ".page-item", function() {
//	var index = $(this).find("a").html();
//	$(".cau").each(function() {
//		var id = $(this).attr("id");
//		if (Math.floor(id / 10) == index - 1) {
//			$(this).removeClass("not-show");
//		} else {
//			$(this).addClass("not-show");
//		}
//	});
//	// $(".dong-da").each(function() {
//	// $(this).find("div").find("span").removeClass("mark");
//	// });
//});
//
//// xem kq
//$("body").on("click", ".xemkq", function() {
//	var da = $(this).parent().attr("data-da");
//	var daChoise = $(this).parent().attr("data-choise");
//	var objectDa;
//	var objectDaChoise;
//
//	// danh dau dang xem da
//	if ($(this).parent().attr("data-ischeck")=="no") {
//		$(this).parent().attr("data-ischeck","yes");
//	}else{
//		$(this).parent().attr("data-ischeck","no");
//	}
//
//	if (da == "A") {
//		objectDa = $(this).parent().find(".DA1").find("span");
//		objectDa.toggleClass("mark");
//	} else if (da == "B") {
//		objectDa = $(this).parent().find(".DA2").find("span");
//		objectDa.toggleClass("mark");
//	} else if (da == "C") {
//		objectDa = $(this).parent().find(".DA3").find("span");
//		objectDa.toggleClass("mark");
//	} else if (da == "D") {
//		objectDa = $(this).parent().find(".DA4").find("span");
//		objectDa.toggleClass("mark");
//	}
//
//	if (daChoise == "A" && da!="A") {
//		$(this).parent().find(".DA1").find("span").toggleClass("wrong");
//	} else if (daChoise == "B" && da!="B") {
//		objectDaChoise = $(this).parent().find(".DA2").find("span").toggleClass("wrong");
//	} else if (daChoise == "C" && da!="C") {
//		objectDaChoise = $(this).parent().find(".DA3").find("span").toggleClass("wrong");
//	} else if (daChoise == "D" && da!="D") {
//		objectDaChoise = $(this).parent().find(".DA4").find("span").toggleClass("wrong");
//	}else if(daChoise!="0"){
//		objectDa.toggleClass("right");
//	}
//});
//
//// chon dap an
//$("body").on("click", ".dong-da span", function() {
//	var cau = $(this).parent().parent().parent();
//	var id = cau.attr("id");
//	
//	if(cau.attr("data-ischeck")=="yes"){
//		return;
//	}
//	
//	$("#" + id + " span").each(function() {
//		$(this).removeClass("choise");
//	});
//	cau.attr("data-choise", $(this).attr("data-d"));
//	$(this).addClass("choise");
//});
//
//// Nop bai
//$("body").on("click","#nop-bai",function(){
//	var tongCau=0;
//	var soDung=0;
//	$(".cau").each(function(){
//		if($(this).attr("data-ischeck")=="no"){
//			$(this).find(".xemkq").click();
//		}
//		tongCau++;
//	});
//	$(".right").each(function(){
//		soDung++;
//	});
//	alert("Bạn trả lời đúng "+soDung+"/"+tongCau+" câu");
//});
//
//$("*").on("click", "#dangxuat-btn",function(){
//	$.get("dangxuat",function(){
//		location.reload();
//	});
//});
//
//$("*").on("click","#btn-login", function(){
//	$.ajax({
//		url: "checklogin",
//		type: "POST",
//		data:{
//			usernameLogin: $("#un").val(),
//			passwordLogin: $("#pw").val(),
//		},
//		success: function(){
//			location.reload();
//		}
//	});
//});