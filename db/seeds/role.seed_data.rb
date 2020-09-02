#seed for roles

class Role
  def self.seed
    roles = ["SuperAdmin", "Admin", "Member"]
    roles.each  { |roles|
      role = Role.new(
        name: roles,
        description: roles
      )
      role.save!
    }
  end
end
