json.array!(@private_keys) do |private_key|
  json.extract! private_key, :id, :key_size, :encoded_key
  json.url private_key_url(private_key, format: :json)
end
