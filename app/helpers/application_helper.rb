module ApplicationHelper
  def round_to(num, x)
    (num * 10**x).round.to_f / 10**x    
  end
end
