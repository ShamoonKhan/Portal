class CoursesController < ApplicationController
  before_action :authenticate_user!
  def create
    @course = Course.new(course_params)
    if @course.save
      UserCourse.create(course_id: @course.id  , user_id: params[:course][:user_course_ids] )
      redirect_to courses_path
    else
      render 'new'
    end
  end
  def index
    @course = Course.all
    authorize @course
  end

  def new
    @course = Course.new
    authorize @course
  end

  def show
    @course = Course.find(params[:id])
    authorize @course
  end

  def edit
    @course = Course.find(params[:id])
    authorize @course
    render 'edit'
  end

  def update
    @course = Course.find(params[:id])
    authorize @course
    return unless @course.update(course_params)

    redirect_to courses_path
  end

  def destroy
    @course = Course.find(params[:id])
    authorize @course
    @course.destroy
    redirect_to courses_path, status: :see_other
  end

  def reg_students
    @users = User.where(role: 'student')
  end

  private

  def course_params
    params.require(:course).permit(:course_name, :course_type, :credithrs, :user_id)
  end
end
