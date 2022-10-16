module Blocks

	class Shape

		attr_accessor :x, :y, :blocks
		attr_reader :top, :bottom, :left, :right, :top_points, :bottom_points
		
		def initialize(win, blocks)
			@win = win
		
			@blocks = blocks

			@x, @y = blocks[0].x, blocks[0].y
			
			@top_points = {left: {y: blocks[3].y - blocks[3].top, x: blocks[3].left - blocks[3].x},
							right: {y: blocks[3].y - blocks[3].top, x: blocks[3].right + blocks[3].x}}
		
			@bottom_points = {left: {y: blocks[0].y + blocks[0].bottom, x: blocks[0].left - blocks[0].x},
							right: {y: blocks[0].y + blocks[0].top, x: blocks[0].right + blocks[0].x}}	
							
			@collision = nil
			
			@state = "falling"

			@can_move_left = true
			@can_move_right = true
		end	

		def fall
			@state = "falling"
			@blocks.each {|blk| blk.fall}
		end

		def collide!(side)
			@collision = side
		end

		def idle 
			@state = "idle"
			@blocks.each {|b| b.idle}
		end

		def idle?
			@state =~ /[Ii][Dd][Ll][Ee]/
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
			@state =~ /[Ff][Aa][Ll][Ll][Ii][Nn][Gg]/
		end

		def speed=(new)
			@speed = new
			@blocks.each {|b| b.speed = new}
		end

		def fast_fall
			@y = ((@win.tray.pic.height * @win.tray.scaley) * 0.875) - ((@blocks[0].pic.height * @blocks[0].scale) / 4)
		end

		def update
			@blocks.each do |block|
				block.update
			end

			if @blocks[0].on_floor?
				idle
			end

			case @collision
			when /bottom/
					@state = "idle"
			when /top/
					@state = "idle"
			when /left/
					if !(on_floor?)
						@can_move_left = false
					else
						@state = "idle"
					end
			when /right/
				if !(on_floor?)
					@can_move_right = false
				else
					@state = "idle"
				end
			end
		end

		def draw
			@blocks.each do |block|
				block.draw
			end
		end
	end
end
