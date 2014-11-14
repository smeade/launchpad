$(document).on "page:change", ->

  # ----------------------------------
  # Show-On-Hover Action buttons
  # ----------------------------------
  $('[data-behavior~=show-on-hover]').hide()
  $( "[data-behavior~=actionable-list-items]" ).on "mouseenter", "[data-behavior~=hoverable]", ->
    $(@).find('[data-behavior~=show-on-hover]').show()
  $( "[data-behavior~=actionable-list-items]" ).on "mouseleave", "[data-behavior~=hoverable]", ->
    $(@).find('[data-behavior~=show-on-hover]').hide()
    $(@).find('[data-behavior~=confirm-delete]').hide()

  # ----------------------------------
  # Edit button
  # ----------------------------------
  $( "[data-behavior~=actionable-list-items]" ).on "click", "[data-behavior~=edit]", ->
    $(@).parent("[data-behavior~=editable]").toggleClass("editing")

  # ----------------------------------
  # Details button
  # ----------------------------------
  $( "[data-behavior~=actionable-list-items]" ).on "click", "[data-behavior~=show-detail]", ->
    $.get('/comments/' + $(this).attr('data-id') + '/detail')

  # ----------------------------------
  # Delete button
  # ----------------------------------
  $('[data-behavior~=confirm-delete]').hide()
  $( "[data-behavior~=actionable-list-items]" ).on "click", "[data-behavior~=delete]", ->
    $(@).parent().find("[data-behavior~=confirm-delete]").toggle('slide', {direction: 'right'}, 100)
