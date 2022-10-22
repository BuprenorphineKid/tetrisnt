module Blocks

	class << self
		def load
			colors = ["red", "green", "yellow", "blue",\
	                                     "purple", "white"]
			@objs = colors.map {|c| Blocks::Tools.load_obj(c, "block")}
			@objs.shuffle!.rotate!.shuffle!
		end
	end
end
