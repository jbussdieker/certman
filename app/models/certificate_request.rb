class CertificateRequest < ActiveRecord::Base
  before_create do
    if self.encoded_request.empty?
      self.encoded_request = OpenSSL::X509::Request.new.to_s
    else
      self.subject = request.subject.to_s
    end

    self.fingerprint = calculate_fingerprint
  end

  def request
    OpenSSL::X509::Request.new(self.encoded_request)
  end

  def decoded_request
    raw_base64 = request.to_s.split("\n")[1..-2].join("")
    raw = Base64.decode64(raw_base64)
    raw.unpack("C*")
  end

  private

  def calculate_fingerprint
    Digest::MD5.hexdigest("Modulus=#{request.public_key.n.to_s(16)}\n")
  end
end
