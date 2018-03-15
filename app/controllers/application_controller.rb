class ApplicationController < ActionController::Base
rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_url, :alert => exception.message }
        end
    end
    protect_from_forgery with: :exception
end
