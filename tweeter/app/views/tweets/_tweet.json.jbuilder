json.extract! tweet, :id, :title, :text, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
