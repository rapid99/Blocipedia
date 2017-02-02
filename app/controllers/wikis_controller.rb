class WikisController < ApplicationController
  before_action :authorize_user, only: [:destroy]
  before_action :authorize_edit, only: [:edit, :update]


  def show
    @wiki = Wiki.find(params[:id])
  end

  def index
    @public_wikis = Wiki.where(private: false)
    @wiki = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.create(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki has been saved"
      redirect_to wikis_path
    else
      flash[:error] = "Error. Could not save the wiki."
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
      redirect_to wikis_path
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted successfully"
      redirect_to wikis_path
    else
      flash[:alert] = "There was an error deleting the wiki"
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :user_id)
  end

  def add_collaborator(collaborator)
    self.collaboration << collaborator
  end


  def authorize_edit
    unless current_user.admin? || current_user.premium?
      flash[:alert] = "Upgrade your account to access this feature!"
      redirect_to wiki_path
    end
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do this!"
      redirect_to wiki_path
    end
  end

end
