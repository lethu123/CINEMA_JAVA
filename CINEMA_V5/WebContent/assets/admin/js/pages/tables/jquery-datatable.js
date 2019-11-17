$(document).ready(function() {
	$('#js-basic-example').DataTable({
		// responsive : true,
		pageLength : 5,
		lengthChange : false,
//		autoWidth : true,
		columnDefs : [ {
			width : 150,
			targets : 0
		}, {
			width : 200,
			targets : 1
		}, {
			width : 350,
			targets : 2
		}, {
			width : 250,
			targets : 3
		}, {
			width : 100,
			targets : 4
		}, {
			width : 150,
			targets : 5
		}]
	});
	
	$('#js-basic-example_account').DataTable({
		// responsive : true,
		pageLength : 10,
		lengthChange : false,
//		autoWidth : true,
	});
	
	$('#js-basic-example_showtime').DataTable({
		// responsive : true,
		pageLength : 10,
		lengthChange : false,
//		autoWidth : true,
	});
})
