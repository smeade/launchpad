$(document).on "page:change", ->

  # ----------------------------------
  # Show-On-Hover Action buttons
  # ----------------------------------
  $('[data-behavior~=show-on-hover]').hide()
  $( "[data-behavior~=actionable-list-items]" ).on "mouseenter", "[data-behavior~=hoverable]", ->
    $(@).find('[data-behavior~=show-on-hover]').show()
  $( "[data-behavior~=actionable-list-items]" ).on "mouseleave", "[data-behavior~=hoverable]", ->
    $(@).find('[data-behavior~=show-on-hover]').hide()

  # ----------------------------------
  # Edit button
  # ----------------------------------
  $( "[data-behavior~=actionable-list-items]" ).on "click", "[data-behavior~=edit]", ->
    $(@).parent("[data-behavior~=editable]").toggleClass("editing")
