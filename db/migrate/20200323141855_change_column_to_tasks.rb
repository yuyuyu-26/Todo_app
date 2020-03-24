class ChangeColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    # 変更内容
  def up
    change_column :tasks, :limit_date, :time
  end

  # 変更前の状態
  def down
    change_column :tasks, :limit_date, :datetime
  end
  end
end
