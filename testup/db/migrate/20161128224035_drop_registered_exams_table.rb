class DropRegisteredExamsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :registered_exams
  end
end
