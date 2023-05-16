class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    puts "show_user" * 20
  end
end
