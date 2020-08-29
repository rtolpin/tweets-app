class UsernamesController < ApplicationController
    def index
        @usernames = Username.all 
    end

    def new 
        @username = Username.new
        @types = Username.select(:category).distinct
    end

    def create
        @username = Username.new(create_params)
        @types = Username.select(:category).distinct
        if @username.save
            redirect_to '/tweets?username_id=#{@username.id}'
        else
            render 'new'
        end
    end

    def edit
        @username = Username.find_by(id: params[:id])
        @types = Username.select(:category).distinct
    end

    def update 
        @username = Username.find_by(id: params[:id])
        if @username.update(update_params)
            redirect_to '/usernames'
        else
            render 'edit'
        end
    end

    def get_tweets
        @username = Username.find_by(id: params[:id])
        if @username.get_new_tweets
            redirect_to '/tweets?username_id=#{@username.id}'
        else
            redirect_to '/usernames'
        end
    end

    private 
    def create_params
        params.require(:username).permit(:handle, :category)
    end

    private
    def update_params
        params.require(:username).permit(:handle, :category)
    end
end
