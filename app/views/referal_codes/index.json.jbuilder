json.array!(@referal_codes) do |referal_code|
  json.extract! referal_code, :id, :hashtag_id, :email, :code
  json.url referal_code_url(referal_code, format: :json)
end
