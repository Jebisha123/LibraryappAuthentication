require 'bcrypt'
class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        current_user =User.find_by_id(session[:current_user_id])
        render json: current_user
    end
    def create

        u=!params[:name].empty? and !params[:email].empty? and !params[:password].empty?
        if(u)
            s=User.create('name': params[:name], 'email': params[:email],'password': params[:password])
            puts s
            render json: "Data added"
        else
            render json: "Data not added"
        end
    end
    def destroy
        u=User.find(params[:id])
        u.destroy
    end

end
