class SearchbookController < ApplicationController
    
        skip_before_action :verify_authenticity_token
        def index
            v=!params[:bookName].empty?
            if(v)
    
           b=Book.find_by('bookName': params[:bookName]) 
           if(b.nil?)
            render json: "Book Does not exist"
           else
            render json: b
           end
        end
           

        end
   
end
