$(window).on('resize', function() {
    if($(window).width() < 992) {
      var elements = document.querySelectorAll("#navbarDropdownMenuLink");
      elements.forEach((element)=> {
        element.setAttribute("data-toggle", "dropdown");
      });
    }else {
      var elements = document.querySelectorAll("#navbarDropdownMenuLink");
      elements.forEach((element)=> {
        element.removeAttribute("data-toggle", "dropdown");
      });
    }
})
