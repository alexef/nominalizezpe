json.array!(@people) do |person|
  json.extract! person, :id, :status, :name, :picture_url
  json.url person_url(person, format: :json)
end
