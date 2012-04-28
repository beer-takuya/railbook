class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound , :with => :id_invalid
  
  private
  def id_invalid(e)
    render 'shared/record_not_found', :status => 404
  end
end
