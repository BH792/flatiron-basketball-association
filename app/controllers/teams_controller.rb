class TeamsController < ApplicationController

  before_action :logged_in?

  def new
    @players = Player.all
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = session[:user_id]
    if @team.save
      redirect_to user_path(session[:user_id])
    else
      redirect_to new_team_path
    end
  end
   def edit
     @players = Player.all
     @team = Team.find_by_id(params[:id])
   end

    def update
      @team = Team.find_by_id(params[:id])
        @team.user_id = session[:user_id]
      if @team.update(team_params)
        byebug
        redirect_to user_path(session[:user_id])
      else
        render 'edit'
      end
    end

  private

  def team_params
    params.require(:team).permit(
      :name,
      player_ids: []
      )
  end
end
