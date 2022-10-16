require "gosu"

module Blocks

	class Shape

		attr_accessor :x, :y, :blocks
		attr_reader :top, :bottom, :left, :right, :top_points, :bottom_points
		
		def initialize(win, blocks)
			@win = win
		
			@blocks = blocks

			@x, @y = blocks[1].x, blocks[1].y + blocks[1].top
			
			@top = @y - Gosu.distance(0, @y + blocks[3].top, 0, @y)
			@bottom = @y + Gosu.distance(0, @y + blocks[0].bottom, 0, @y)
			@left = @x - Gosu.distance(@x + blocks[3].left, 0, @x, 0)
			@right = @x + Gosu.distance(@x + blocks[3].right, 0, @x, 0)

			@top_points = {left: {y: @top, x: @left},
							right: {y: @top, x: @right}}
			
			@bottom_points = {left: {y: @bottom, x: @left},
							right: {y: @bottom, x: @right}}
												
						
			@collision = nil
			
			@state = "falling"

			@speed = 1
			@vel = 7

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

		def falling?
			@state =~ /[Ff][Aa][Ll]?/
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

		def on_floor?
			@blocks[0].y >= ((@win.tray.pic.height * @win.tray.scaley) * 0.875) - ((@blocks[0].pic.height * @blocks[0].scale) / 4)
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
		
		def fast_fall
			@speed = @speed * 1.5
			@vel += 2
		end

		def reset_speed
			@speed = 1
			@vel = 7
		end

		def update
			@blocks.each {|b| b.y += @speed * @vel} if falling?

			if on_floor?
				idle
			end

		end
			
		def draw
			@blocks.each do |block|
				block.draw
			end
		end
	end
end
