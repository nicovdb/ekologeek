$(document).ready(function() {
  $( "label.first input" ).each(function(index) {
    $(this).on("click", function(){
      if($(this).attr('value') == 'Oui'){
        $(this).parents('span').siblings('div.dropable').removeClass('d-none');
      } else {
        $(this).parents('span').siblings('div.dropable').addClass('d-none');
      }
    });
});
});
