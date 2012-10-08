class ConfirmationsController < Devise::ConfirmationsController
  before_filter :set_redirect_location, :only => :show

  # After a confirmation, we want the user to edit his account details to update his password.
  def set_redirect_location
      flash[:notice] = nil
      session["user_return_to"] = user_setup_path
  end
end
