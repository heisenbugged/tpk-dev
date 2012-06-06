class HomeController < ApplicationController
  def index
    @categories = ProblemCategory.all
    
    # Old way of loading categories.
    #@categories = [{title: 'Slow Computer',                           class: 'slow-computer'}, 
    #               {title: 'Android Problems',                        class: 'android'},
    #               {title: 'iPhone & iPad Problems',                  class: 'apple'},
    #               {title: 'Helping the Older Generation',            class: 'older-generation'},
    #               {title: 'Wireless Networks',                       class: 'wireless'},
    #               {title: 'Internet Access',                         class: 'internet'},
    #               {title: 'Routers',                                 class: 'routers'},
    #               {title: 'Keeping Systems and Software Up to Date', class: 'up-to-date'}]
  end
  
  def second
  end
end
