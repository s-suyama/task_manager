class Priority < ActiveRecord::Base
  has_many :tasks
  default_scope { order(sequence: :asc)}
end
