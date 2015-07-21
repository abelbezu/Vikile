	// declare counting for images

	var count = 1;
	var amount = 0;

photo_upload = function() {
	// side panels javascript
	
	$("#rec_panel_img_panel_1").mouseenter(function() {
		$("#rec_panel_text_wrapper_1").css("background-color", "white");
		$("#rec_panel_text_1").css("color", "blue");
	});

	$("#rec_panel_img_panel_1").mouseleave(function() {
		$("#rec_panel_text_wrapper_1").css("background-color", "rgba(0, 0, 0, 0.33)");
		$("#rec_panel_text_1").css("color", "white");
	});

	$("#rec_panel_img_panel_2").mouseenter(function() {
		$("#rec_panel_text_wrapper_2").css("background-color", "white");
		$("#rec_panel_text_2").css("color", "blue");
	});

	$("#rec_panel_img_panel_2").mouseleave(function() {
		$("#rec_panel_text_wrapper_2").css("background-color", "rgba(0, 0, 0, 0.33)");
		$("#rec_panel_text_2").css("color", "white");
	});

	$("#rec_panel_img_panel_3").mouseenter(function() {
		$("#rec_panel_text_wrapper_3").css("background-color", "white");
		$("#rec_panel_text_3").css("color", "blue");
	});

	$("#rec_panel_img_panel_3").mouseleave(function() {
		$("#rec_panel_text_wrapper_3").css("background-color", "rgba(0, 0, 0, 0.33)");
		$("#rec_panel_text_3").css("color", "white");

	});

	$("#rec_panel_img_panel_4").mouseenter(function() {
		$("#rec_panel_text_wrapper_4").css("background-color", "white");
		$("#rec_panel_text_4").css("color", "blue");
	});

	$("#rec_panel_img_panel_4").mouseleave(function() {
		$("#rec_panel_text_wrapper_4").css("background-color", "rgba(0, 0, 0, 0.33)");
		$("#rec_panel_text_4").css("color", "white");
	});

	// pseudo upload button script 
	
	$("#image_upload_btn_showing").click(function(){
		$("#image_upload_btn_hidden").click();
	});



	// upload files script

	// upload file button

	//drag and drop



	function handleFileSelectDropZone(evt) {
		evt.stopPropagation();
		evt.preventDefault();

		//change wrapper size when more than 4 photos 
		if (amount>=3) {
			$("#uploaded_photos_wrapper").css("height","454px");
		} else {
			$("#uploaded_photos_wrapper").css("height","240px");
		}
		
		
		// FileList object
		var files = evt.dataTransfer.files;
		
		// Loop through the FileList and render image files as thumbnails.
		for (var i = 0,
		    f; f = files[i]; i++) {

			// Only process image files.
			// if (!f.type.match('image.*')) {
				// continue;
			// }

			var reader = new FileReader();

			// Closure to capture the file information.
			reader.onload = (function(theFile) {
				return function(e) {
					
					// create panel

					var photo_panel_ind = $("<div class='panel panel-default photo_panel_ind'></div>").attr("id", count);
					var panel_photo_body = $("<div class='panel-body panel_photo_body'></div>").attr("id",count);
					var panel_options_footer = $("<div class='panel-footer panel_options_footer'></div>").attr("id",count);
					
					// make and attach thumnail html
					
					img  = ['<img class="uploaded_photo" src="', e.target.result, '" title="', escape(theFile.name), ' id="', count, '"/>'].join('');
					
					panel_photo_body.append(img);
					

					// make delete button and counter button
										
					photo_number_div = ["<div class='photo_number' id='button_", count, "'>",count,"</div"].join('');
					button_wrapper = $("<div class='options_body_button_wrapper'></div>");
					button = ["<button type='button' class='image_delete_btn btn btn-danger' id='", count.toString(),"' aria-label='Close'><span class='glyphicon glyphicon-trash delete_btn_icon' aria-hidden='true'></span><p class='delete_text'>Delete<p></button>"].join('');
					
					button_wrapper.append(button);
					button_wrapper.append(photo_number_div);
					
					//add wrapper
					
					panel_options_footer.append(button_wrapper);
						
					//add button functionality 
					
					$(document).on('click',["#button_",count.toString()].join(''),
						function() {
						$(this).parent().parent().remove();
					}); 	
											
					//add everything to panel
					
					photo_panel_ind.append(panel_photo_body);
					photo_panel_ind.append(panel_options_footer);
					$('#uploaded_photos_wrapper').append(photo_panel_ind);
					count++;
					amount++; 
					

				};

			})(f);

			// Read in the image file as a data URL.
			reader.readAsDataURL(f);
		}
	

	}


	//end drop zone  handle file select

	// input button file select

	function handleFileSelectInputBtn(evt) {
		
		//change wrapper size when more than 4 photos 
		if (amount>=3) {
			$("#uploaded_photos_wrapper").css("height","454px");
		} else {
			$("#uploaded_photos_wrapper").css("height","240px");
		}
	
		// FileList object
		var files = evt.target.files;
		
		// Loop through the FileList and render image files as thumbnails.
		for (var i = 0,
		    f; f = files[i]; i++) {

			// Only process image files.
			// if (!f.type.match('image.*')) {
				// continue;
			// }

			var reader = new FileReader();

			// Closure to capture the file information.
			reader.onload = (function(theFile) {
				return function(e) {
					
					// create panel

					var photo_panel_ind = $("<div class='panel panel-default photo_panel_ind'></div>").attr("id", count);
					var panel_photo_body = $("<div class='panel-body panel_photo_body'></div>").attr("id",count);
					var panel_options_footer = $("<div class='panel-footer panel_options_footer'></div>").attr("id",count);
					
					// make and attach thumnail html
					
					img  = ['<img class="uploaded_photo" src="', e.target.result, '" title="', escape(theFile.name), ' id="', count, '"/>'].join('');
					
					panel_photo_body.append(img);
					

					// make delete button and counter button
										
					photo_number_div = ["<div class='photo_number' id='button_", count, "'>",count,"</div"].join('');
					button_wrapper = $("<div class='options_body_button_wrapper'></div>");
					button = ["<button type='button' class='image_delete_btn btn btn-danger' id='", count.toString(),"' aria-label='Close'><span class='glyphicon glyphicon-trash delete_btn_icon' aria-hidden='true'></span><p class='delete_text'>Delete<p></button>"].join('');
					
					button_wrapper.append(button);
					button_wrapper.append(photo_number_div);
					
					//add wrapper
					
					panel_options_footer.append(button_wrapper);
						
					//add button functionality 
					
					$(document).on('click',["#button_",count.toString()].join(''),
						function() {
						
							
						$(this).parent().parent().remove();
					});
					
											
					//add everything to panel
					
					photo_panel_ind.append(panel_photo_body);
					photo_panel_ind.append(panel_options_footer);
					$('#uploaded_photos_wrapper').append(photo_panel_ind);
					count++;
					amount++; 
					

				};

			})(f);

			// Read in the image file as a data URL.
			reader.readAsDataURL(f);
		}
	}

	//end input button file select

	// set event listner

	//document.getElementById('image_upload_btn').addEventListner('change',handleFileSelect,false);

	function handleDragOver(evt) {
		evt.stopPropagation();
		evt.preventDefault();
		evt.dataTransfer.dropEffect = 'copy';
		// Explicitly show this is a copy.
	}

	// Setup the dnd listeners.
	var dropZone = document.getElementById('uploaded_photos_wrapper');
	dropZone.addEventListener('dragover', handleDragOver, false);
	dropZone.addEventListener('drop', handleFileSelectDropZone, false);

	var uploadbutton = document.getElementById('image_upload_btn_hidden');
	uploadbutton.addEventListener('change', handleFileSelectInputBtn, false);
	
	// activate delete buttons 
	
	$(document).on('click','.image_delete_btn',function() {
		$(this).parent().parent().parent().remove(); 
		amount--;
		if (amount>=4) {
			$("#uploaded_photos_wrapper").css("height","454px");
		} else {
			$("#uploaded_photos_wrapper").css("height","240px");
		}
		});
}

$(document).ready(function (){
if ($('#uploaded_photos_wrapper')[0]){	
	console.log('hi');
	photo_upload();
}
});

$(document).on('page:load', function (){
	if ($('#uploaded_photos_wrapper')[0]){	
	console.log('hi');
	photo_upload();
}});

