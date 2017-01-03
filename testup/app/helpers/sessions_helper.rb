module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    @curr_user = nil
  end

  def curr_user
    if @curr_user.nil?
      @curr_user = User.find_by(id: session[:user_id])
    else
      @curr_user
    end
  end

  def is_teacher?
    curr_user.teacher == true
  end

  def is_student?
    curr_user.teacher == false
  end

  def signed_in?
    !curr_user.nil?
  end
end
