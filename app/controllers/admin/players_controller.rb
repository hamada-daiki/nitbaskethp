class Admin::PlayersController < ApplicationController
  before_action :if_not_admin,only:[:new,:edit,:create,:update,:destroy]

  def index
    @players = Player.all
    @p_4year = Array.new
    @p_3year = Array.new
    @p_2year = Array.new
    @p_1year = Array.new
    @players.each do |p|
      if p.year == 4
        @p_4year << p
        @sur4 = get_null(@p_4year.length)
      elsif p.year == 3
        @p_3year << p
        @sur3 = get_null(@p_3year.length)
      elsif p.year == 2
        @p_2year << p
        @sur2 = get_null(@p_2year.length)
      else
        @p_1year << p
        @sur1 = get_null(@p_1year.length)
      end
    end
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to root_path
      flash[:notice] = "部員の追加に成功しました"
    else
      flash[:alert] = "部員の追加に失敗しました。"
      redirect_to new_admin_player_path
    end
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    if @player.save
      redirect_to root_path
      flash[:notice] = "部員の編集に成功しました"
    else
      redirect_to edit_admin_player_path(@player)
      flash[:alert] = "部員の編集に失敗しました"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      flash[:notice] = "部員の削除に成功しました"
      redirect_to admin_players_path
    else
      flash[:alert] = "部員の削除に失敗しました"
      redirect_to edit_admin_player_path(@player)
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def player_params
    params[:player][:number] = params[:player][:number].to_i
    params[:player][:height] = params[:player][:height].to_i
    params.require(:player).permit(
      :name,
      :number,
      :from,
      :height,
      :img,
      :position,
      :year
    )
  end

  def get_null(num)
    surplus = num % 4
    ans = 4 - surplus
    return ans
  end
end
