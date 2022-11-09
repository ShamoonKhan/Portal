module Accounts
    ActiveSupport::Concern
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
end