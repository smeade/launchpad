$("#<%= dom_id(@comment) %>").replaceWith("<%= j(render @comment) %>")
$('[data-behavior~=show-on-hover]').hide()
$('[data-behavior~=confirm-delete]').hide()
