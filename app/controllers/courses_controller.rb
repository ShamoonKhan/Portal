class CoursesController < ApplicationController

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
        render :edit
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
          redirect_to  @course
        end
    end

    def create
        @course = Course.new(course_params)
         if @course.save
          redirect_to dash_path
         else
          render 'new'
         end
    end   
    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        redirect_to root_path, status: :see_other
    end

    private
    def course_params
        params.require(:course).permit(:course_name, :course_type )
    end
end
