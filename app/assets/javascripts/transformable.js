/*toggle transform functionality, based on toggle_transform_1*/
var TransformableInput = function(main_element, action, reverse_action){
	this.main_element = $(main_element);

	x = this.main_element;
	x.click(function(){
    x.data('clicked', true);
    action(this);
    
	});

    $(window).click(function(){
	  if(x.data('clicked') === true){
	    
	  }
	  else{
	    x.data('clicked', false);
	    reverse_action(x);
	    
	  }
	  x.data('clicked', false);
	});

}
