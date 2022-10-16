class Controller

	def self.target=(shape)
		@@target = shape
	end

	def initialize(win)
		@win = win
	end	

	def query
		if @win.button_down? Gosu::KB_LEFT
			@@target.move_left
		elsif @win.button_down? Gosu::KB_RIGHT
			@@target.move_right
		elsif @win.button_down? Gosu::KB_DOWN
			@@target.fast_fall
		end	
	end
end
