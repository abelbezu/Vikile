// 	function part_header_stay() {
// 		var top_window = $(window).scrollTop();
// 		var end_column= $('#end_steps_column').offset().top;

// 		parts = $('.part_1_heading_anchor');
		
// 		for (var i = 0; i <= parts.length - 1; i++) {
			
// 			if (i<parts.length - 1){
// 				if (top_window > $(parts[i]).offset().top && $(parts[i+1]).offset().top > top_window) {
// 					$(parts[i]).next('.part_heading').addClass('stay');
// 					console.log(i);
// 				} else {
// 					$(parts[i]).next('.part_heading').removeClass('stay');
					
// 				}
// 			}
// 			else{
// 				if (top_window > $(parts.last()).offset().top && end_column > top_window)
// 				$(parts.last()).next('.part_heading').addClass('stay');
// 				else
// 				{
// 				$(parts.last()).next('.part_heading').removeClass('stay');
// 				}
// 			}
// 		};
		

		

// 	}
	
	
	
	
	
// 	console.log("hello");
	
// $(function () {
// 	$(window).scroll(part_header_stay);
// 	part_header_stay();
// });
