class Collaboration < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user #fix relationship

# method to update Collaborators
  # def update_collaborations(collaborators)
  #
  # end

  def collaboration_user
    collaborations.collect(:user_id)
  end

end
