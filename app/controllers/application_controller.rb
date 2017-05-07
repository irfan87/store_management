require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  respond_to :pdf

  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource_or_scope)
  	customers_url
  end

  def after_sign_out_path(resource_or_scope)
  	URI.parse(request.referer).path if request.referer
  end
end
