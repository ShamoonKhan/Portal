class StudentsController < ApplicationController
    before_action :authenticate_user!
    def index
        @students = User.all.where( role: "student")
    end

    def edit
        @student = User.find(params[:id])
    end

    def update
        @student = User.find(params[:id])
        if @student.update(student_params)
          redirect_to students_path
        end
    end

    def show
        @student = User.find(params[:id])
    end

    def destroy
      
        @student = User.find(params[:id])
        @student.destroy
    
        redirect_to students_path, status: :see_other
    end
    private
    def student_params
        params.require(:user).permit(:name,:last_name,:email,:cnic,:contact,:role,:roll_no)
    end
end
  
