//Laver en kalender fra plugin

$.datetimepicker.setLocale('da');

//Kalender til statdato, Sætter format, fjerner timepicker og sætter min dato
jQuery('#MainContent_StartDato').datetimepicker({
    timepicker: false,
    format: 'd/m/Y',
    minDate: 0,
    dayOfWeekStart: 1
})
//Kalender til slutdato, Sætter format, fjerner timepicker og sætter min dato
jQuery('#MainContent_SlutDato').datetimepicker({
    timepicker: false,
    format: 'd/m/Y',
    minDate: 0,
    dayOfWeekStart: 1
});

