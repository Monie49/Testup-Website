class CreateRegisteredExams < ActiveRecord::Migration[5.0]
  def change
    create_table :registered_exams do |t|
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
