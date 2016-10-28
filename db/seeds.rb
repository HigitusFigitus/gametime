require 'json'

default_tag = Tag.create(name: "Trick-taking")

2.times do |i|
  response = JSON.parse(HTTParty.get("https://bgg-json.azurewebsites.net/thing/#{i+1}"))

  if !response['message']
    tag = Tag.find_or_create_by(name: response['mechanics'][0]) if response['mechanics'] && response['mechanics'] != []

    Game.find_or_create_by(name: response['name'], image_url: response['image'], thumbnail_url: response['thumbnail'], min_players: response['minPlayers'], max_players: response['maxPlayers'], play_time: response['playingTime'], publish_year: response['yearPublished'], description: response['description'], tag_id: tag ? tag.id : default_tag.id)

  end

  puts "#{i+1}: #{tag ? tag.id : default_tag.id} #{response['name'] ? response['name'] : '*** SKIP ***'}"
end

urls = ["https://i.imgur.com/i9k8D6W.jpg", "https://i.imgur.com/KHLSocG.jpg", "https://i.imgur.com/VqIiZ25.jpg", "https://i.imgur.com/dRxnay8.jpg", "https://i.imgur.com/LnG12CJ.jpg"]

5.times do |i|
  User.create!(email: "Faker::Internet.email", username: Faker::Internet.user_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, image_url: urls[i])
end
