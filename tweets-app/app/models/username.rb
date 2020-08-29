class Username < ApplicationRecord
    has_many :tweets
    validates :handle, presence: true, uniqueness: true
    validates :category, presence: true

    def get_new_tweets(limit = 100)
        output = "/tmp/#{self.handle}.json"
        command = "twint -u #{self.handle} -o #{output} --json --limit #{limit}"
        puts command
        if system command
            puts "twint command ran successfully"
        else
            puts "twint command ran into errors"
        end

        if File.exist?(output)
            tweets = File.readlines(output)
            tweets.each do |tweet|
                json_tweet = JSON.parse(tweet)
                Tweet.add_tweet(json_tweet)
            end
        end
        self.update_attribute(:last_checked_at, Time.now)
    end



end
