json.array!(@votes) do |vote|
  json.extract! vote, :id, :comment
  json.url vote_url(vote, format: :json)
end
