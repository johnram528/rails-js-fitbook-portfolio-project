function Routine(attributes){
  this.name = attributes.name
  this.estimated_time = attributes.estimated_time
  this.muscles = attributes.muscles
  this.exercises = attributes.exercises
  this.user = attributes.user
}



$(function(event) {
  Routine.templateSource = $("#new-routine-template").html()
  Routine.template = Handlebars.compile(Routine.templateSource)
})

Routine.prototype.renderDetails = function (){
  return Routine.template(this)
}

function submitForm(){
  $(".container").on("submit","form#new_routine", function(e){

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
}

function clickUserRoutineIndex(){
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
}

function clickRoutineIndex(){
  $("#routines_link").on("click", function(e){
    e.preventDefault()
    $.getJSON("/routines",function(json){
      var routines = json
      var routinesTemplate = $("#routines-index-template").html()
      var template = Handlebars.compile(routinesTemplate)

      $(".container").html(template(routines))
    })      
  })
}

function clickUserPath(){
$(".container").on("click", "#routine_path_link", function(e){
    e.preventDefault()
    var id = $(this).attr("data-id")
    $.getJSON("/routines/" + id, function(json){
      var routine = new Routine(json)
      var routineDetails = routine.renderDetails()
      
      $(".container").html(routineDetails)
    })         
  }) 
}

$( document ).on('turbolinks:load', function() { 
  submitForm()
  clickUserRoutineIndex()
  clickRoutineIndex()
  clickUserPath()
  $("#new_routine_link").on("click", function(e){
    e.preventDefault()
    $.get("/routines/new",function(response){

      $(".container").html(response)
    })
    })  
})

// function handleBarsSetup(){
//   Handlebars.registerPartial(exercisePartial, $("#exercise-partial").html())
// }