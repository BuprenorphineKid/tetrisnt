class Shape

	attr_accessor :x, :y
	def initialize(blocks)
		@blocks = blocks

		@x, @y = blocks[0].x, blocks[0].y
		@state = "falling"
	end	

	def fall
		@state = "falling"
		@blocks.each {|blk| blk.fall}
	end

	def idle 
		@state = "idle"
		@blocks.each {|b| b.idle}
	end

	def idle?
		@state =~ /idle/
	end

	def reset_speed
		@blocks.each {|b| b.speed = 1}
	end	

	def x=(new)
		@x = new
		@blocks.each {|b| b.x = new}
	end

	def y=(new)
		@y = new
		@blocks.each {|b| b.y = new}
	end

	def moveable?
		@state =~ /falling/
	end

	def speed=(new)
		@y = new
		@blocks.each {|b| b.speed = new}
	end

	def update
		@blocks.each do |block|
			block.update
		end

		if @blocks[0].on_floor?
			idle
		end
	end

	def draw
		@blocks.each do |block|
			block.draw
		end
	end
end
