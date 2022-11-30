class SubmitsController < ApplicationController
    before_action :authenticate_user!
  load_and_authorize_resource param_method: :my_sanitizer
  load_and_authorize_resource :through => :current_user


  def index
      @submits = Submit.all.order("created_at DESC")
  end

   def show
     @submit = Submit.find(params[:id])
   end

   def new
      @submit = current_user.submits.build
   end

   def create
      @submit = current_user.submits.build(submit_params)

      if @submit.save
         redirect_to submits_path, notice: "The assignment #{@submit.name} has been uploaded."
      else
         render "new"
      end

   end

   def destroy
      @submit = Submit.find(params[:id])
      @submit.destroy
      redirect_to submits_path, notice:  "The assignment #{@submit.name} has been deleted."
   end

   private
      def submit_params
      params.require(:submit).permit(:name, :attachment)
      end

end
