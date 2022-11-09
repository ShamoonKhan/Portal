class CoursesController < ApplicationController
  before_action :authenticate_user!
  include Courses
  def index
    @course = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
    render 'edit'
  end

  def update
    @course = Course.find(params[:id])
    return unless @course.update(course_params)

    redirect_to courses_path
  end

  def destroy
    @course = Course.find(params[:id])
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
