class Tray

	attr_reader :y, :x

	def initialize(window)
		@pic = Blocks::Tools.load_tray(0)
		
		@win = window
		@scalex = window.width / @pic.width
		@scaley = window.height / @pic.height

	
		@y = (@pic.height * @scaley) * 0.835
		@x = 0
	end

	def height
		Gosu.distance @x, @y, @x, @win.height
	end

	def update
	end

	def width
		((@pic.width * @scalex) * 0.595)
	end
	
	def draw
		@pic.draw(0, 0, Layer::Tray, @scalex, @scaley)
	end
end
