## commented out lines are fod testing individual block. uncomment them and
## comment out the generator portions of code to implement.

class Win < Gosu::Window

	def initialize 
		super width = 640, height = 1080, fullscreen:  true
		self.caption = "blocks_game"
		@backpic = Tools.load_back(0)
		@back = Background.new(self, @backpic)
		@pics = Blocks.load 
		@gen = Blocks::Generator.new(self, @pics)
	end

	def button_down id
		close if id == Gosu::KB_ESCAPE
		if @gen.shape.moveable?
			@gen.shape.blocks.each do |bl|
							bl.x += 63 if id == Gosu::KB_RIGHT		
						end
			@gen.shape.blocks.each do |ock|
							ock.x -= 63 if id == Gosu::KB_LEFT
						end
			@gen.shape.blocks.each do |z|
							z.speed = 2.5 if id == Gosu::KB_DOWN
						end
		end
	end

	def button_up id
		@gen.shape.blocks.each do |y|
						y.reset_speed if id == Gosu::KB_DOWN
					end
	end
		
	def update
		@gen.update
#		@block.update	
	end

	def draw
		@back.draw
#		@block.draw
		@gen.draw
	end
end
