class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end