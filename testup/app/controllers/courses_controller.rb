class CoursesController < ApplicationController
  before_action :is_teacher?, only: [:new, :create]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    session[:course_id] = @course.id
  end

  # GET /courses/new
  def new
    @course = Course.new
    @course.teacher = @curr_user.id
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.teacher = @curr_user.id

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course }
        format.json { render :show, status: :created }
        if is_teacher?
          @curr_user.courses.push(@course)
        end
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      @course = Course.find(params[:id])
      if @course.update(course_params)
        format.html { redirect_to @course}
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :user_ids => [])
    end
end
