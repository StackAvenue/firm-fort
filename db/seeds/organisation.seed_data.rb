#seed for organisations

class Organisation
  def self.seed
    org = ['StackAvenue', 'Google']
    org.each do |org|
      organisation = Organisation.new(
        name:             org,
        description:      org
      )
      organisation.save!
    end
  end
end