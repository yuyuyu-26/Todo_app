class AddColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :state, :text
    add_column :tasks, :limit_date, :datetime
  end
end
