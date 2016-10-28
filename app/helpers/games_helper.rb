module GamesHelper
	def group(tag)
		count = tag.games.count / 6
		tag.games.each_slice(6).to_a[0...count]
	end
end
