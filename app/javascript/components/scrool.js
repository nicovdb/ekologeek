$(document).ready(function() {
  //change the integers below to match the height of your upper dive, which I called
  //banner.  Just add a 1 to the last number.  console.log($(window).scrollTop())
  //to figure out what the scroll position is when exactly you want to fix the nav
  //bar or div or whatever.  I stuck in the console.log for you.  Just remove when
  //you know the position.
  $(window).scroll(function () {

    if ($(window).scrollTop() > 110) {
      var nav = document.getElementById("nav_bar")
      nav.classList.add('fixed-top');
      var navBarLogo = document.getElementById("nav_logo")
      navBarLogo.classList.remove('navbar-logo');
    }

    if ($(window).scrollTop() < 111) {
      var nav = document.getElementById("nav_bar")
      nav.classList.remove('fixed-top');
      var navBarLogo = document.getElementById("nav_logo")
      navBarLogo.classList.add('navbar-logo');
    }
  });
});