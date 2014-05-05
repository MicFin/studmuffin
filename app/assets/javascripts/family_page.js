$(document).ready(function() {
	
	// for (var i=1; i <= 10; i++) {
	// 	$("#child-forms-div-"+i).hide()
	// };

	// var family_clicks = 10;
	// $("#add-family-button").click(function(){
	// 		var last_form = family_clicks + 1
	// 		$("#child-forms-div-"+family_clicks).show();
	// 		$("#child-forms-div-0").addClass("member-form-white");
	// 		$("#child-forms-div-"+last_form).addClass("member-form-white");
	// 		family_clicks = family_clicks - 1;
	// });

	// $(".date-picker").datepicker();
	// $('.carousel').carousel({
	//   wrap: true
	// });

	$("#carousel-form").hide();
	$("#show-carousel-button").click(function() {
		$("#welcome-family-form").hide();
		$("#carousel-form").show();
	});

	$("#carousel-back-graphic").hide();
	$("#carousel-next-button").click(function() {
		$("#carousel-back-graphic").show();
		$("#start-with-you").hide();
		$("#carousel-back-button").addClass("orange-background");
	});

	for (var i=1; i <= 100; i++) {
		// set popovers
		$('#allergy-'+i+'-popover').popover({ trigger: "hover" });
		$('#intolerance-'+i+'-popover').popover({ trigger: "hover" });
		$('#disease-'+i+'-popover').popover({ trigger: "hover" });

	};

// ATTEMPTS AT HIDING THEN SHOWING INPUT DIV
 //  	// $("#intolerance-1-checkbox").click(function() {
 //   //  	$("#intolerance-1-field")[this.checked ? "show" : "hide"]();

 //  	// });

	// $(".other-field").hide();

	// // for (var i=1; i <= 100; i++) {
	// 	// if ($('#disease-"+i+"-checkbox').is(':checked')) {
	// 	// // $("#disease-"+i+"-checkbox").click(function(){
	// 	// 	$("#disease-"+i+"-div").show();
	// 	// };

 //    $('#disease-1-checkbox').change(function(){
 //        var checked = $(this).attr('checked');
 //        if (checked) {
 //           $('#disease-1-div').show();             
 //        } else {
 //          $('#disease-1-div').hide(); 
 //        }
 //    }); 
	// // };



	// $("#restriction-columns").hide();
 	$(".create-diets-button").hide(); 
 	$(".other-issues-div").hide(); 

	$(".restrictions-show-button").click(function() {
    $(".diet-question-div").hide();
    $('#restriction-columns').show();
  });

	$(".no-restrictions-show-button").click(function() {
    $(".diet-question-div").hide();
    $(".other-issues-div").show();
   	$(".create-diets-button").show(); 
  });

	$(".next-question-button").click(function() {
    $('#restriction-columns').hide();
    $(".other-issues-div").show();
   	$(".create-diets-button").show(); 
  });
  
});