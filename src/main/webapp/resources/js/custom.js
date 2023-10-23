
$(function(){
    $("#gnb > li").mouseover(function(){
        $(this).find(".sub").stop().slideDown(300)
    })

    $("#gnb > li").mouseout(function(){
        $(this).find(".sub").stop().slideUp(300)
    })
  
    $(".gnb > .gnb-li").mouseover(function(){
        $(this).stop().css("height","250px")
    })

    $(".gnb > .gnb-li").mouseout(function(){
        $(this).stop().css("height","50px")
    })
  
  
  // Trigger
  $('.trigger').click(function(){
    $(this).toggleClass('active')
    $('.gnb').toggleClass('active')
  })
  $('.gnb a').click(function(){
    $('.gnb, .trigger').removeClass('active')
  })
  

  
  // Header Scroll Change
 $(window).scroll(function(){
    if($(window).scrollTop() > 50) {
      $('header, .gototop').addClass('active')
    }
    else {
      $('header, .gototop').removeClass('active')
    }    
  })
  
  // Slick.js
  $('.myslider').not('.slick-initialized').slick({
    dots: true,
    infinite: false,
    speed: 300,
    slidesToShow: 3,
    slidesToScroll: 3,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3,
          infinite: true,
          dots: true
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });
})