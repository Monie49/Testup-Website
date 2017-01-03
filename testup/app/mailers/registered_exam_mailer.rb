class RegisteredExamMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def registered_exam_email(user, exam)
    @user = user
    @exam = exam
    mail(to: @user.email, subject: 'Thank You for Using TestUp to Register for Your Exam')
  end
end
