$(document).ready(function() {
	
	// hide carousel 
	$("#carousel-form").hide();
	// when butotn is clicked
	$("#show-carousel-button").click(function() {
		// hide question
		$("#welcome-family-form").hide();
		// show carousel
		$("#carousel-form").show();
	});


	$("#carousel-next-button").click(function() {
		// $("#carousel-back-graphic").show();
		$("#start-with-you").hide();
		// $("#carousel-back-button").addClass("orange-background");
		$("#new-indicators-1").empty();
		$("#new-indicators-2").empty();
		for (var i=0; i <= 10; i++) {
			if ($("#child-forms-div-"+i+" input[name='family[users_attributes]["+i+"][first_name]'").val() != "") {
				$("#new-indicators-1").append("<li class='pointer' id='indicator-"+i+"' data-target='#carousel-example-generic' data-slide-to='"+i+"'>"+"<div class='row'><div class='col-xs-6'><img src='/assets/carrot-large.png' style='height: 30px;  class='img-responsive'/></div>"+"<div class='col-xs-6'><p>"+$("#child-forms-div-"+i+" input[name='family[users_attributes]["+i+"][first_name]'").val() +"</p></div></div></li>")
			};
		};
	});

	// hide all text 2
	$(".patient-focus-text2").hide();
	// hid eall forms
	$(".patient-focus-forms").hide();
	// each checkbox
	$('.patient-focus').each(function(index, element){
		// whenc clicked
		$(element).click(function(){
			// chenge its sized
			// if it is checked to be selected
			if ($(element).prop("checked"))	{
				// mark all check boxes as unchecked
				$(".patient-focus").each(function(i, e){
					$(e).prop("checked", false);
				});
				// mark this checkbox as checked
				$(element).prop("checked", true);
				// adjust size for each
				$(".new_html_code").each(function(i0, e0){
					// remove margin from all 
					$(e0).removeClass("new-html-margin");
					// add margin to all
					$(e0).addClass("new-html-margin");
					// remove large size from all
					$(e0).removeClass("new_html_code_large");
				});
				// remove margin for this
				$("#new-html-"+index).removeClass("new-html-margin");
				// add large html for this
			  $("#new-html-"+index).addClass("new_html_code_large");

				// hide all forms
				$(".patient-focus-forms").hide();
				/// show this form
	   		$("#patient-focus-form-"+index).toggle(this.checked);	
	   		// show all text2
	   		$(".patient-focus-text2").show();
	   		// hide all text1
	   		$(".patient-focus-text").hide();
	   		// show this text1
	   		$("#focus-text-"+index).show();
	   		$("#focus-text2-"+index).hide();
			} else {
				// if it is checked ot be unchecked
				$(".patient-focus").each(function(i2, e2){
					// mark all checkboxes as unchecked
					$(e2).prop("checked", false);
				});
				//
				$(".new_html_code").removeClass("new_html_code_large");
				// hide all forms
				$(".patient-focus-forms").hide();

			/// hide all text 2
				$(".patient-focus-text2").hide();
				// show all text 1
				$(".patient-focus-text").show();
			};
		});
	});



	// for (var i=1; i <= 100; i++) {
	// 	// set popovers
	// 	$('#allergy-'+i+'-popover').popover({ trigger: "hover" });
	// 	$('#intolerance-'+i+'-popover').popover({ trigger: "hover" });
	// 	$('#disease-'+i+'-popover').popover({ trigger: "hover" });

	// };

	$('.allergy-popover').popover({ trigger: "hover" });
	$(".other-field").hide();

	$(".allergy-checkbox").each(function(i4, e4){
		$(e4).click(function(){
			if ($(e4).prop("checked")){
				$(e4).parent().parent().parent().parent().parent().parent().first(".panel-heading").children(":first").addClass("white-green-panel").removeClass("panel-heading");
				$(e4).parent().parent().children(":nth-child(2)").show();
			}else{
				var checkornot = "not";
				$(e4).parent().parent().parent().each(function(i5, e5){
					$(e5).each(function(i6, e6){
						$(e6).find("input").each(function(i7, e7){
							if ($(e7).prop("checked")){
								checkornot = "check";
							};				
						});				
					});
				});
				if (checkornot === "not"){
					$(e4).parent().parent().parent().parent().parent().parent().first(".panel-heading").children(":first").removeClass("white-green-panel").addClass("panel-heading")	
				};
				$(e4).parent().parent().children(":nth-child(2)").hide();
			};
		});
	});

	$("#chrome-div").hide();
	$(".browser-checkbox").each(function(i8, e8){
		$(e8).click(function(){
			$("#chrome-div").show();
		})
	});
});