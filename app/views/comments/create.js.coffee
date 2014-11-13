$("<%= j(render @comment) %>").appendTo("#comments")
$("#comment_body").val('')
$('[data-behavior~=confirm-delete]').hide()
