module UsersHelper
  def friend?(friend)
    return false if (current_user.friendships.where(friend_id:friend.id) == [] && current_user != friend)
    true
  end
end
