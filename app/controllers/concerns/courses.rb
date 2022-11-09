module Courses
  ActiveSupport::Concern
  
  def create
    @course = Course.new(course_params)
    if @course.save
      TableUserCourse.create(course_id: @course.id  , user_id: params[:course][:table_user_course_ids] )
      redirect_to courses_path
    else
      render 'new'
    end
  end
  
end
