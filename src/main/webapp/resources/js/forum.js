$(document).ready(function(){
	var id=1;
	$(".bodyTable tr").each(function(i, val) {

		$(this).find("td").each(function(j,value){
			if(j==3){
				value.id="discussionTime"+id;
				setTimePosted(id);
				id++;
			}
			
		});
	});
		
});

function setTimePosted(id){
	var discussionTime=$("#discussionTime"+id).html();

	var time=discussionTime.split(" ");
	var time_date=time[0].split("-"); //mang chua nam,thang, ngay
	var time_hour=time[1].split(":");//mang chua gio, phut, chuoi giay va mili giay
	var time_second=time_hour[2].split(".") //mang chua giay va mili giay
	 var postedDate=new Date(time_date[0], time_date[1]-1, time_date[2], time_hour[0], time_hour[1], time_second[0], time_second[1]);

			var now = new Date();
			

			var distance= now.getTime() - postedDate.getTime();
			
			var year=Math.floor(distance/(365*86400000));
			
			var month= Math.floor( (distance % (365*86400000) ) / (86400000*30));
			
			var day= Math.floor((distance % (86400000*30) ) / 86400000);

			var hours=Math.floor( (distance % 86400000)/3600000); //milisecond

			var minutes = Math.floor( (distance % 3600000) / 60000 );

			var seconds = Math.floor( (distance % 60000)/1000 );

			//hien len html
			if(year>0){
				$("#discussionTime"+id).html(year+"y");
			}else if(month>0){
				$("#discussionTime"+id).html(month + "M");
			}else if(day>0){
				$("#discussionTime"+id).html(day +"d");
			}else if(hours>0){
				$("#discussionTime"+id).html(hours+"h");
			}else if(minutes>0){
				$("#discussionTime"+id).html(minutes+"m");
			}else if(seconds>0){
				$("#discussionTime"+id).html(seconds+"s");
			}
}