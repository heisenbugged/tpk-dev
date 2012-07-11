@JSRouter = {
  common:
    init: ->
      # application-wide code        
}

class Util
  @exec: (controller, action="init") ->
    ns = window.JSRouter
    if controller != "" and ns[controller]? and typeof ns[controller][action] == "function"
      ns[controller][action]()

  @init: ->
    body = document.body
    controller = body.getAttribute "data-controller"
    action = body.getAttribute "data-action"
    
    Util.exec "common"
    Util.exec controller
    Util.exec controller, action


$(document).ready Util.init