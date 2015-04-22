json.array!(@authorized_emails) do |authorized_email|
  json.extract! authorized_email, :id, :hashtag_id, :email
  json.url authorized_email_url(authorized_email, format: :json)
end
