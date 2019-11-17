$(function () {
    //Textarea auto growth
    autosize($('textarea.auto-growth'));

    //Datetimepicker plugin
    $('.datetimepicker').bootstrapMaterialDatePicker({
        format: 'dddd DD MMMM YYYY - HH:mm',
        clearButton: true,
        weekStart: 1
    });

    $('.datepicker').bootstrapMaterialDatePicker({
        format: 'dddd DD MMMM YYYY',
        clearButton: true,
        weekStart: 1,
        time: false
    });

    $('.timepicker').bootstrapMaterialDatePicker({
        format: 'HH:mm',
        clearButton: true,
        date: false
    });

    //Bootstrap datepicker plugin
    $('#bs_datepicker_container input').datepicker({
        autoclose: true,
        container: '#bs_datepicker_container'
    });

    $('#bs_datepicker_component_container').datepicker({
        autoclose: true,
        container: '#bs_datepicker_component_container'
    });
    //
    $('#bs_datepicker_range_container').datepicker({
        autoclose: true,
        container: '#bs_datepicker_range_container'
    });
    
    $('#bs_datepicker_showtimedate input').datepicker({
    	format:'dd/mm/yyyy',
        autoclose: true,
        container: '#bs_datepicker_showtimedate'
    }).on('dp.change', function(e) {
//    	 let date = moment(e.date._d).format("DD/MM/YYYY");
        console.log(date);
      });
    
    $('#bs_datepicker_showtime_date input').datepicker({
    	format:'dd/mm/yyyy',
        autoclose: true,
        container: '#bs_datepicker_showtime_date'
    }).on('dp.change', function(e) {
        console.log(date);
      });
    
    $('#bs_datepicker_showtime_time input').datepicker({
    	format:'hh:mm',
        autoclose: true,
        container: '#bs_datepicker_showtime_time'
    }).on('dp.change', function(e) {
        console.log(date);
      });
    
});