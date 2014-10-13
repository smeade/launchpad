$(document).on "page:change", ->

  # -----------------
  # Edit comments btn
  # -----------------
  $(".edit-comment").hide()
  $(".comment-edit").hide()
  $(".comment").on "mouseenter", ->
    $(this).find('.edit-comment').show()
  $(".comment").on "mouseleave", ->
    $(this).find('.edit-comment').hide()

  $(".edit-comment").on "click", ->
    $(this).parent(".comment").find('.comment-body').hide()
    $(this).parent(".comment").find('.comment-edit').show()
