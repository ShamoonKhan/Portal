class AccountsController < ApplicationController
  before_action :authenticate_user!
  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_url, notice: 'Account was successfully created.' }
        format.json { render :index, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    return unless @account.update(account_params)
    redirect_to @account
  end

  

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to accounts_path, status: :see_other
  end

  private

  def account_params
    params.require(:account).permit(:amount, :acc_num, :user_id)
  end
end
