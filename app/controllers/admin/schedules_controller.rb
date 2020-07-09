class Admin::SchedulesController < ApplicationController
  before_action :if_not_admin,only:[:new,:edit,:create,:update,:destroy]
  before_action :get_schedule, only:[:edit,:update,:destroy]

  def new
    @schedule = Schedule.new()
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.year = params[:schedule]["start_time(1i)"].to_i
    @schedule.month = params[:schedule]["start_time(2i)"].to_i
    @schedule.day = params[:schedule]["start_time(3i)"].to_i
    @schedule.hour = params[:schedule]["start_time(4i)"].to_i
    @schedule.mini = params[:schedule]["start_time(5i)"].to_i
    if @schedule.save
      flash[:notice] = "予定の追加に成功しました"
      redirect_to schedule_path
    else
      flash[:alert] = "予定の追加に失敗しました"
      redirect_to schedule_path
    end
  end

  def update
    @schedule.year = params[:schedule]["start_time(1i)"].to_i
    @schedule.month = params[:schedule]["start_time(2i)"].to_i
    @schedule.day = params[:schedule]["start_time(3i)"].to_i
    @schedule.hour = params[:schedule]["start_time(4i)"].to_i
    @schedule.mini = params[:schedule]["start_time(5i)"].to_i
    @schedule.update(schedule_params)
    if @schedule.save
      flash[:notice] = "予定の編集に成功しました"
      redirect_to schedule_path
    else
      flash[:alert] = "予定の編集に失敗しました"
      redirect_to schedule_path
    end
  end

  def destroy
    if @schedule.destroy
      flash[:notice] = "予定の削除に成功しました"
      redirect_to schedule_path
    else
      flash[:alert] = "予定の削除に失敗しました"
      redirect_to schedule_path
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def get_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :body,
      :start_time
    )
  end

end
