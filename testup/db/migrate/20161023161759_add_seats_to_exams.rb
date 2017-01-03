class AddSeatsToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :seats, :integer
  end
end
