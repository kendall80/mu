class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @transactions = Transaction.all
  end

  def show
  end

  def new
    @transaction = current_user.transactions.build
  end

  def edit
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def correct_user
      @transaction = current_user.transactions.find_by(id: params[:id])
      redirect_to transactions_path, notice: "Not authorized to edit this transaction" if @transaction.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:category, :date, :amount, :location, :account, :tag)
    end
end
