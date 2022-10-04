module Blocks

	class Block 


		attr_accessor :x
		attr_accessor :y
		
		attr_accessor :moveable
		attr_accessor :state
		attr_accessor :speed

		attr_reader :top
		attr_reader :left
		attr_reader :bottom
		attr_reader :right

		def initialize(pic, win, x, y)
			@win = win
			@pic = pic

			@scale = (@win.height / @pic.height) / 8
			@x = x
			@y = y
			@state = "falling"
			@moveable = true
			@vel = 7
			@speed = 1

			@top = -(pic.height)
			@bottom = pic.height
			@left = -(pic.width)
			@right = pic.width
		end

		def update
			if falling?
				@y += (@vel * @speed)
			end
			if idle?
				@moveable = false
			end
		end
			
		def draw
			@pic.draw_rot(@x, @y, 0, 0, 0.5, 0.5, @scale, @scale)
		end

		def moveable
			@moveable = true
		end

		def moveable?
			@moveable == true
		end

		def idle
			@state = "idle"
		end

		def idle?
			@state =~ /idle/
		end

		def fall
			@state = "falling"
		end	

		def reset_speed
			@speed = 1
		end

		def falling?
			@state =~ /fall.*/
		end

		def on_floor?
			@y >= @win.height - ((@pic.height * @scale) / 4)
		end
	end
end
