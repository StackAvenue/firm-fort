#seed for roles

class SeedRole
  def self.create_role
    role = Role.new(
      :name            => "SuperAdmin",
      :description     => "SuperAdmin"
    )
    role.save!
    
    role = Role.new(
      :name            => "Admin",
      :description     => "Admin"
    )
    role.save!
    
    role = Role.new(
      :name            => "Member",
      :description     => "Member"
    )
    role.save!
  end
  
end