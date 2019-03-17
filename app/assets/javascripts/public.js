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


  $(".time-btn").click(function(){
    if ($(this).hasClass("selected-time")){
      $(this).removeClass("selected-time");
    } else {
      $(this).addClass("selected-time");
    };
  });


  $(".modal-open").click(function(){
    $('body').append('<div class="modal-overlay"></div>');
    $('.modal-overlay').fadeIn('slow');

    modalResize();
    $(".modal-content").fadeIn("slow");

    $('.modal-overlay, .modal-close').off().click(function(){
      $(".modal-content").fadeOut('slow');
      $('.modal-overlay').fadeOut('slow',function(){
        $('.modal-overlay').remove();
      });
    });

    $(window).on('resize', function(){
      modalResize();
    });

    function modalResize(){
      var w = $(window).width();
      var h = $(window).height();
      var x = (w - $(modal).outerWidth(true)) / 2;
      var y = (h - $(modal).outerHeight(true)) / 2;

      $(modal).css({'left': x + 'px','top': -1200 + 'px'});
    }

  });
});
