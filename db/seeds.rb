puts 'SEEDING....'

User.destroy_all

print 'seeding admin...'

User.create!(
  username: 'admin',
  password: 'tchinadmin',
  email: 'admin@tchinontwitch.fr'
)

puts 'done...'
