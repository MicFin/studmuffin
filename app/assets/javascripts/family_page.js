$(document).ready(function() {
	
	for (var i=1; i <= 10; i++) {
		$("#child-forms-div-"+i).hide()
	};

	var family_clicks = 10;
	$("#add-family-button").click(function(){
			var last_form = family_clicks + 1
			$("#child-forms-div-"+family_clicks).show();
			$("#child-forms-div-0").addClass("member-form-white");
			$("#child-forms-div-"+last_form).addClass("member-form-white");
			family_clicks = family_clicks - 1;
	});


	// $(".date-picker").datepicker();

	for (var i=1; i <= 100; i++) {
		// set popovers
		$('#allergy-'+i+'-popover').popover({ trigger: "hover" });
		$('#intolerance-'+i+'-popover').popover({ trigger: "hover" });
		$('#disease-'+i+'-popover').popover({ trigger: "hover" });
		// hide other allergy/disease field until clicked

	};
  	// $("#intolerance-1-checkbox").click(function() {
   //  	$("#intolerance-1-field")[this.checked ? "show" : "hide"]();

  	// });

	$(".restrictions-div").hide();
 	$(".create-diets-button").hide(); 
 	$(".other-issues-div").hide(); 

	$(".restrictions-show-button").click(function() {
    $(".diet-question-div").hide();
    $('.restrictions-div').show();
  });

	$(".no-restrictions-show-button").click(function() {
    $(".diet-question-div").hide();
    $(".other-issues-div").show();
   	$(".create-diets-button").show(); 
  });

	$(".next-question-button").click(function() {
    $('.restrictions-div').hide();
    $(".other-issues-div").show();
   	$(".create-diets-button").show(); 
  });
  
});