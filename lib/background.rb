class Background

	def initialize(window, pic)
		@pic = pic
		@scale = window.height / pic.height
	end

	def draw
		@pic.draw(0, 0, 0, @scale,
		      @scale)
	end
end
