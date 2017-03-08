function Routine(attributes){
  this.name = attributes.name
  this.estimated_time = attributes.estimated_time
  this.exercises = attributes.exercises
}

Routine.prototype.renderDetails = function (){
  
}


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

    var routine = new Routine(json)
    var routineDetails = item.renderDetails
    
  })
  .error(function(response){
    console.log(response)
  })
  })
})