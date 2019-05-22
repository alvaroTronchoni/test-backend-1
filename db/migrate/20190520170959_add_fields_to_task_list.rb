class AddFieldsToTaskList < ActiveRecord::Migration[5.2]
  def change
    add_column :task_lists, :start_date, :datetime
    add_column :task_lists, :end_date, :datetime
    remove_column :task_lists, :interval
  end
end
