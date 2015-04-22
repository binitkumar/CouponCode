json.array!(@staffs) do |staff|
  json.extract! staff, :id, :owner_id, :user_id, :first_name, :last_name
  json.url staff_url(staff, format: :json)
end
