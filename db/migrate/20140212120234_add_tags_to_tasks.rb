class AddTagsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :tags, :text, array: true, default: []
    add_index  :tasks, :tags, using: 'gin'
  end
end
