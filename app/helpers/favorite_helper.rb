module FavoriteHelper

def favorite?(game)
return false if (current_user.favorites.where(game_id:game.id) == [])
    true
end
end