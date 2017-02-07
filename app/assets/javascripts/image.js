$(window).on("load", function() {

  $('form').on('change', 'input[type="file"]', function(e) {
    $(".js-preview").show();
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".js-preview");
        t = this;

    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.addClass('preview')

        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "js-preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);

   });
});