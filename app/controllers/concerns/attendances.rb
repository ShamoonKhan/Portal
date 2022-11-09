module Attendances
    ActiveSupport::Concern
    def create
        @attendance = Attendance.new(attendence_params)
        respond_to do |format|
          if @attendance.save
            format.html { redirect_to attendances_path, notice: 'Attendance was successfully created.' }
            format.json { render :index, status: :created, location: @attendance }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @attendance.errors, status: :unprocessable_entity }
          end
        end
    end
end