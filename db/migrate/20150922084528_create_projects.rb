class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
