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

$(document).ready(function(){
  $('#calendar').fullCalendar({
  });
});
