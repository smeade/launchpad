$("#<%= dom_id(@comment) %>").replaceWith("<%= j(render @comment) %>")
<% if @notice %>
$("#<%= dom_id(@comment) %>-alert").append( "<%= j( render partial: 'shared/alert', locals: {alert_message: @notice, comment: @comment } ) %>" )
<% end %>
$('[data-behavior~=show-on-hover]').hide()
$('[data-behavior~=confirm-delete]').hide()
