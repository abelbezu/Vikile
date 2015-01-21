$(document).ready(function(){
	
 // things to do when the document loads
 	var steps = [];
	
 	// last_step = $('#an_main_input_text_area')[0];
 	
 	method_count = 0;
	method_clone = $('#an_method_container_panel').clone(true);
	if(method_count == 0)
	{
		$('.an_part_position')[0].setAttribute('name', "article[parts_attributes][0][part_position]" );
		$('.an_part_position')[0].setAttribute('value', '0');
	}
 // end of things to do when the document loads
$('#method_selector').click( function()
	{
 		if ($('#an_methods').is(':checked'))
 		{
 			$('#an_method_wrapper_0').removeClass('global_hidden');
 			$('#an_add_method_panel').removeClass('global_hidden');
			$('#an_add_method_btn_txt').html('Method');
			$('.an_method_text').html('Method');
 			//method_clone = $('#an_method_container_panel').clone(true);

 		}
 		else if ($('#an_parts').is(':checked'))
 		{
			$('#an_method_wrapper_0').removeClass('global_hidden');
			$('#an_add_method_panel').removeClass('global_hidden');
			$('#an_add_method_btn_txt').html('Part');
 			$('.an_method_text').html('Part');
 			//method_clone = $('#an_method_container_panel').clone(true);
 		}
 		else 
 		{
 			$('#an_method_wrapper_0').addClass('global_hidden');
 			$('#an_add_method_panel').addClass('global_hidden');
 		}
 	});

// Add step delegate to solve a really weird bug
addStep_Delegate = function() {
  		 
		 new_step = $('#an_main_input_wrapper_0_0').clone(true);
		

		 method_position = this.getAttribute('methodposition');
		 console.log();
		 step_count = $('#an_methods_wrapper_'+method_position).find('.articles_new_main_input_right').length;
 		 if($('#an_main_input_text_area_'+method_position+'_'+(step_count-1).toString())[0].value != '')
 		 {

	 	 	new_step.find('#an_bullets_button_0_0')[0].setAttribute('stepposition', step_count);
			new_step.find('#an_bullets_button_0_0')[0].setAttribute('id', 'an_bullets_button_'+method_position+'_'+step_count);
			new_step[0].setAttribute('id', '#an_main_input_wrapper_'+method_position+'_'+step_count);
			new_step.find('#an_main_input_0_0')[0].setAttribute('id', 'an_main_input_'+method_position+'_'+step_count);
			new_step.find('#an_step_number_0_0')[0].setAttribute('id', 'an_step_number_'+method_position+'_'+step_count);
			new_step.find('#an_main_input_text_area_0_0')[0].setAttribute('id', 'an_main_input_text_area_'+method_position+'_'+step_count);
			 			new_step.find('#an_step_number_'+method_position+'_'+step_count).html((step_count+1).toString());
	 			$('#an_steps_wrapper_'+method_position).append(new_step);
	 			last_step = new_step.find('#an_main_input_text_area_'+method_position)[0];
	 			step_count++;
 		}



 }
//
//




  $('.an_add_step_button').click(function() {
  		 $('.an_add_step_button').click(addStep_Delegate)
		 new_step = $('#an_main_input_wrapper_0_0').clone(true);
		 method_position = this.getAttribute('methodposition');
		 console.log();
		 step_count = $('#an_methods_wrapper_'+method_position).find('.articles_new_main_input_right').length;
 		 if($('#an_main_input_text_area_'+method_position+'_'+(step_count-1).toString())[0].value != '')
 		 {
 		 	new_step.find('#an_main_input_text_area_0_0')[0].setAttribute('name', "article[parts_attributes][0][contents_attributes]["+step_count+"][content_body]");
	 	 	new_step.find('#an_bullets_button_0_0')[0].setAttribute('stepposition', step_count);
			new_step.find('#an_bullets_button_0_0')[0].setAttribute('id', 'an_bullets_button_'+method_position+'_'+step_count);
			new_step[0].setAttribute('id', '#an_main_input_wrapper_'+method_position+'_'+step_count);
			new_step.find('#an_main_input_0_0')[0].setAttribute('id', 'an_main_input_'+method_position+'_'+step_count);
			new_step.find('#an_step_number_0_0')[0].setAttribute('id', 'an_step_number_'+method_position+'_'+step_count);
			new_step.find('#an_main_input_text_area_0_0')[0].setAttribute('id', 'an_main_input_text_area_'+method_position+'_'+step_count);
			 			new_step.find('#an_step_number_'+method_position+'_'+step_count).html((step_count+1).toString());
	 			$('#an_steps_wrapper_'+method_position).append(new_step);
	 			last_step = new_step.find('#an_main_input_text_area_'+method_position)[0];
	 			step_count++;
 		}
		 console.log(step_count);



 });
 

 $('#an_add_method_button').click(function() {
 		
 		document.getElementById("an_neither").disabled = true;
 		new_method = method_clone.clone(true);
		
 		// make some id attribute adjustments
 		method_count++;
 		console.log(method_count);
		new_method.find('#an_method_title_0')[0].setAttribute('name', "article[parts_attributes]["+method_count+"][part_title]" );
		new_method.find('.an_part_position')[0].setAttribute('name', "article[parts_attributes]["+method_count+"][part_position]" );
		new_method.find('.an_part_position')[0].setAttribute('value', method_count.toString());
		new_method.find('#an_main_input_text_area_0_0')[0].setAttribute('name', "article[parts_attributes]["+method_count+"][contents_attributes][0][content_body]" );
 		new_method.find('#an_method_position_0')[0].setAttribute('id', 'an_method_position_'+method_count);
 		new_method.find('#an_method_title_0')[0].setAttribute('id', 'an_method_title_'+method_count);
 		new_method.find('#an_content_wrapper_0')[0].setAttribute('id', 'an_content_wrapper_'+method_count)
 		new_method.find('#an_method_wrapper_0')[0].setAttribute('id', 'an_method_wrapper_'+method_count);
 		new_method.find('#an_methods_wrapper_0')[0].setAttribute('id', 'an_methods_wrapper_'+method_count);
 		new_method.find('#an_steps_wrapper_0')[0].setAttribute('id', 'an_steps_wrapper_'+method_count);

 		new_method.find('#an_main_input_wrapper_0_0')[0].setAttribute('id', 'an_main_input_wrapper_'+method_count+'_0');
 		new_method.find('#an_main_input_0_0')[0].setAttribute('id', 'an_main_input_'+method_count+'_0');

 		new_method.find('#an_step_number_0_0')[0].setAttribute('id', 'an_step_number_'+method_count+'_0');

 		new_method.find('#an_main_input_text_area_0_0')[0].setAttribute('id', 'an_main_input_text_area_'+method_count+'_0');
		new_method.find('#an_bullets_button_0_0')[0].setAttribute('id', 'an_bullets_button_'+method_count+'_0');

		// new_method.find('#an_add_step_button')[0].setAttribute('id', 'an_add_step_button_'+method_count);

		new_method.find('#an_add_step_button')[0].setAttribute('methodPosition', method_count);



		$('#an_added_method_container_panel').append(new_method);
		$('#an_added_method_container_panel').removeClass('global_hidden');
		$('.an_method_count').html(method_count+1);
		new_method.addClass('panel');
		new_method.addClass('panel-default');

		$('#an_method_position_'+method_count).html(method_count+1);
		 new_method.find('#an_method_wrapper_'+method_count).removeClass('global_hidden');		
 		
 			$('.an_add_step_button').click(addStep_Delegate);
 		
 		if ($('#an_methods').is(':checked'))
 		{
 			
			$('.an_method_text').html('Method');
 			//method_clone = $('#an_method_container_panel').clone(true);

 		}
 		else if ($('#an_parts').is(':checked'))
 		{
			
 			$('.an_method_text').html('Part');
 			//method_clone = $('#an_method_container_panel').clone(true);
 		}



});

$('.an_add_tips_button').click(function() {  
	tip_position = $('#an_tips_container').find('.articles_new_tips_text_area').length 
	new_tip = $('#an_tip_wrapper_0').clone(true);
	
	
	if($('#an_articles_new_tip_'+(tip_position-1).toString())[0].value != ''){

		new_tip[0].setAttribute('id', 'an_tip_wrapper_'+tip_position);
 		new_tip.find('#an_articles_new_tip_0')[0].setAttribute('name', "article[tips]["+tip_position+"][tip_body]");
 		new_tip.find('#an_articles_new_tip_0')[0].setAttribute('id', 'an_articles_new_tip_'+tip_position);

		$('#an_tips_container').append(new_tip);
	}

});

$('.an_add_warnings_button').click(function() {  
	warning_position = $('#an_warnings_container').find('.articles_new_warnings_text_area').length 
	new_warning = $('#an_warning_wrapper_0').clone(true);
	
	
	if($('#an_articles_new_warning_'+(warning_position-1).toString())[0].value != ''){

		new_warning[0].setAttribute('id', 'an_warning_wrapper_'+warning_position);
 		new_warning.find('#an_articles_new_warning_0')[0].setAttribute('name', "article[warnings]["+warning_position+"][warning_body]" );
 		new_warning.find('#an_articles_new_warning_0')[0].setAttribute('id', 'an_articles_new_warning_'+warning_position);

		$('#an_warnings_container').append(new_warning);
	}

});


$('.an_add_sources_button').click(function() {  
	source_position = $('#an_sources_container').find('.articles_new_sources_text_area').length 
	new_source = $('#an_source_wrapper_0').clone(true);
	
	
	if($('#an_articles_new_source_'+(source_position-1).toString())[0].value != ''){

		new_source[0].setAttribute('id', 'an_source_wrapper_'+source_position);
 		new_source.find('#an_articles_new_source_0')[0].setAttribute('name', "article[sources]["+source_position+"][source_body]" );
 		new_source.find('#an_articles_new_source_0')[0].setAttribute('id', 'an_articles_new_source_'+source_position);

		$('#an_sources_container').append(new_source);
	}

});
$('.ariticles_new_add_source_text').click(function(){

	$('.ariticles_new_add_source_text').addClass('global_hidden');
	$('.ariticles_new_add_source_text').css('margin', '0px auto')
	$('#an_source_main_wrapper').removeClass('global_hidden');
	

});

// scroll fix top thing



});
