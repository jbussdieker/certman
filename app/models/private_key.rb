class PrivateKey < ActiveRecord::Base
  validates :encoded_key, uniqueness: true

  before_create do
    if self.encoded_key.empty?
      self.key_size ||= 4096
      begin
        self.encoded_key = OpenSSL::PKey::RSA.new(key_size).to_s
      rescue Exception => e
        self.errors.add(:key_size, e.message)
        return false
      end
    else
      self.key_size = key.n.num_bytes * 8
    end

    self.fingerprint = calculate_fingerprint
  end

  def key
    OpenSSL::PKey::RSA.new(self.encoded_key)
  end

  def decoded_key
    raw_base64 = key.to_s.split("\n")[1..-2].join("")
    raw = Base64.decode64(raw_base64)
    raw.unpack("C*")
  end

  private

  def calculate_fingerprint
    Digest::MD5.hexdigest("Modulus=#{key.n.to_s(16)}\n")
  end
end
