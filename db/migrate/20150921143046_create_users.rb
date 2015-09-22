class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail_address
      t.string :password
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
