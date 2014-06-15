json.array!(@certificates) do |certificate|
  json.extract! certificate, :id, :encoded_certificate, :subject, :issuer, :private_key_id
  json.url certificate_url(certificate, format: :json)
end
