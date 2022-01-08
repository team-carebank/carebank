
$(document).ready(function(){
	$('.nav-btn').on('click',function(){
		var page= $(this).data('page');
		
		if(page=='home'){
			location.href='./';
		}else if(page=='jstest'){
			location.href='./jstest';
		
		}else if(page=='product'){
			location.href='./product';
		
		}else{
			location.href='./service';

		}
		
	});
	

});