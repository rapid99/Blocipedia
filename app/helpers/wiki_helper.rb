module WikiHelper
  def user_is_able_to_edit
    current_user || current_user.admin?
  end

  # def add_collaborator(collaborator)
  #   @wiki.collaboration << collaborator
  # end
end
