

$(window).scroll(function () {

  if ($(window).scrollTop() > 150) {
    var nav = document.getElementById("nav_bar");
    nav.classList.add('fixed-top', 'animatedMenu');
    var navBarLogo = document.getElementById("nav_logo");
    navBarLogo.classList.remove('navbar-logo');
    var logoSecondary = document.getElementById("logo-navbar-secondary")
    logoSecondary.classList.add('d-none')
  }

  if ($(window).scrollTop() < 1) {
    var nav = document.getElementById("nav_bar");
    nav.classList.remove('fixed-top', 'animatedMenu');
    var navBarLogo = document.getElementById("nav_logo");
    navBarLogo.classList.add('navbar-logo');
    var logoSecondary = document.getElementById("logo-navbar-secondary")
    logoSecondary.classList.remove('d-none')
  }
});
