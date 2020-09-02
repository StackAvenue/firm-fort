#seed for organisations

class Organisation
  def self.seed
    organisation = Organisation.new(
      name:             "StackAvenue",
      description:      "StackAvenue"
    )
    organisation.save!
  end
end