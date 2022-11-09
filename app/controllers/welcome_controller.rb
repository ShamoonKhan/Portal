class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def homepage; end

  def index
    @users = User.all
  end
end
