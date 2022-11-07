class CoursesController < ApplicationController
  before_action :authenticate_user!

    def index
      @course = Course.all
    end
    def new
        @course = Course.new
    end

    def create
        @course = current_user.courses.new(course_params)
         if @course.save
          redirect_to courses_path
         else
          render 'new'
         end
    end   

    def show
        @course = Course.find(params[:id])
    end
    def edit
        @course = Course.find(params[:id])
        render :edit
    end
    
    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
          redirect_to courses_path
        end
    end
   
    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to courses_path, status: :see_other
    end

    def reg_students
        @users= User.where(role: "student")
        end
    
    private
    def course_params
        params.require(:course).permit(:course_name,:course_type,:user_id,:credithrs)
    end
end