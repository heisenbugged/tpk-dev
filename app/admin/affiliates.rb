ActiveAdmin.register Affiliate do
  
  index do
    column :company_name
    column :first_name
    column :last_name
    column :website_url
    
    column "" do |affiliate|
      link_to "Edit", edit_affiliate_path(affiliate)
    end
    
    column "" do |affiliate|
      link_to "Accept", accept_affiliate_path(affiliate)
    end
  
  end
  
  
  form do |f|
    f.object = affiliate
    
    # Build nested attributes for affiliate object.
    affiliate.addresses.build if affiliate.addresses.blank?
    affiliate.certifications.build if affiliate.certifications.blank?    
    affiliate.service_sets.build if affiliate.service_sets.blank?
    affiliate.skill_sets.build if affiliate.skill_sets.blank?
    
    phones = []
    ph_types = affiliate.phones.map(&:ph_type)
    ["Mobile", "Fax", "Landline"].each_with_index { |type|
      if ph_types.include? type
        phones << affiliate.phones[ph_types.index(type)]
      else
        phones << affiliate.phones.build(:ph_type => type)
      end          
    }    
    
    f.inputs "General" do
      f.input :company_name
      f.input :website_url
      f.input :bonded
      f.input :state, :collection => Affiliate::STATES
    end
    
    f.inputs "Address", :for => [:addresses] do |fm|
      fm.input :street_line_1
      fm.input :street_line_2      
      fm.input :city
      fm.input :state
      fm.input :zip, :as => :string
    end
    
    f.inputs "Phone", :for => [:phones] do |fm|
      fm.input :number
      fm.input :ph_type
    end
  end
end
