class Certification < ActiveRecord::Base
  attr_accessible :affiliate_id, :certificate_id, :cert_name
  
  belongs_to :affiliate
  belongs_to :certificate
  
  before_save :save_certificate
  
  def cert_name
    (certificate && certificate.name) || @cert_name
  end
  
  def cert_name=(name)
    return if name.blank?
    cert = Certificate.find_by_name(name)
    if cert
      self.certificate = cert
    else
      @certificate = Certficiate.new(:name => name)
      self.certificate = @certificate
    end
    @cert_name = name
  end  
  
  def save_certificate
    @certificate.save if @certificate
  end

end
