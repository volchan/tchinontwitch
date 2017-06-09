# puts 'SEEDING....'
#
# User.destroy_all
# Realm.destroy_all
Raid.destroy_all
#
# print 'seeding admin...'
#
# User.create!(
#   username: 'admin',
#   password: 'tchinadmin',
#   email: 'admin@tchinontwitch.fr',
#   admin: true
# )
#
# puts 'done seeding admin...'
#
# print 'seeding realms...'
#
# realm_call_url = "https://eu.api.battle.net/wow/realm/status?locale=en_GB&apikey=29vbsw7mjp4bjk2qqczb2ckxv5yhh5me"
# realm_call = RestClient.get(realm_call_url)
# parsed_realm_call = JSON.parse(realm_call)
#
# parsed_realm_call['realms'].each do |realm|
#   Realm.create!(
#     name: realm['name'],
#     slug: realm['slug']
#   )
#   print "seeded #{realm['name']}..."
# end
#
# puts 'done seeding realms....'
#
# print 'seeding dungeons...'
#
# dungeons_api_call = RestClient.get('https://eu.api.battle.net/wow/zone/?locale=en_GB&apikey=29vbsw7mjp4bjk2qqczb2ckxv5yhh5me')
# dungeons_parsed_call = JSON.parse(dungeons_api_call)
# dungeons_parsed_call['zones'].each do |zone|
#   next unless zone['isRaid']
#   Dungeon.create!(name: zone['name'], slug: zone['urlSlug'])
#   print "seeded #{zone['name']}..."
# end
#
# puts 'done seeding dungeons...'

print 'seeding raids...'

dungeons = Dungeon.all
30.times do |i|
  new_raid_infos = {}
  new_raid_infos[:dungeon] = dungeons.sample
  new_raid_infos[:date] = Time.now + rand(-10..5).day
  new_raid_infos[:difficulty] = rand(0..2)
  new_raid_infos[:leader] = User.first
  Raid.create!(new_raid_infos)
  print "seeded raid #{i + 1}..."
end

puts 'done seeding raids...'
