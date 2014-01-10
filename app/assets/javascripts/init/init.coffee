      
$(document).ready ->
  $('.addToggle').click ->
    $(this).next().toggle()
  
  if $(".tinymce").length > 0
    tinyMCE.init
      mode: "specific_textareas",
      editor_selector: 'tinymce',
      theme: 'advanced'
       
  if $( "#accordion" ).length > 0
    $( "#accordion" ).accordion()

  if $('#carousel').length > 0
    $('#carousel').infiniteCarousel({})


