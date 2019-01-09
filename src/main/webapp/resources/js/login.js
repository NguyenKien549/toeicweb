// login
$(document).ready(function() {
    $('a.login-window').click(function() {

        //lấy giá trị thuộc tính href - chính là phần tử "#login-box"
        var loginBox = $(this).attr('href');

        //cho hiện hộp đăng nhập trong 300ms
        $(loginBox).fadeIn("slow");

        // thêm phần tử id="over" vào sau body
        $('body').append('<div id="over"></div>');
        $('#over').fadeIn(200);
        
        return false;
    });

    // khi click đóng hộp thoại
    $(document).on('click', "a.close, #over", function() { 
        $('#over, .login').fadeOut(200 , function() {
            $('#over').remove();  
        }); 
        return false;
    });
	
	// register
	$('a.register-window').click(function() {

        //lấy giá trị thuộc tính href - chính là phần tử "#register-box"
        var registerBox = $(this).attr('href');

        //cho hiện hộp đăng nhập trong 300ms
        $(registerBox).fadeIn("slow");

        // thêm phần tử id="over" vào sau body
        $('body').append('<div id="over"></div>');
        $('#over').fadeIn(200);
        
        return false;
    });

    // khi click đóng hộp thoại
    $(document).on('click', "a.close, #over", function() { 
        $('#over, .register-dialog').fadeOut(200 , function() {
            $('#over').remove();  
        }); 
        return false;
    });

	//search
	$(document).on("click",".btn-search",function(){

	$(".input-search").toggleClass("active");
    });

//login check
	$(".submit").click(function(event) {
		/* Act on the event */
	});

});
