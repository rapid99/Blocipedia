module WikiHelper
  def user_is_able_to_edit
    current_user || current_user.admin?
  end
  def add_collaborator(collab_id)
    collaborator = User.find_by(email: collab_id)
    @wiki.add_collaborator(collab_id)
  end
end
