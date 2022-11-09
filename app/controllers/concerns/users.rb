module Users
    ActiveSupport::Concern
    def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            @course = @user.course_ids
            format.html { redirect_to welcome_index_path, notice: 'Courses was successfully created.' }
            format.json { render :index, status: :created, location: @user }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @courier.errors, status: :unprocessable_entity }
          end
        end
      end
end