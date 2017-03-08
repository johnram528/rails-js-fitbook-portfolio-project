$(function(){
  $("#new_routine").on("submit", function(e){

  e.preventDefault()
  var $form = $(this)
  var action = $form.attr("action")
  var params = $form.serialize()

  $.post(action, params).success(function(json){
    console.log(json)
  })
  })
})