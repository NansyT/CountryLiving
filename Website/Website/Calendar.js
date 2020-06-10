$.datetimepicker.setLocale('da');


jQuery('#MainContent_StartDato').datetimepicker({
    timepicker: false,
    format: 'd/m/yy',
    minDate: 0,
    dayOfWeekStart: 1
})
jQuery('#MainContent_SlutDato').datetimepicker({
    timepicker: false,
    format: 'd/m/yy',
    minDate: 0,
    dayOfWeekStart: 1
});

