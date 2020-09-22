module HomeHelper

  def full_name(user)
    "#{current_user.first_name + " " + current_user.last_name}"
  end

  def first_and_last_name_initials(user)
    "#{current_user.first_name.slice(0,1)+current_user.last_name.slice(0,1)}"
  end
end
