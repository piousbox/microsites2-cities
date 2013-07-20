      
$(document).ready ->
  $('.addToggle').click ->
    $(this).next().toggle()

  $('.help_toggle').mouseenter ->
    $(this).next().show()
  $('.help_toggle').mouseleave ->
    $(this).next().hide()

  $("#layout_set").change ->
      $("#set_layout form").submit()
  
  if $(".tinymce").length > 0
    tinyMCE.init
      mode: "specific_textareas",
      editor_selector: 'tinymce',
      theme: 'advanced'

