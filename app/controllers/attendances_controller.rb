class AttendancesController < ApplicationController
  include Attendances
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
    return unless @attendance.update(attendence_params)

    redirect_to attendances_path
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  

  def attendence_params
    params.require(:attendance).permit(:user_id, :course_id, :date, :present)
  end
end
