class Admin::PointTransactionsController < Admin::BaseController

  def index
    @user = User.find(params[:user_id])
    @current_balance = @user.current_balance
  end

  def new
    @user = User.find(params[:user_id])
    @point_transaction = PointTransaction.new
  end

  def create
    @user = User.find(params[:user_id])
    @point_transaction = @user.point_transactions.new(tran_params)
    if @point_transaction.save
      flash[:success] = "Transaction saved!"
      redirect_to admin_user_point_transactions_path
    else
      render :new
    end
  end

  private

  def tran_params
    params.require(:point_transaction).permit(:point_change)
  end

end
