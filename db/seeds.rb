puts 'SEEDING....'

User.destroy_all
Server.destroy_all

print 'seeding admin...'

User.create!(
  username: 'admin',
  password: 'tchinadmin',
  email: 'admin@tchinontwitch.fr'
)

puts 'done seeding admin...'

print 'seeding realms...'

realm_call_url = "https://eu.api.battle.net/wow/realm/status?locale=en_GB&apikey=29vbsw7mjp4bjk2qqczb2ckxv5yhh5me"
realm_call = RestClient.get(realm_call_url)
parsed_realm_call = JSON.parse(realm_call)

parsed_realm_call['realms'].each do |realm|
  Server.create!(
    name: realm['name'],
    slug: realm['slug']
  )
  print "seeded #{realm['name']}..."
end

puts 'done seeding servers....'
