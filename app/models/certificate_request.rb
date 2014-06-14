class CertificateRequest < ActiveRecord::Base
  before_create do
    if self.encoded_request.empty?
      self.encoded_request = OpenSSL::X509::Request.new.to_s
    end
  end

  def request
    OpenSSL::X509::Request.new(self.encoded_request)
  end

  def decoded_request
    raw_base64 = request.to_s.split("\n")[1..-2].join("")
    raw = Base64.decode64(raw_base64)
    raw.unpack("C*")
  end
end
