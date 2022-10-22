require "gosu"

class Win < Gosu::Window

	attr_reader :tray

	def initialize 
		super width = 640, height = 1080
		@back = Background.new(self)
		@tray = Tray.new(self)
		@logo = Logo.new(self)
		Blocks::Set.the_spawns(@tray)

		@obj_mgr = Obj_Manager.new(self)
	end

	def button_down id
		case id
		when Gosu::KB_ESCAPE
			close	
		when Gosu::KB_LEFT
			@obj_mgr.current.move_left
		when Gosu::KB_RIGHT
			@obj_mgr.current.move_right
		when Gosu::KB_DOWN
			@obj_mgr.current.land_on(@obj_mgr.active)
		end	
	end

	def button_up id
		@obj_mgr.current.reset_speed if id == Gosu::KB_DOWN
	end

	def update
		@obj_mgr.update
	end

	def draw
		@back.draw
		@tray.draw
		@logo.draw
		@obj_mgr.draw
	end
end
