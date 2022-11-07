class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
    end 
    def new
    @attendance = Attendance.new
    end
    def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to attendances_path
    end
    def edit
      @attendance = Attendance.find(params[:id])
      render :edit
    end
    
    def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendence_params)
    redirect_to attendances_path
    end
    end
    
    def show
    @attendance = Attendance.find(params[:id])
    end
    
    def create
    @attendance = Attendance.new(attendence_params)
    respond_to do |format|
    if @attendance.save
    format.html { redirect_to attendances_path, notice: "Attendance was successfully created." }
    format.json { render :index, status: :created, location: @attendance }
    else
    format.html { render :new, status: :unprocessable_entity }
    format.json { render json: @attendance.errors, status: :unprocessable_entity }
    end
    end 
    end 
    
    def reg_students
    
    end
    
    def attendence_params
    params.require(:attendance).permit(:user_id, :course_id, :date, :present)
    end 
    
end
