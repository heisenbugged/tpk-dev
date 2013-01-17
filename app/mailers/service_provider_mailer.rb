class ServiceProviderMailer < ActionMailer::Base
  default from: "mike@technologypainkillers.com"
  add_template_helper(ApplicationHelper)
  
  
  def send_email(problem_request)
    @problem_request = problem_request
    
    # Find affiliates near problem request area.
    addresses = Address.near(@problem_request.coordinates, 75).of_affiliates
    # Remove affiliates that don't have any associated skills.                                                                         
    addresses.reject! { |a| a.addressable.score(@problem_request) <= 0 }
    
    # Find virtual affiliates with shared skills.
    sids = @problem_request.skill_ids.join ","
    virtual_affiliates = Affiliate.join_skills
                                  .where{ (skills.id.in(sids) & skills.is_virtual) | 
                                          (certificates_skills.id.in(sids) & certificates_skills.is_virtual) | 
                                          (it_services_skills.id.in(sids) & it_services_skills.is_virtual)
                                        }
                                  .group("affiliates.id")
    
    # Merge physical affiliates with virtual to deliver final list.                                   
    @affiliates = (addresses.map(&:addressable) + virtual_affiliates).uniq
    # Sort by highest-to-lowest score.
    @affiliates.sort_by { |a| a.score(@problem_request) }.reverse
    
    mail(:to => problem_request.email, :subject => "We have found some service providers for you.")
  end
end
