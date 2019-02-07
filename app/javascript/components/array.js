$('.pane-hScroll').scroll(function() {
  $('.pane-vScroll').width($('.pane-hScroll').width() + $('.pane-hScroll').scrollLeft());
});

$('.pane-hScroll2').scroll(function() {
  $('.pane-vScroll2').width($('.pane-hScroll2').width() + $('.pane-hScroll2').scrollLeft());
});
