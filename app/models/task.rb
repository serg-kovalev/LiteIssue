class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :task_type
  belongs_to :task_priority
  belongs_to :task_status
  has_many :comments

  scope :any_tags, -> (tags) { where("tags && ARRAY[?]",tags) }
  scope :all_tags, -> (tags) { where("tags @> ARRAY[?]",tags) }

end
