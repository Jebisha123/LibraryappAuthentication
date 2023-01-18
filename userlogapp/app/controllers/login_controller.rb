require 'bcrypt'
class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        
        render html: "login"
    end
    def create
        usr = User.find_by('email': params[:email])
        if(usr.nil?)
            render json: "User account does not exists"
        else
            if(usr.authenticate(params[:password]))
                session[:current_user_id] = usr.id
            render json: "Logged in successfully "
            else
                render json: "Password is not correct"
        end
    end

end
end
