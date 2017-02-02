class CollaborationsController < ApplicationController

  before_action :set_wiki

  def new
    @collaboration = @wiki.collaborations.new
  end

  def show
    @collaboration = Collaboration.find(params[:id])
  end

  def update
    @collaboration.update_attributes(collaboration_params)
    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to wikis_path
    end
  end

  def create
    @collaboration = @wiki.collaborations.new(collaboration_params)

     if @collaboration.save
       flash[:notice] = "Collaboration was saved."
       redirect_to @wiki
     else
       flash[:error] = "Error. Could not save the collaboration."
       redirect_to @wiki
     end
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])

    if @collaboration.destroy
       flash[:notice] = " #{@collaboration.user.name} was successfully removed."
       redirect_to @wiki
     else
       flash[:error] = "Error. Could not remove the collaboration."
       redirect_to @wiki
     end
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

  def collaboration_params
    params.require(:collaboration).permit(:wiki_id, :user_id)
  end


end
