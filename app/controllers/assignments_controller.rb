class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  # before_filter :admin_access, only: [:new, :create, :edit, :update, :destroy]


    def index
     @assignments = Assignment.all.order("created_at DESC")
    end


   def show
     @assignment = Assignment.find(params[:id])
   end

   def new
    
     @assignment = Assignment.new
   end  

   def create
     @assignment = current_user.assignments.build
     @assignment.name = params[:assignment][:name]
     @assignment.description = params[:assignment][:description]
     @assignment.picture = params[:assignment][:picture]

     if @assignment.save
       flash[:notice] = "Assignment was saved successfully."
       redirect_to @assignment
     else
       flash.now[:alert] = "Error creating assignment. Please make sure there is a name and description."
       render :new
     end
   end

     def edit
     @assignment = Assignment.find(params[:id])
     end

      def update
     @assignment = Assignment.find(params[:id])

     @assignment.name = params[:assignment][:name]
     @assignment.description = params[:assignment][:description]
     @assignment.picture = params[:assignment][:picture]

     if @assignment.save
        flash[:notice] = "Assignment was updated successfully."
       redirect_to @assignment
     else
       flash.now[:alert] = "Error saving assignment. Please try again."
       render :edit
     end
      end

   def destroy
     @assignment = Assignment.find(params[:id])

     if @assignment.destroy
       flash[:notice] = "\"#{@assignment.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the assignment."
       render :show
     end
   end

     private 

     def assignment_params
         params.require(:assignment).permit(:name, :description, :picture, :user_id[])
     end
end
