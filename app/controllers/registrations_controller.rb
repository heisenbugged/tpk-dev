class RegistrationsController < Devise::RegistrationsController
  layout "login"

  def setup
    if current_user.nil?
      redirect_to root_url, :alert => "You do not have permissions to access this page."
    end
    
    @user = current_user
  end
  
  def finish_setup
    @user = current_user
    
    if @user.update_attributes(params[:user])
      sign_in :user, @user, :bypass => true      
      redirect_to root_url, :notice => "You have successfully signed up."
    else      
      clean_up_passwords @user      
      render "setup"
    end  
  end
end
