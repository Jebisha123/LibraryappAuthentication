class BookController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        current_user =User.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Please Login"
        else
        render json: Book.all
    end
end
def show 
    current_user =User.find_by_id(session[:current_user_id])
    if(current_user.nil?)
        render json: "Please Login"
    else
        b=Book.find(params[:id])
    render json: b
end
end
    def create
        current_user =User.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Please Login"
        

    else
        b = !params[:bookName].empty?
        if(b)
            s = Book.create('bookName': params[:bookName],'bookAuthor': params[:bookAuthor],'bookQuantity': params[:bookQuantity])
            puts s
            render json: "Data Added"
        else
            render json: "Data not Added"
        end
    end
    
    end
    def update
        current_user =User.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Please Login"
        else
        b=Book.find(params[:id])
        if(b.nil?)
            render json: "Book does not exist"
        else
            b.update('bookName': params[:bookName],'bookAuthor': params[:bookAuthor],'bookQuantity': params[:bookQuantity])
            render json: "Book updated"
    end
end
end
def destroy
    current_user =User.find_by_id(session[:current_user_id])
    if(current_user.nil?)
        render json: "Please Login"
    else
    b = Book.find(params[:id])
    b.destroy
    render json: "Data Deleted"
end
end
    

end
