class CertificatesController < ApplicationController
  def index
    @certificates = Certificate.order(:name).where("name like ?", "%#{params[:term]}%")
    render :json => @certificates.map(&:name)
  end
end
