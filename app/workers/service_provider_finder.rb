class ServiceProviderFinder 
  @queue = :service_provider_queue
  
  def self.perform(problem_request_id)
    @problem_request = ProblemRequest.find problem_request_id    
    ServiceProviderMailer.send_email(@problem_request).deliver
  end
end