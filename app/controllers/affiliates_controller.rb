class AffiliatesController < ApplicationController
  def new
    @page_title = "Affiliate Sign Up"
    @affiliate = Affiliate.new
    
    # Build nested associations
    @affiliate.addresses.build
    @affiliate.certifications.build
    @affiliate.it_services.build
    @affiliate.skills.build
    ["Mobile", "Fax", "Landline"].each {|type| @affiliate.phones.build :ph_type => type }
  end
  def create
    @affiliate = Affiliate.new(params[:affiliate])
    
    if @affiliate.save
      redirect_to affiliates_url, :notice => "You have successfully signed up."
    else
      render 'new'
    end
  end
end
