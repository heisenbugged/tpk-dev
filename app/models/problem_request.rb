class ProblemRequest < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_writer :current_step


  # == functions for multi-step form support.
  #    state machine would be a decent alternative.
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[category form]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)+1]
  end  
  
  def first_step?
    current_step == steps.first
  end

   def last_step?
    current_step == steps.last
  end
  #== end functions for multi-step form support.
end
