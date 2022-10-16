require "gosu"

class Win < Gosu::Window

	attr_reader :tray

	def initialize 
		super width = 640, height = 1080
		@back = Background.new(self)
		@tray = Tray.new(self)
		Blocks::Set.the_spawns(@tray)

		@shape_mgr = Shape_Manager.new(self)
	end

	def button_down id
		close if id == Gosu::KB_ESCAPE
		if @shape_mgr.current_shape.moveable?	
			@shape_mgr.current_shape.x += 63 if id == Gosu::KB_RIGHT
			@shape_mgr.current_shape.x -= 63 if id == Gosu::KB_LEFT
			@shape_mgr.current_shape.fast_fall if id == Gosu::KB_DOWN
		end
	end

	def button_up id
		@shape_mgr.current_shape.reset_speed if id == Gosu::KB_DOWN
	end

	def update
		@shape_mgr.update
	end

	def draw
		@back.draw
		@tray.draw
		@shape_mgr.draw
	end
end
