module WikiHelper
  def user_is_able_to_edit
    current_user || current_user.admin?
  end
end
