class HomeController < ApplicationController
  def top
    @game = Game.last
    @posts = Post.all.order(created_at: "DESC")
  end

  def article
    @posts = Post.all.order(created_at: "DESC")
  end

  def about
    @team = Team.find(1)
  end

  def schedule
    @schedules = Schedule.all
  end

  def schedule_show #scheduleのshow
    @schedule = Schedule.find(params[:id])
  end

  def member
  end

  def acssess
  end

end
