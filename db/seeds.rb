require 'json'

default_tag = Tag.create(name: "Trick-taking")

100.times do |i|
  response = JSON.parse(HTTParty.get("https://bgg-json.azurewebsites.net/thing/#{i+1}"))

  if !response['message']
    tag = Tag.find_or_create_by(name: response['mechanics'][0]) if response['mechanics'] && response['mechanics'] != []

    Game.create!(name: response['name'], image_url: response['image'], thumbnail_url: response['thumbnail'], min_players: response['minPlayers'], max_players: response['maxPlayers'], play_time: response['playingTime'], publish_year: response['yearPublished'], description: response['description'], vote: 12, tag_id: tag ? tag.id : default_tag.id)
  end

  puts "#{i+1}: #{tag ? tag.id : default_tag.id} #{response['name'] ? response['name'] : '*** SKIP ***'}"
end
