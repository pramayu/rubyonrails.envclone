$('.up-votes').bind('ajax:success', function() {
 $('<%= .vcount-<%= @theme.id %>').html('<%=escape_javascript @theme.get_upvotes.size.to_s %>');
});
