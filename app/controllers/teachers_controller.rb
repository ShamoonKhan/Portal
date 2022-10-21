class TeachersController < ApplicationController
    before_action :authenticate_user!
    def index
        @teacher = User.all.where( role: "teacher")
    end

    def edit
        @teacher = User.find(params[:id])
   
    
    end

    def update

        @teacher = User.find(params[:id])
        if @teacher.update(teacher_params)
          redirect_to teachers_path
        end
    end

    def show
        @teacher = User.find(params[:id])
    end

    def destroy
      
        @teacher = User.find(params[:id])
        @teacher.destroy
    
        redirect_to teachers_path, status: :see_other
    end
    private
    def teacher_params
        params.require(:user).permit(:name,:last_name,:email,:cnic,:contact,:role,:roll_no, :teacher_ids)
    end
end
