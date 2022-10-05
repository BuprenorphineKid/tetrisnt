class Tray

	attr_reader :scalex, :scaley
	def initialize(window, pic)
		@pic = pic
		@scalex = window.width / pic.width
		@scaley = window.height / pic.height
	end

	def draw
		@pic.draw(0, 0, Layer::Tray, @scalex, @scaley)
	end
end
