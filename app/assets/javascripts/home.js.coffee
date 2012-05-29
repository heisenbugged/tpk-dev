@App.home = ->
  $ ->
    # Enable toggling for categories on front page.
    $('.item').click ->
      if $(@).is('.selected')
        $(@).removeClass "selected"
      else
        $(@).addClass "selected"