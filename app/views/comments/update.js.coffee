$("#comment-<%= @comment.id %>").html("<%= j(render @comment) %>")
$(".edit_comment_<%= @comment.id %>").hide()
$(".edit-comment").on "click", ->
  $(this).parent(".comment").find('.comment-body').hide()
  $(this).parent(".comment").find('.comment-edit').show()
