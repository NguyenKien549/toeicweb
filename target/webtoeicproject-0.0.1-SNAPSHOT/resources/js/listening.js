$(".timer").hide();
$(".contentPractice").hide();

$("#document").ready(function(){
	$(".start").click(function(){
		$(".timer").show();


		// js dem nguoc thoi gian
		//thiet lap thoi gian dem nguoc
		var coundownTime= new Date().getTime()+5*60000;

		// countdown each 1 second
		var x=setInterval(function(){

			var now = new Date().getTime();

			var distance= coundownTime - now;

			var hours=Math.floor(distance/3600000); //milisecond

			var minutes = Math.floor((distance % 3600000)/60000 );

			var seconds = Math.floor( (distance % 60000)/1000 );

			//hien len html
			$("#time").html( hours +":"+minutes + ":" + seconds);

			//neu het gio bao het gio
			if(distance < 0 ){
				clearInterval(x);
				alert("EXPIRED");
				$("#time").html("EXPIRED");
			}

		},1000);

		$(".start").hide();
		$(".contentPractice").show();


	});

	$("#part6").click(function(){
		$("#title").html("part");
	});

});

