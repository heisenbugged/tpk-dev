class ServiceSet < ActiveRecord::Base
  attr_accessible :it_service_id, :affiliate_id, :service_name, :_destroy
  attr_accessor :_destroy
  
  belongs_to :affiliate
  belongs_to :it_service
  
  before_save :save_service
  
  def service_name
    (it_service && it_service.name) || @service_name
  end
  
  def service_name=(name)
    return if name.blank?
    service = ItService.find_by_name(name)
    if service
      self.it_service = service
    else
      @service = ItService.new(:name => name)
      self.it_service = @service
    end
    @service_name = name
  end
  
  def save_service
    @service.save if @service
  end    
end
