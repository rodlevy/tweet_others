class User < ActiveRecord::Base
  has_many  :tweets

  def twitter_client
    @twitter_client ||= Twitter::Client.new(
        :oauth_token => self.oauth_token,
        :oauth_token_secret => self.oauth_secret
        )
  end

  def tweet(status)
    # this creates a tweet, and pushes into the Tweets db, and then
    # tells the Tweetworker to do its job
      tweet = tweets.create!(:status => status)
      TweetWorker.perform_async(tweet.id)
  end
end
