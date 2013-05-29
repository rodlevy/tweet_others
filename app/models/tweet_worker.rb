class TweetWorker 
  include Sidekiq::Worker

  # the perform function does the actual work of pushing the tweet out
  # after the Tweet db is populated

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user = tweet.user
    user.twitter_client.update(tweet.status)
  end


end
