class RegisteredExamController < ApplicationController

  def create
    @registered_exam = RegisteredExam.new
    @user = User.find(params[:user_id])
    @exam = Exam.find(params[:exam_id])
    @registered_exam.user = @user
    @registered_exam.exam = @exam
    @exam.decrement(:seats, 1)
    @exam.save
    @registered_exam.save
    RegisteredExamMailer.registered_exam_email(@user, @exam).deliver_later
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @exam = Exam.find(params[:exam_id])
    @registered_exam = RegisteredExam.where(user_id: @user.id, exam_id: @exam.id)
    if @registered_exam.delete_all
      @exam.increment!(:seats)
      redirect_to user_path
    end
  end

end
