json.array!(@certificate_requests) do |certificate_request|
  json.extract! certificate_request, :id, :encoded_request, :subject, :private_key_id
  json.url certificate_request_url(certificate_request, format: :json)
end
