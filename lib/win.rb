require "gosu"

class Win < Gosu::Window

	attr_reader :tray

	def initialize 
		super width = 640, height = 1080
		@controller = Controller.new(self)
		@back = Background.new(self)
		@tray = Tray.new(self)
		Blocks::Set.the_spawns(@tray)

		@shape_mgr = Shape_Manager.new(self)
	end

	def button_down id
		case id
		when Gosu::KB_ESCAPE
			close	
		when Gosu::KB_LEFT
			@shape_mgr.current.move_left
		when Gosu::KB_RIGHT
			@shape_mgr.current.move_right
		when Gosu::KB_DOWN
			@shape_mgr.current.fast_fall
		end	
	end

	def button_up id
		##@shape_mgr.current.reset_speed if id == Gosu::KB_DOWN
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
