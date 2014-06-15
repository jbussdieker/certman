class Certificate < ActiveRecord::Base
  before_create do
    if self.encoded_certificate.empty?
      self.encoded_certificate = OpenSSL::X509::Certificate.new.to_s
    else
      self.subject = certificate.subject.to_s
      self.issuer = certificate.issuer.to_s
    end

    self.fingerprint = calculate_fingerprint
  end

  def certificate
    OpenSSL::X509::Certificate.new(self.encoded_certificate)
  end

  private

  def calculate_fingerprint
    Digest::MD5.hexdigest("Modulus=#{certificate.public_key.n.to_s(16)}\n")
  end
end
