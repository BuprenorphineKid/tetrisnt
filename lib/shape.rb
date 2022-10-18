require "gosu"

module Blocks

	class Shape

	attr_accessor :blocks
	attr_reader :top, :bottom, :left, :right, :top_points, :bottom_points,
						:y, :x
		
		def initialize(blocks)

			@blocks = blocks

			@can_move_left = true
			@can_move_right = true
		end

		def fall
			@state = "falling"
			@blocks.each {|blk| blk.fall}
		end

		def fast_fall
			@blocks.each {|blk| blk.fast_fall}
		end
	
		def idle?
			idled = @blocks.select {|e| e.idle?}
			return true if idled.size.eql? @blocks.size
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

		def speed=(new)
			@speed = new
			@blocks.each {|b| b.speed = new}
		end

		def move_left
			@blocks.each {|b| b.x -= 63}
		end

		def move_right
			@blocks.each {|b|	b.x += 63}
		end
		
		def update
			@blocks.each do |b| 
				b.update
			end
		end
			
		def draw
			@blocks.each do |block|
				block.draw
			end
		end
	end
end
