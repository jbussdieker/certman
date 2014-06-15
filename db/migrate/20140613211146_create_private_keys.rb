class CreatePrivateKeys < ActiveRecord::Migration
  def change
    create_table :private_keys do |t|
      t.integer :key_size
      t.string :fingerprint
      t.text :encoded_key

      t.timestamps
    end
  end
end
