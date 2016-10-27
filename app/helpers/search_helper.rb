module SearchHelper
  def user_search(keyword)
    results = []
    results << User.where("lower(name) like ?", "#{keyword}") if 
  end

  def game_search(keyword)

  end
end
