class PrivateKey < ActiveRecord::Base
  before_create do
    if self.encoded_key.empty?
      self.key_size ||= 4096
      self.encoded_key = OpenSSL::PKey::RSA.new(key_size).to_s
    else
      self.key_size = key.n.num_bytes * 8
    end
  end

  def key
    OpenSSL::PKey::RSA.new(self.encoded_key)
  end

  def decoded_key
    raw_base64 = key.to_s.split("\n")[1..-2].join("")
    raw = Base64.decode64(raw_base64)
    raw.unpack("C*")
  end
end
