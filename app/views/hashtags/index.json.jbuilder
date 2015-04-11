json.array!(@hashtags) do |hashtag|
  json.extract! hashtag, :id, :user_id, :discount, :permalink_url
  json.url hashtag_url(hashtag, format: :json)
end
