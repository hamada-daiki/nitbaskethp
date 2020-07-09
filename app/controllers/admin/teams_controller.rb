class Admin::TeamsController < ApplicationController
  before_action :if_not_admin,only:[:edit,:update]

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    if @team.save
      redirect_to root_path
      flash[:notice] = "チーム情報の更新に成功しました"
    else
      redirect_to edit_admin_team_path(@team)
      flash[:alert] = "チーム情報の更新に失敗しました"
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def team_params
    params.require(:team).permit(
      :title,
      :body,
      :img,
    )
  end

end
