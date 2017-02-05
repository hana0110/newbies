$(window).on("load", function() {
  $(".subcategory").hide();
  $(".headcategory").on("click", function(){

    if ($("." + this.id).hasClass('selected')){
      $("." + this.id).removeClass("selected");
      $("." + this.id).hide();

    } else {

      $("." + this.id).addClass("selected");
      $(".selected").show();
    }

  });
});