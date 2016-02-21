jQuery ->
  $('#theme_subcategory_id').parent().hide()
  subcategories = $('#theme_subcategory_id').html()
  $('#theme_category_id').change ->
    category = $('#theme_category_id :selected').text()
    escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(subcategories).filter("optgroup[label='#{escaped_category}']").html()
    if options
      $('#theme_subcategory_id').html(options)
      $('#theme_subcategory_id').parent().show()
    else
      $('#theme_subcategory_id').empty()
      $('#theme_subcategory_id').parent().hide()