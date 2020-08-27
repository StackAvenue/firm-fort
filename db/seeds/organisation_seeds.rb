#seed for organisations

class SeedOrganisation
  def self.create_organisation
    organisation = Organisation.new(
      :name            => "StackAvenue",
      :description     => "StackAvenue"
    )
    organisation.save!
  end
end