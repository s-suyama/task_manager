class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :priority
  belongs_to :project
  belongs_to :assign_user, class_name: 'User' ,foreign_key: :assign_user_id
end
