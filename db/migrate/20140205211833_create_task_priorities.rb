class CreateTaskPriorities < ActiveRecord::Migration
  def change
    create_table :task_priorities do |t|
      t.string :name
      t.string :icon
    end
  end
end
