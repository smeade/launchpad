$("body").append( $("<%= j(render partial: 'comments/modal', locals: {comment: @comment}) %>") )
$("#<%= dom_id(@comment) %>-modal").modal()
