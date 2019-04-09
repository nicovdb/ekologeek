function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      if (e.target.result != undefined) {
        $('#preview').find('img').attr('src', e.target.result);
        $('#preview').removeClass('d-none');
      } else {
        $('#preview').addClass('d-none');
      }
    }
    reader.readAsDataURL(input.files[0]);
  }
}

$(function(){
  $("#my-file").change(function() {
    readURL(this);
  });

  $('.remove').click(function(){
    $('#my-file').val('');
    $('#preview').find('img').attr('src', '#');
    $('#preview').addClass('d-none');
  });
});
