class ProblemRequestsController < ApplicationController
  
  def new
    @categories = ProblemCategory.all

    # load problem request from session object if it exists.
    # otherwise, just create a new problem request object.
    session[:problem_request_params] ||= {}
    @problem_request = ProblemRequest.new(session[:problem_request_params])
    @problem_request.current_step = session[:problem_request_step]
  end
  
  def create
    # Merge in filled out form values into parameters and instantiate problem request object based on that merge.
    sessions[:problem_request_params].deep_merge!(params[:problem_request]) if params[:problem_request]
    @problem_request = ProblemRequest.new(session[:problem_request_params])
    @problem_request.current_step = session[:problem_request_step]

    # Move forward or backwards in multi-step form.
    if params[:back_button]
      @problem_request.previous_step
    elsif @problem_request.last_step?
      @problem_request.save
    else      
      @problem_request.next_step
    end

    # Update session with new problem request step, so next time page loads
    # it will go directly to the new step.
    session[:problem_request_step] = @problem_request.current_step

    if @problem_request.new_record?
      @categories = ProblemCategory.all
      render "new"
    else
      # If problem request has been created, clear session variables
      # so next time page is hit a new problem request will be created.
      session[:problem_request_step] = session[:problem_request_params] = nil
      redirect_to @problem_request
    end
  end  
end
