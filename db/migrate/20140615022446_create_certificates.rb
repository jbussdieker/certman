class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.text :encoded_certificate
      t.string :subject
      t.string :issuer
      t.string :fingerprint
      t.integer :private_key_id

      t.timestamps
    end
  end
end
