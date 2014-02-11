class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_status_id, :integer, :null => false, :default => 1
  end
end
