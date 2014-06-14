class CreateCertificateRequests < ActiveRecord::Migration
  def change
    create_table :certificate_requests do |t|
      t.text :encoded_request
      t.integer :private_key_id

      t.timestamps
    end
  end
end
