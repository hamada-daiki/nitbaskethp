class Admin::EditsController < ApplicationController
  before_action :if_not_admin

  def game
    @game = Game.last
  end

  def game_update
    @game = Game.last
    @game.year = params[:game]["date(1i)"].to_i
    @game.month = params[:game]["date(2i)"].to_i
    @game.day = params[:game]["date(3i)"].to_i
    @game.hour = params[:game]["date(4i)"].to_i
    @game.mini = params[:game]["date(5i)"].to_i
    @game.update(game_params)
    if @game.save
      flash[:notice] = "試合予定の更新に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "試合予定の更新に失敗しました"
      redirect_to root_path
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def game_params
    params.require(:game).permit(
      :place,
      :title,
      :opponent
    )
  end

end
