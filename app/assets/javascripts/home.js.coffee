@JSRouter['problem_requests'] = {
  new: ->
   selected = []
   $ ->
    # Enable toggling for categories on front page.
    $('.item').click ->
      id = $(@).data("id")
      if $(@).is('.selected')
        # remove id from selected array
        selected.splice selected.indexOf(id), 1
        $(@).removeClass "selected"
        $("#category_check_#{id}").attr 'checked', false
      else
        # add id to selecetd array
        selected.push id
        $(@).addClass "selected"
        $("#category_check_#{id}").attr 'checked', true
}

@JSRouter['problem_requests']['create'] = @JSRouter['problem_requests']['new']