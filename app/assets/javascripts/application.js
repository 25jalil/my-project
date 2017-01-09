// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require moment/ru
//= require bootstrap-datetimepicker
//= require turbolinks
//= require fullcalendar
//= require_tree .

$(function () {
  $('.datetimepicker').datetimepicker({
    format: 'YYYY-MM-DD HH:mm:ss'
  });
});

$(document).ready(function() {
  $('#calendar').fullCalendar({
    buttonText: {
      today: "Сегодня"
    },
    monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
    dayNamesShort: ["ВС","ПН","ВТ","СР","ЧТ","ПТ","СБ"]
  });
});



