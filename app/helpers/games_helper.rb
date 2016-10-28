module GamesHelper
	def group(tag)
		count = tag.games.count / 1 # was 6
		tag.games.each_slice(1).to_a[0...count]
	end
end
