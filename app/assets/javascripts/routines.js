function Routine(attributes){
  this.name = attributes.name
  this.estimated_time = attributes.estimated_time
  this.exercises = attributes.exercises
}



$(function(){
  Routine.templateSource = $("#new-routine-template").html()
  Routine.template = Handlebars.compile(Routine.templateSource)
})

Routine.prototype.renderDetails = function (){
  return Routine.template(this)
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
    var routineDetails = routine.renderDetails()
    $(".container").html(routineDetails)
  })
  .error(function(response){
    console.log(response)
  })
  })
})

function handleBarsSetup(){
  Handlebars.registerPartial(exercisePartial, $("#exercise-partial").html())
}