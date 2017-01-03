class AddLocationToExams < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :location, :string
  end
end
