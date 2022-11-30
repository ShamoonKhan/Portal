module UsersHelper
    def user_role(user)
        current_user.role == "student" || current_user.role == "teacher"
    end

    def user_check(user)
        current_user.role == "student"
    end
    
    def user_avatar(user)
        if current_user.avatar.present? 
        image_tag(current_user.avatar, width: "70%", height: "50%")
        else
            "no Picture"
    end
    end
    def show_avatar(user)
         if @user.avatar.present?
             image_tag(@user.avatar, width: "70%", height: "50%")
            else
             "no picture"
            end
    end
    def user_course(user)
         if current_user.student? 
         user_id = UserCourse.find_by(course_id: course.id).user_id
         User.find(user_id).first_name   User.find(user_id).lname
        end
        end
end