class LogoutController < ApplicationController
    def index
        session.delete(:current_user_id)
        render json: "user logged off"
    end
end
