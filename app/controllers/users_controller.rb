class UsersController < ApplicationController
  before_action :authenticate_user!, :check_user

  def show
    @user = current_user
    puts "show_user" * 20
  end

  def check_user
    unless current_user && current_user.id == params[:id].to_i
      redirect_to root_path, alert: "Accès non autorisé."
    end
  end

  # def check_user
  #   @user = User.find(params[:id])
  #   if current_user.id != @user.id
  #     redirect_to root_path
  #   end
  # end

end
