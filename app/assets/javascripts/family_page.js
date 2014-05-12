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

	// $("#carousel-back-graphic").hide();
	// $("#new-indicators").hide();
	// for (var i=0; i <= 10; i++) {
	// 	$("#indicator-"+i).hide()
	// };
	$("#carousel-next-button").click(function() {
		// $("#carousel-back-graphic").show();
		$("#start-with-you").hide();
		// $("#carousel-back-button").addClass("orange-background");
		$("#new-indicators-1").empty();
		$("#new-indicators-2").empty();
		for (var i=0; i <= 10; i++) {
			if ($("#child-forms-div-"+i+" input[name='family[users_attributes]["+i+"][first_name]'").val() != "") {
				$("#new-indicators-1").append("<li id='indicator-"+i+"' data-target='#carousel-example-generic' data-slide-to='"+i+"'>"+"<div class='row'><div class='col-xs-6'><img src='/assets/user.png' style='height: 30px;  class='img-responsive'/></div>"+"<div class='col-xs-6'><p>"+$("#child-forms-div-"+i+" input[name='family[users_attributes]["+i+"][first_name]'").val() +"</p></div></div></li>")
			};
		};
	});


	$(".patient-focus-forms").hide();
	$(".patient-focus2").hide();
	// each checkbox
	$('.patient-focus').each(function(index, element){
		// whenc clicked
		$(element).click(function(){
			// chenge its size
			$("#new-html-"+index).toggleClass("new_html_code_large");	
			$("#patient-focus-form-"+index).toggle();
			// change checked status
	   	$("#patient-focus-form-"+index).toggle(this.checked);	
			var temp = 0;
	  	if ($("#patient-focus-checkbox-"+index).checked) {
	  		temp = 1;
	  	};
	  	$(".patient-focus").prop('checked', false);
	  	if (temp === 1){  		
	  		$("#patient-focus-form-"+index).prop("checked", true);	 
	  	};

	    // not checked chekced boxes hidden
    	// $(".patient-focus:not(:checked)").hide();
    	// // each not checked checked box
    // 	$(".patient-focus:not(:checked)").each(function(index, element){
    // 		// set variable span to text
    // 		var span = $(element).parent().find('.patient-focus-text');
    // 		// hide text
    // 		span.hide();
    // 		// show text2
				// $(".patient-focus-text2").show(); 		
    // 	});

    	// $(this).parent().parent().show();
		});
	});

// jQuery.fn.extend({
//         toggleText: function (a, b){
//             var isClicked = false;
//             var that = this;
//             this.click(function (){
//                 if (isClicked) { that.text(a); isClicked = false; }
//                 else { that.text(b); isClicked = true; }
//             });
//             return this;
//         }
//     });


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



	$("#restriction-columns").hide();
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