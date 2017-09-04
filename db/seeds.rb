# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
roles = {}

[:user, :banned, :moderator, :admin].each do |role|
  roles[role] = User::Role.find_or_create_by({ name: role })
end

User
  .create(email: 'moonlight8978@gmail.com', password: '123456')
  .roles << roles[:admin] << roles[:user] << roles[:moderator]

User
  .create(email: 'loz@gmail.com', password: '123456')
  .roles << roles[:user] << roles[:moderator]

User
  .create(email: 'cac@gmail.com', password: '123456')
  .roles << roles[:user]
  
User
  .create(email: 'veu@gmail.com', password: '123456')
  .roles << roles[:banned]
