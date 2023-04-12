const resource1 = document.querySelectorAll('.resource');

gsap.to(resource1, 2, {
  opacity: 1
});


$(document).ready(function () {
  $(".slider").bxSlider({
    auto: true,
    pause: 2000,
    autoHover: true,
    slideWidth: 600
  });
});