class RewardsController < ApplicationController

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

  private

  def reward_params
    params.require(:reward).permit(:name, :cost)
  end

end
