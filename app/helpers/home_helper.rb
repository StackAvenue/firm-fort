module HomeHelper

  def current_user_full_name(user)
    "#{current_user.first_name + " " + current_user.last_name}"
  end

  def first_and_last_name_initials(user)
    "#{current_user.first_name.slice(0,1)+current_user.last_name.slice(0,1)}"
  end

  def full_name(user)
    "#{user.first_name + " " + user.last_name}"
  end
end
