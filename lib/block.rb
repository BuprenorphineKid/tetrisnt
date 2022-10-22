module Blocks

	class Block 


		attr_accessor :moveable, :x, :y, :state, :speed
		attr_reader :vel

		def self.height
			Tools.load_obj("red", "block").height
		end

		def self.width
			Tools.load_obj("red", "block").width
		end

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
			idle if collides?
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

		def falling?
			@state =~ /falling/
		end

		def snap_to(obj)
			@y = obj.y - @pic.height
		end

		def next_y
			@y + (@speed * @vel)
		end
	end
end
