module FavoriteHelper
  def favorite?(game)
    if current_user
      return false if (current_user.favorites.where(game_id:game.id) == [])
      return true
    end
  end
end
