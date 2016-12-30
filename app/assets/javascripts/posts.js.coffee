jQuery ($) ->
  $('.deleteAction').click ->
    current_post = $(this).parents('.post')[0]
    if confirm('This post has been deleted?')
      $.ajax
        url: '/posts/' + $(current_post).attr('data-post_id')
        type: 'POST'
        data: _method: 'DELETE'
        success: (result) ->
          $(current_post).fadeOut 200
          console.log result
          return
    return
  return
