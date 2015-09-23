class User < ActiveRecord::Base
  has_many :tasks, foreign_key: :assign_user_id
end
