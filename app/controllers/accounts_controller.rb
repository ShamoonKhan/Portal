class AccountsController < ApplicationController
  before_action :authenticate_user!
  include Accounts
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
    params.require(:account).permit(:amount, :acc_num)
  end
end
