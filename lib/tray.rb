class Tray

	attr_reader :y, :x

	@@block_height = Blocks::Block.height
	@@block_width = Blocks::Block.width

	def initialize(window)
		@pic = Blocks::Tools.load_tray(0)
		
		@win = window
		@scalex = window.width / @pic.width
		@scaley = window.height / @pic.height

		@@block_scale = window.height / @@block_height
	
		@y = @pic.height * 0.835
		@x = window.width * 0.03
	end

	def height
		@win.height
	end

	def update
	end

	def width
		((@pic.width * @scalex) *0.66) - ((@@block_width * @@block_scale) / 4)
	end
	
	def draw
		@pic.draw(0, 0, Layer::Tray, @scalex, @scaley)
	end
end
