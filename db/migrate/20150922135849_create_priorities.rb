class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :name
      t.integer :sequence
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
