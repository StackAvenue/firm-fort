# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

$LOAD_PATH << '.'
require 'db/seeds/organisation.seed_data.rb'
require 'db/seeds/role.seed_data.rb'
require 'db/seeds/user.seed_data.rb'

Organisation.seed
Role.seed
User.seed

