class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:dager] ="you profile is not permitted to perform this action"
  	redirect_to root_path
  end

  rescue_from ActiveRecord::RecordNotFound do
  flash[:danger] = 'The record you tried to access do not exist or you dose not have privaleges to access it'
  redirect_to root_path   # or e.g. redirect_to :action => :index
end

  @current_project
end
