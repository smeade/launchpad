$("#posts").html("<%= j(render @posts) %>")
$(".pagination").html("<%= j(render partial: 'pagination', locals: {posts: @posts}) %>")
