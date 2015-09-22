class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status_id
      t.integer :priority_id
      t.integer :project_id
      t.integer :assign_user
      t.integer :lock_version, default: 0

      t.timestamps null: false
    end
  end
end
