class Background

	def initialize(window, pic)
		@pic = pic
		@scalex = window.width / pic.width
		@scaley = window.height / pic.height
	end

	def draw
		@pic.draw(0, 0, Layer::Back, @scalex, @scaley)
	end
end