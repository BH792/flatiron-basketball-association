class TeamsController < ApplicationController

  def new
    @players = Player.all
  end

  def create
    byebug
  end
end
