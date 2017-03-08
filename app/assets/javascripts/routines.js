$(function(){
  $("#new_routine").on("submit", function(e){

  e.preventDefault()
  var $form = $(this)
  var action = $form.attr("action")
  var params = $form.serialize()

  $.ajax({
    url: action, 
    data: params, 
    dataType: 'json',
    method: "POST"
  })
    .success(function(json){

    
  })
  .error(function(response){
    console.log(response)
  })
  })
})