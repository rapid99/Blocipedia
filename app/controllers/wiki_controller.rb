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
    @wiki = Wiki.create!(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki has been saved"
      redirect_to wikis_path
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to wiki_index_path
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
