$(document).ready(function() {
	
	for (var i=1; i <= 10; i++) {
		$("#child-forms-div-"+i).hide()
	};

	var family_clicks = 0;
	$("#add-family-button").click(function(){
			family_clicks = family_clicks + 1;
			$("#child-forms-div-"+family_clicks).show()
	});

	$(".date-picker").datepicker();
 });