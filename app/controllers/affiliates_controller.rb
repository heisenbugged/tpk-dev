class AffiliatesController < ApplicationController
  def new
    @page_title = "Affiliate Sign Up"
    @affiliate = Affiliate.new
    build_nested_attributes @affiliate
  end
  def create
    @affiliate = Affiliate.new(params[:affiliate])
    
    if @affiliate.save
      redirect_to root_url, :notice => "You have successfully signed up."
    else
      build_nested_attributes @affiliate
      render 'new'
    end
  end
  
private
  def build_nested_attributes affiliate
    affiliate.addresses.build if affiliate.addresses.blank?
    affiliate.certifications.build if affiliate.certifications.blank?    
    affiliate.it_services.build if affiliate.it_services.blank?
    affiliate.skill_sets.build if affiliate.skill_sets.blank?
    
    phones = []
    ph_types = @affiliate.phones.map(&:ph_type)
    ["Mobile", "Fax", "Landline"].each_with_index { |type|
      if ph_types.include? type
        phones << @affiliate.phones[ph_types.index(type)]
      else
        phones << @affiliate.phones.build(:ph_type => type)
      end          
    }        
    @affiliate.phones = phones
  end
end
