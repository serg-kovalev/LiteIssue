class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  class << self
    def by_user_id( id )
      Project.where( user_id: id ).pluck( :id, :name )
    end
  end
end
