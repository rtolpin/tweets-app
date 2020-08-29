class TweetsController < ApplicationController
    def index
        if params[:username_id]
            @tweets = Tweet.where(username_id: params[:username_id]).order("date DESC").paginate(:page => params[:page], :per_page => 20)
        else
            @tweets = Tweet.all.order("date DESC").paginate(:page => params[:page], :per_page => 20)
        end
    end

    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.save
    end

    def show
        @tweet = Tweet.find(params[:id])
        render plain: @tweet.inspect
    end

    private
    def tweet_params
        params.require(:tweet)
    end
end
