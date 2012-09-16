class ServiceProviderMailer < ActionMailer::Base
  default from: "mike@technologypainkillers.com"
  add_template_helper(ApplicationHelper)
  
  
  def send_email(problem_request)
    @problem_request = problem_request
    @addresses = Address.near(@problem_request.coordinates, 30).of_affiliates.sort_by { 
                                                                                        |a| a.addressable.score(@problem_request)
                                                                                      }.reverse
    

    mail(:to => problem_request.email, :subject => "We have found some service providers for you.")
  end
end
