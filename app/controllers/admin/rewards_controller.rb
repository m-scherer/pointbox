class Admin::RewardsController < Admin::BaseController

  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:success] = "#{@reward.name} created!"
      redirect_to reward_path(@reward)
    else
      render :new
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      flash[:success] = "#{@reward.name} updated!"
      redirect_to reward_path(@reward)
    else
      render :edit
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end

end
