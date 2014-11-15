if $("#<%= dom_id(@comment) %>-detail").length > 0
  $("#<%= dom_id(@comment) %>-detail").remove()
else
  $("#<%= dom_id(@comment) %>").find("[data-behavior~=detail]").html("<%= j(render partial: 'comments/detail', locals: {comment: @comment} ) %>").slideDown()