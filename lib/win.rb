
require "gosu"

class Win < Gosu::Window
	attr_reader :tray, :traypic

	def initialize 
		super width = 640, height = 1080, fullscreen:  true
		self.caption = "blocks_game"
		@traypic = Tools.load_tray(0)
		@tray = Tray.new(self, @traypic)

		@backpic = Tools.load_back(0)
		@back = Background.new(self, @backpic)

		@block_pics = Blocks.load 
		@gen = Blocks::Generator.new(self, @block_pics)
	end

	def button_down id
		close if id == Gosu::KB_ESCAPE
		if @gen.current_shape.moveable?	
			@gen.current_shape.x += 63 if id == Gosu::KB_RIGHT
			@gen.current_shape.x -= 63 if id == Gosu::KB_LEFT
			@gen.current_shape.speed = 7.0 if id == Gosu::KB_DOWN
		end
	end

	def button_up id
		@gen.current_shape.reset_speed if id == Gosu::KB_DOWN
	end

	def update
		@gen.update
	end

	def draw
		@back.draw
		@tray.draw
		@gen.draw
	end
end
