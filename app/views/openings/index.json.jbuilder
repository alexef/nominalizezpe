json.array!(@openings) do |opening|
  json.extract! opening, :id
  json.url opening_url(opening, format: :json)
end
