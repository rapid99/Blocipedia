class WikiController < ApplicationController
  # before_action :require_sign_in, except: :show
  # before_action :authorize_user, except: [:show, :new, :create]

  def show
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wiki = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes(params[:wiki])
    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to :wiki
    else
      flash[:alert] = "There was a problem saving the wiki"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted successfully"
    else
      flash[:alert] = "There was an error deleting the wiki"
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end


end
