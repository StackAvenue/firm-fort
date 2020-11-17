module UsersHelper

  def all_users_in_organisation(user)
    user.organisation_id == current_user.organisation_id && 
                (user.invitation_status == "Accepted" || user.invitation_status == nil)
  end
end
