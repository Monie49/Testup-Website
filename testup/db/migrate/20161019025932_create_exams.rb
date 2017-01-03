class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.datetime :date

      t.timestamps null: false
    end
  end
end
