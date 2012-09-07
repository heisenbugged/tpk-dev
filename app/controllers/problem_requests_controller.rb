class ProblemRequestsController < ApplicationController
  respond_to :html, :js
  
  def new       
    reset_session
    @problem_request = ProblemRequest.new
    @categories = load_categories @problem_request
  end
  
  def show
    @page_title = "Find Affiliates"
    @problem_request = ProblemRequest.find(params[:id])
    @addresses = Address.near(@problem_request.coordinates, 30).of_affiliates.sort_by { 
                                                                                        |a| a.addressable.score(@problem_request)
                                                                                      }.reverse
  end
  
  def create
    # Merge in filled out form values into parameters and instantiate problem request object based on that merge.
    session[:problem_request_params].deep_merge!(params[:problem_request]) if params[:problem_request]
    @problem_request = ProblemRequest.new(session[:problem_request_params])
    @problem_request.current_step = session[:problem_request_step]
    
    # Move forward or backwards in multi-step form.
    if params[:back_button]
      @problem_request.previous_step
    elsif @problem_request.last_step? && @problem_request.valid?
      @problem_request.save
    elsif @problem_request.valid?
      @problem_request.next_step
    end
      
    # Update session with new problem request step, so next time page loads
    # it will go directly to the new step.
    session[:problem_request_step] = @problem_request.current_step

    if @problem_request.new_record?
      @categories = load_categories @problem_request
      render "new"
    else
      # If problem request has been created, clear session variables
      # so next time page is hit a new problem request will be created.
      reset_session
      redirect_to @problem_request
    end
  end
  
private
  def reset_session
    session[:problem_request_step] = nil
    session[:problem_request_params] = {}
  end
  
  def load_categories(problem_request)
    if problem_request.first_step?
      session[:problem_request_params].delete "category_ids"
      ProblemCategory.all
    else
      problem_request.categories
    end
  end

end
