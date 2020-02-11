//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $("#hide").click(function(){
    $(".answer").hide();
  });
  $("#show").click(function(){
    $(".answer").show();
  });
});
