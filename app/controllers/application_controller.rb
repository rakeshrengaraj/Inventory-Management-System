class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :authenticate_user!


    def check_if_logged_in
        deny_access unless signed_in?
    end
end
