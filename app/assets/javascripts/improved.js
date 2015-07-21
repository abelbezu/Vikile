
$(document).on("nested:fieldAdded:image", function(){
		$('.add_pic_link').remove();
		main();
});
function inputAndDisplaySelect(input_element, editor)
 {  


    if (!window.File || !window.FileReader || !window.FileList || !window.Blob) {
     err_str = 'file input not supported by browser';
      return;
    }   

    input = input_element[0];
    if (!input.files) {
      err_str = 'file input not supported by browser';
    }
    else if (!input.files[0]) {
      err_str = 'please select image file';               
    }
    else {
      file = input.files[0];
      r = new FileReader();
      r.onload = function(){

      	img = new Image();
    	img.src = r.result;
      	img.width = 582;
      	img.height = 500;
      	
    	editor.empty().append(img)


      }
      r.readAsDataURL(file);
    }
  }

main = function(){

	$(".btn").mouseup(function(){
    	$(this).blur();
	})

/*  $("#articles_table").dataTable();
	$('#myModal').on('shown.bs.modal', function () {
  		$('#myInput').focus()
	})*/




	$('.add_pic_btn').change(function(){
		inputAndDisplaySelect($(this),$(this).parent().parent().find('.image_display_box') );
		$(this).parent().parent().find('.image_display_box').removeClass('hidden');
		
	});

}

/*function imageDataRecieved() {           
	img = new Image();
	img.src = r.result;
	$(editor).empty().append(img)
} */



$(document).ready(function (){
	main();
});

$(document).on('page:load', function (){
	main();
});