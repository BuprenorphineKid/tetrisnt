class Background

	def initialize(window)
		@pic = Blocks::Tools.load_back(0)
		@scalex = window.width / @pic.width
		@scaley = window.height / @pic.height
	end

	def draw
		@pic.draw(0, 0, Layer::Back, @scalex, @scaley)
	end
end
