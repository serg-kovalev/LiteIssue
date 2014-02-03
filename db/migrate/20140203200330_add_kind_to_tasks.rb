class AddKindToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :kind, :integer, :null => false, :default => 2
  end
end
