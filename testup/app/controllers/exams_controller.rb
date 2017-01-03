class ExamsController < ApplicationController
  before_action :signed_in_user, only: :show
  before_action :teacher_user,   only: [:create, :destroy]

  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def edit
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.course = Course.find(session[:course_id])
    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam }
        format.json { render :show, status: :created }
        flash[:success] = "Exam created!"
      else
        render :new
      end
    end
  end


  def update
    respond_to do |format|
      @exam = Exam.find(params[:id])
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url}
      format.json { head :no_content }
    end
  end

  private
    def exam_params
      params.require(:exam).permit(:date, :location, :seats)
    end

    def teacher_user
      redirect_to(root_url) unless curr_user.teacher?
    end
end
