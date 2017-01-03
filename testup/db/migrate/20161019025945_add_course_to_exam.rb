class AddCourseToExam < ActiveRecord::Migration
  def change
    add_reference :exams, :course, index: true, foreign_key: true
  end
end
