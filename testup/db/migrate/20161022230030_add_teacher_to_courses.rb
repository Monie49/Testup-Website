class AddTeacherToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :teacher, :integer
  end
end
