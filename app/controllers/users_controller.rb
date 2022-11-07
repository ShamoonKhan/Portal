class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all
    end    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to users_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            @course = @user.course_ids
            format.html { redirect_to welcome_index_path, notice: "Courses was successfully created." }
            format.json { render :index, status: :created, location: @user }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @courier.errors, status: :unprocessable_entity }
          end
        end     
    end   
  


 

    private
def user_params
    params.require(:user).permit(:first_name,:lname,:email,:cnic_no,:course_ids,:avatar,:contact,:address ,course_ids: [])
end
end


