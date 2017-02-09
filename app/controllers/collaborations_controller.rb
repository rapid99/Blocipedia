class CollaborationsController < ApplicationController
  before_action :set_wiki

  def new
    @collaboration = Collaboration.new
  end

  def show
    @collaboration = Collaboration.find(params[:user_id])
  end

  def edit
    @collaboration = Collaboration.find(params[:user_id])
  end

  def update
    @collaboration.update_attributes(collaboration_params)
    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to wikis_path
    end
  end

  def create
    user = User.find_by(email: params["collaboration"]["user"])
    @collaboration = Collaboration.create!(wiki_id: params["wiki_id"], user_id: user.id)

     if @collaboration.save
       flash[:notice] = "Collaboration was saved."
       redirect_to wiki_path(@wiki)
     else
       flash[:error] = "Error. Could not save the collaboration."
       redirect_to wiki_path(@wiki)
     end
  end

  def destroy
     @collaboration = Collaboration.find(params["id"])
    if @collaboration.destroy
       flash[:notice] = "#{@collaboration.user.email} was successfully removed."
       redirect_to wiki_path(@wiki)
     else
       flash[:error] = "Error. Could not remove the collaboration."
       redirect_to wiki_path(@wiki)
     end
  end

  private
  
  def set_wiki
    @wiki = Wiki.find(params["wiki_id"])
  end


  def collaboration_params
    params.require(:collaboration).permit(:wiki_id, :user_id, :collaboration)
  end


end
