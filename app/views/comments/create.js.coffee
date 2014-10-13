$("<%= j(render @comment) %>").appendTo("#comments")
$("#comment_body").val('')

$(".comment").on "mouseenter", ->
  $(this).find('.edit-comment').show()
$(".comment").on "mouseleave", ->
  $(this).find('.edit-comment').hide()

$(".edit-comment").on "click", ->
  $(this).parent(".comment").find('.comment-body').hide()
  $(this).parent(".comment").find('.comment-edit').show()
