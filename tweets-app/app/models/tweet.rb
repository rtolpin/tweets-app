class Tweet < ApplicationRecord
    belongs_to :username

    validates :tweet, presence: true
    validates :tid, uniqueness: true

    def self.add_tweet(raw_tweet)
        one_username = Username.find_by(handle: "@#{raw_tweet['username']}".downcase)


        return if one_username.nil?

        username_id = one_username[:id]
        username_name = one_username[:handle]

        created_at = DateTime.parse("#{raw_tweet['date']} #{raw_tweet['time']} #{raw_tweet['timezone']}")
        date = Date.parse(raw_tweet['date'])
        attributes = {
            tid: raw_tweet['id'],
            conversation_tid: raw_tweet['conversation_id'],
            date: date,
            time: raw_tweet['time'],
            timezone: raw_tweet['timezone'],
            created_at: created_at,
            username_id: username_id,
            twitter_username: username_name,
            tweet: raw_tweet['tweet'],
            replies_count: raw_tweet['replies_count'],
            retweets_count: raw_tweet['retweets_count'],
            likes_count: raw_tweet['likes_count'],
            link: raw_tweet['link'],
            retweet: raw_tweet['retweet'],
            place: raw_tweet['place'],
            hashtags: raw_tweet['hastags'],
            urls: raw_tweet['urls'],
            photos: raw_tweet['photos']  
        }

        tweet = Tweet.find_by(tid: raw_tweet['id'])
        if tweet 
            puts "Tweet already exists. Tweet id of #{raw_tweet['id']}"
        else
            tweet = Tweet.new(attributes)
            tweet.save!
        end
    end
end
