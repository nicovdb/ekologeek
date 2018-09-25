$(document).ready(function() {
  //change the integers below to match the height of your upper dive, which I called
  //banner.  Just add a 1 to the last number.  console.log($(window).scrollTop())
  //to figure out what the scroll position is when exactly you want to fix the nav
  //bar or div or whatever.  I stuck in the console.log for you.  Just remove when
  //you know the position.
  $(window).scroll(function () {

    if ($(window).scrollTop() > 118) {
      var nav = document.getElementById("nav_bar");
      nav.classList.add('fixed-top', 'animatedMenu');
      var navBarLogo = document.getElementById("nav_logo");
      navBarLogo.classList.remove('navbar-logo');
      var hintBorder = document.getElementById("hint-border");
      nav.classList.add('hint-border-primary');
    }

    if ($(window).scrollTop() < 119) {
      var nav = document.getElementById("nav_bar");
      nav.classList.remove('fixed-top', 'animatedMenu');
      var navBarLogo = document.getElementById("nav_logo");
      navBarLogo.classList.add('navbar-logo');
    }
  });
});
