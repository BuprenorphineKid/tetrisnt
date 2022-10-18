module Blocks

	class Block 

		attr_accessor :moveable, :x, :y, :state, :speed
	
		def initialize(pic, win, x, y)

			@win = win
			@pic = pic

			@collides = false	
			
			@scale = (@win.height / @pic.height) / 8
			@x = x
			@y = y
			@state = "falling"
			@moveable = true

			@vel = 7
			@speed = 1
		end

		def collide!
			@collides = true
		end

		def collides?
			@collides == true
		end
		
		def update
			idle if collides? || on_floor?
			@y += @speed * @vel if falling?
		end

		def height
			return @pic.height
		end

		def width
			return @pic.height
		end
			
		def draw
			@pic.draw(@x, @y, Layer::Block, @scale, @scale)
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

		def fast_fall
			@speed *= 2
		end

		def falling?
			@state =~ /falling/
		end

		def on_floor?
			@y >= ((@win.tray.pic.height * @win.tray.scaley) * 0.775) - ((@pic.height * @scale) / 4)
		end
	end
end
