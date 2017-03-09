function Routine(attributes){
  this.name = attributes.name
  this.estimated_time = attributes.estimated_time
  this.muscles = attributes.muscles
  this.exercises = attributes.exercises
  this.user = attributes.user
}



$(function(){
  Routine.templateSource = $("#new-routine-template").html()
  Routine.template = Handlebars.compile(Routine.templateSource)
})

Routine.prototype.renderDetails = function (){
  return Routine.template(this)
}


$(function(){
  $("form#new_routine").on("submit", function(e){

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
  $("#user_routines_link").on("click", function(e){
    e.preventDefault()
    var id = $(this).attr("data-id")
    $.getJSON("/users/"+ id +"/routines",function(json){
      var routines = json
      var routinesTemplate = $("#routines-index-template").html()
      var template = Handlebars.compile(routinesTemplate)

      $(".container").html(template(routines))  
    })
  })
  $("#routines_link").on("click", function(e){
    e.preventDefault()
    
  })
  $("#new_routine_link").on("click", function(e){
    e.preventDefault()
    
  }) 
  $("#profile_link").on("click", function(e){
    e.preventDefault()
    
  })
  $("#root_link").on("click", function(e){
    e.preventDefault()
    
  })       
})

function handleBarsSetup(){
  Handlebars.registerPartial(exercisePartial, $("#exercise-partial").html())
}