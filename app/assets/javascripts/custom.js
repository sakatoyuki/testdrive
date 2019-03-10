$(function() {
  $('#slider').slick({
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 3000,
    speed: 400,
    dots: true,
    dotsClass: 'slide-dots',
    arrows: true,
    pauseOnHover: true,
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>'
  });
});

$(document).ready(function () {
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month agendaWeek agendaDay'
    },
    dayClick: function(date, jsEvent, view) {
      $(".availables-card").fadeIn();
      $(this).addClass("selected-date");
      $("#stock_date").val(date);
    },
    selectable: true
  });

  $(".time-btn").click(function(){
    if ($(this).hasClass("active")){
      $(this).removeClass("active");
    } else {
      $(this).addClass("active");
    };
  });

});
