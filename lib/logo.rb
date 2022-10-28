class Logo

	def initialize(win)
		@pic = Blocks::Tools.load_logo
		
		
		@scaley = (win.height / @pic.height)
		@scalex = (win.width / @pic.width) 
		@c = (@scaley / 4)
		@s = (@scalex / 4)

		@x, @y, = -50, 0
	end

	def update
	end
	
	def draw
		@pic.draw(@x, @y, Layer::Logo, @scalex, @scaley)
	end
end
