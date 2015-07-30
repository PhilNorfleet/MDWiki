class UsersController < ApplicationController
  def show
    @user = current_user
    @wikis = @user.wikis
    @wiki = Wiki.new
  end
end
