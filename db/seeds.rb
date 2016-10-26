require 'json'

Tag.create(name: "Board Game")
5.times do |i|
  response = JSON.parse(HTTParty.get("https://bgg-json.azurewebsites.net/thing/#{i+1}"))

  if response['mechanics'] != []
    tag = Tag.create(name: response['mechanics'][0])
  end

  Game.create(name: response['name'], image_url: response['image'], thumbnail_url: response['thumbnail'], min_players: response['minPlayers'], max_players: response['maxPlayers'], play_time: response['playingTime'], publish_year: response['yearPublished'], description: response['description'], vote: 12, tag_id: tag ? tag.id : 1)
end
