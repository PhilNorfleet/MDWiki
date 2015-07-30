class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @user = current_user
    @wiki = @user.wikis.build(params.require(:wiki).permit(:title,:body,:private))

    if @wiki.save
      flash[:notice] = "Wiki Created!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error creating the wiki."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki Editted"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @user = current_user

    if @wiki.destroy
      flash[:notice] = "Wiki was deleted successfully."
      redirect_to @user
    else flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :user)
  end
end
